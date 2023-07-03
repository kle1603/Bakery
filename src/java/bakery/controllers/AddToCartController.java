/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.AccountDAO;
import bakery.dao.CartDAO;
import bakery.dto.AccountDTO;
import bakery.dto.BreadDTO;
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
public class AddToCartController extends HttpServlet {

    private static final String ERROR = "product.jsp";
    private static final String SUCCESS = "product.jsp";
    private static final int PRODUCTS_PER_PAGE = 12;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;

        try {
            String customerId = request.getParameter("customerId");
            String breadId = request.getParameter("breadId");
            String search = request.getParameter("search");
            String page = request.getParameter("page");
            AccountDAO dao = new AccountDAO();
            List<BreadDTO> breadList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);

            if (dao.addItem(customerId, breadId)) {
                HttpSession session = request.getSession();
                CartDAO cart = new CartDAO();
                List<CartItemDTO> cartItems = cart.getCartItems(Integer.parseInt(customerId));
                int totalItems = cartItems.size();
                int totalProducts = dao.totalProducts;

                request.setAttribute("SUCCESS_BREAD", true);
                session.setAttribute("TOTAL_ITEMS", totalItems);
                request.setAttribute("BREAD_LIST", breadList);
                request.setAttribute("search", search);
                request.setAttribute("page", page);
                request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                request.setAttribute("TOTAL_PRODUCT", totalProducts);

                url = SUCCESS;
            } else {
                CartDAO cart = new CartDAO();
                List<CartItemDTO> cartItems = cart.getCartItems(Integer.parseInt(customerId));
                int totalItems = cartItems.size();
                int totalProducts = dao.totalProducts;

                request.setAttribute("BREAD_LIST", breadList);
                request.setAttribute("search", search);
                request.setAttribute("page", page);
                request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                request.setAttribute("TOTAL_PRODUCT", totalProducts);
                request.setAttribute("ERROR_BREAD", true);

                url = ERROR;
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
