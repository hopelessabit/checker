/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abc.contractmanager.paypal;

/**
 *
 * @author mical
 */
public class OrderDetail {
    private float money;

    public OrderDetail() {
    }

    public OrderDetail(String money) {
        this.money = Float.parseFloat(money);
    }

    public String getMoney() {
        return String.format("%.2f", money);
    }

    public void setMoney(float money) {
        this.money = money;
    }

}
