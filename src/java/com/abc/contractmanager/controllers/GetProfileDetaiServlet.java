/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abc.contractmanager.controllers;

import com.abc.contractmanager.dao.AdminDAO;
import com.abc.contractmanager.dao.OwnerDAO;
import com.abc.contractmanager.dao.UserDAO;
import com.abc.contractmanager.dto.AdminDTO;
import com.abc.contractmanager.dto.OwnerDTO;
import com.abc.contractmanager.dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author mical
 */
public class GetProfileDetaiServlet extends HttpServlet {

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
            String keyword = request.getParameter("keyword");
            request.setAttribute("keyword", keyword);
            int id = Integer.parseInt(request.getParameter("id"));
            char viewUserType = request.getParameter("role").charAt(0);
            request.setAttribute("role", viewUserType);
            switch (viewUserType) {
                case ('O'):
                    OwnerDTO owner = OwnerDAO.getOwnerByOID(id);
                    request.setAttribute("txtFullName", owner.getFullName());
                    request.setAttribute("txtcid", owner.getCID());
                    request.setAttribute("txtAddress", owner.getAddress());
                    request.setAttribute("txtDob", owner.getDateOfBirth().toString());
                    request.setAttribute("account", owner);
                    break;
                case ('A'):
                    AdminDTO admin = AdminDAO.getAdminDetail(id);
                    request.setAttribute("txtFullName", admin.getFullName());
                    request.setAttribute("txtcid", admin.getCID());
                    request.setAttribute("txtAddress", admin.getAddress());
                    request.setAttribute("account", admin);
                    break;
                default:
                    UserDTO user = UserDAO.getUserByUID(id);
                    request.setAttribute("txtFullName", user.getFullName());
                    request.setAttribute("txtcid", user.getCID());
                    request.setAttribute("txtAddress", user.getAddress());
                    request.setAttribute("txtDob", user.getDateOfBirth().toString());
                    request.setAttribute("account", user);
                    break;
            }
            request.setAttribute("accountID", id);
            request.getRequestDispatcher("SearchUserServlet").forward(request, response);
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