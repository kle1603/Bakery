/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.CartDAO;
import bakery.dto.CartItemDTO;
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
public class UpdateController extends HttpServlet {

    private static final String ERROR = "cart.jsp";
    private static final String SUCCESS = "cart.jsp";
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            int customerId = (int) session.getAttribute("CUSTOMER_ID");
            
            String quantity = request.getParameter("quantity");    
            String breadId = request.getParameter("breadId");
            String cartId = request.getParameter("cartId");
            
            CartDAO cart = new CartDAO();
            int bId = Integer.parseInt(breadId);
            int qt = Integer.parseInt(quantity);
            int cId = Integer.parseInt(cartId);
            boolean cartList = cart.updateItem(qt, bId, cId);
            if (cartList) {
                List<CartItemDTO> cartItemList = cart.getItemsByCus(customerId);
                List<CartItemDTO> cartItems = cart.getCartItems(customerId);
                int totalItems = cartItems.size();
                session.setAttribute("ITEM_LIST", cartItemList);
                session.setAttribute("TOTAL_ITEMS", totalItems);
                url = SUCCESS;
            } else {

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
