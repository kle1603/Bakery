/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.CartDAO;
import bakery.dto.CartItemDTO;
import bakery.dto.OrderDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kle
 */
public class PaymentController extends HttpServlet {

    private static final String ERROR = "checkout.jsp";
    private static final String SUCCESS = "payment.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();

            int customerId = (int) session.getAttribute("CUSTOMER_ID");
            String totalAmount = request.getParameter("totalAmount");
            
            String paymentMethod = request.getParameter("paymentMethod");

            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            CartDAO cart = new CartDAO();
            boolean insertOrder = cart.insertOrder(customerId, Double.parseDouble(totalAmount));
            
            OrderDTO order = cart.getOrderId(customerId, Double.parseDouble(totalAmount));
            int orderId = order.getOrderId();
            
            boolean updateOrder = cart.updateOrder(customerId, orderId, firstName, lastName, address, phone, Integer.parseInt(paymentMethod));
            
            if (insertOrder) {
                if (updateOrder) {
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            log("error at LoginController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
