/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.AccountDAO;
import bakery.dto.AccountDTO;
import bakery.dto.RoleDTO;
import java.io.IOException;
import java.io.PrintWriter;
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

    private static final String LOGIN_PAGE="login.jsp";
    private static final String ADMIN_PAGE="index.jsp";
    private static final String USER_PAGE="index.jsp";
    private static final String US="US";
    private static final String AD="AD";


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            AccountDAO dao = new AccountDAO();
            AccountDTO accountUser= dao.checkLogin(username, password);
            
            if(accountUser == null){
                request.setAttribute("ERROR", "Incorrect userID or password");
            }else {
                RoleDTO role = accountUser.getRole();
                HttpSession session = request.getSession();
                
                if(role.getRoleId().trim().equals("AD")){
                    url= ADMIN_PAGE;
                    session.setAttribute("LOGIN_USER", accountUser);
                } else if(role.getRoleId().trim().equals("US")){
                    url=USER_PAGE;
                    session.setAttribute("LOGIN_USER", accountUser);
                } else{
                    request.setAttribute("ERROR", "Your role is not support! ");
                }
            }
        } catch (Exception e) {
            log("error at LoginController: " +e.toString());
        } finally{
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
