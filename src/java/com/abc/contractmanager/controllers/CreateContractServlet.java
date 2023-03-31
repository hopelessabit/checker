/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abc.contractmanager.controllers;

import com.abc.contractmanager.dao.ContractDAO;
import com.abc.contractmanager.dao.OwnerDAO;
import com.abc.contractmanager.dao.RoomDAO;
import com.abc.contractmanager.dao.UserDAO;
import com.abc.contractmanager.dto.OwnerDTO;
import com.abc.contractmanager.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import static com.abc.contractmanager.utils.Utilities.*;
import java.math.BigDecimal;

/**
 *
 * @author mical
 */
public class CreateContractServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            OwnerDTO owner = (OwnerDTO) request.getSession().getAttribute("user");
            int OID = owner.getOID();

            String contractName = request.getParameter("txtContractName");

            int RoID = Integer.parseInt(request.getParameter("RoID"));

            String txtlessee = request.getParameter("txtLessee");

            String txtLCID = request.getParameter("txtLCID");

            double rentalFee = Double.parseDouble(request.getParameter("intRentalFee"));

            int userID = 0;
            UserDTO user = UserDAO.getUserByNameAndCID(txtlessee, txtLCID);
            userID = user.getUID();

            Date from = Date.valueOf(request.getParameter("dateFrom"));

            Date to = Date.valueOf(request.getParameter("dateTo"));
            
            BigDecimal systemFee = BigDecimal.valueOf(Float.parseFloat(request.getParameter("systemFee")));
            
            request.setCharacterEncoding("UTF-8");
            String description = request.getParameter("txtDescription");
            ContractDAO.createContract(RoID, userID, OID, BigDecimal.valueOf(rentalFee), from, to, contractName, description);
            RoomDAO.updateRoomUID(RoID, user.getUID());
            OwnerDAO.subtractCredit(OID, owner.getCredit(), systemFee);
            request.getSession().setAttribute("user", OwnerDAO.getOwnerByOID(OID));
            request.setAttribute("noti", "Create contract successed!");
            request.getRequestDispatcher("CreateContract.jsp").forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
