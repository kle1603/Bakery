/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.AccountDAO;
import bakery.dao.AdminDAO;
import bakery.dao.CartDAO;
import bakery.dto.AccountDTO;
import bakery.dto.BreadDTO;
import bakery.dto.CartItemDTO;
import bakery.dto.OrderDTO;
import bakery.dto.RoleDTO;
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
 * @author kle
 */
public class LoginController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private static final String US_PAGE = "index.jsp";
    private static final String AD_PAGE = "adminHome.jsp";

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";
    private static final int PRODUCTS_PER_PAGE = 6;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            AccountDAO dao = new AccountDAO();
            AccountDTO accountUser = dao.checkLogin(username, password);

            HttpSession session = request.getSession();

            if (accountUser == null) {
                request.setAttribute("ERROR_LOGIN", true);
            } else {
                RoleDTO role = accountUser.getRole();
                String roleId = role.getRoleId().trim();
                if (roleId.equals("US")) {
                    int customerId = accountUser.getCustomer().getCustomerId();

                    CartDAO cart = new CartDAO();
                    List<CartItemDTO> cartItems = cart.getCartItems(customerId);
                    int totalItems = cartItems.size();

                    List<OrderDTO> orderList = cart.getOrderList(customerId);
                    int totalOrder = orderList.size();

                    session.setAttribute("LOGIN_USER", accountUser);
                    session.setAttribute("TOTAL_ITEMS", totalItems);
                    session.setAttribute("CUSTOMER_ID", customerId);
                    session.setAttribute("ORDER_SIZE", totalOrder);
                    session.setAttribute("ROLE_ID", roleId);

                    url = US_PAGE;
                } else if (roleId.equals("AD")) {
                    session.setAttribute("ROLE_ID", roleId);

                    url = AD_PAGE;
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
