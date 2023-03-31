/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.abc.contractmanager.controllers;

import com.abc.contractmanager.dao.OwnerDAO;
import com.abc.contractmanager.dao.RoomDAO;
import com.abc.contractmanager.dto.OwnerDTO;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.pdfbox.Loader;
import org.apache.pdfbox.pdmodel.PDDocument;
import org.apache.pdfbox.text.PDFTextStripper;

/**
 *
 * @author mical
 */
public class ReadContractPDFServlet extends HttpServlet {

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
            String path = (String) request.getAttribute("path");
            File file = new File(path);
            PDDocument doc = Loader.loadPDF(file);
            String PDF_content = new PDFTextStripper().getText(doc);
            System.out.println(PDF_content);
            String RoID = "";
            String CID = "";
            for (String str : PDF_content.split("\n")) {
                if (str.contains("Room number")) {
                    RoID = str.split(": ")[1].trim();
                } else if (str.contains("fica") && str.contains(":")) {
                    CID = str.split(": ")[1].trim();
                    break;
                }
            }
            doc.close();
            OwnerDTO owner = OwnerDAO.getOwnerByCID(CID);
            if (owner == null) {
                request.setAttribute("noti", "User not exist in the system!");
                request.getRequestDispatcher("AddRoom.jsp").forward(request, response);
            } else if (RoomDAO.isRoomFree(Integer.parseInt(RoID))) {
                request.setAttribute("noti", "Something wrong!");
                request.getRequestDispatcher("AddRoom.jsp").forward(request, response);
            } else {
                request.setAttribute("owner", owner);
                request.setAttribute("room", RoID);
                request.getRequestDispatcher("AddRoom.jsp").forward(request, response);
            }

//            out.print("<h1>" + RoID + "</h1>");
//            out.print("<h1>" + CID + "</h1>");
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
