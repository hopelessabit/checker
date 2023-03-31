/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abc.contractmanager.paypal;

import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author mical
 */
public class PaymentServices {

    private static final String CLIENT_ID = "ATAfrLzGaKa9vFvo9kRHvb-KF6UzDc-ESnkaE-tB7hFkz3C_-9pjy-c2MxvpauhZiXRBw1H0dp3YLO2C";
    private static final String CLIENT_SECRET = "EIsz0va1I1Hnnj2k9nMjOC8uUc0mLLsgtdpE_uI9lcBpb1xVj_vHHytT7gyQM5KMay06iTQP_WTOlr1G";
    private static final String MODE = "sandbox";

    public String authorizePayment(OrderDetail orderDetail, String name) throws PayPalRESTException {

        Payer payer = getPayerInformation(name);
        RedirectUrls redirectUrls = getRedirectUrls();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);

        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction)
                .setRedirectUrls(redirectUrls)
                .setPayer(payer)
                .setIntent("authorize");

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        Payment approvedPayment = requestPayment.create(apiContext);

        System.out.println(approvedPayment);

        return getApprovalLink(approvedPayment);
    }

    private RedirectUrls getRedirectUrls() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/contractmanager/Cancel.html");
        redirectUrls.setReturnUrl("http://localhost:8080/contractmanager/ReviewPaymentServlet");
        return redirectUrls;
    }

    private Payer getPayerInformation(String name) {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
        String[] fullName = name.split(" ");
        PayerInfo payerInfo = new PayerInfo();
        payerInfo.setFirstName(fullName[0])
                .setLastName(fullName[fullName.length - 1])
                .setEmail("sb-oxo47s25404468@personal.example.com");
        if (fullName.length >= 3) {
            String middleName = "";
            for (int i = 1; i < fullName.length - 1; i++) {
                middleName += fullName[i];
            }
            payerInfo.setMiddleName(middleName);
        }

        payer.setPayerInfo(payerInfo);

        return payer;
    }

    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
        Details details = new Details();
        details.setShipping("0");
        details.setSubtotal(orderDetail.getMoney());
        details.setTax("0");

        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getMoney());
        amount.setDetails(details);

        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription("Add credit in Contract Management Web App");

        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();

        Item item = new Item();
        item.setCurrency("USD");
        item.setName("Add credit in Contract Management Web App");
        item.setPrice(orderDetail.getMoney());
        item.setTax("0");
        item.setQuantity("1");

        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);

        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);

        return listTransaction;
    }

    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = "";
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
            }
        }
        return approvalLink;
    }

    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return Payment.get(apiContext, paymentId);
    }

    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);

        Payment payment = new Payment().setId(paymentId);

        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);

        return payment.execute(apiContext, paymentExecution);
    }
}
