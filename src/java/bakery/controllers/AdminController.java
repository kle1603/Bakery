/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.AccountDAO;
import bakery.dao.AdminDAO;
import bakery.dto.BreadDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kle
 */
public class AdminController extends HttpServlet {

    private static final String ERROR = "admin.jsp";
    private static final String SUCCESS = "admin.jsp";
    private static final int PRODUCTS_PER_PAGE = 6;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        String breadId = request.getParameter("breadId");
        String breadName = request.getParameter("breadName");
        String typeId = request.getParameter("typeId");
        String quantity = request.getParameter("quantity");
        String price = request.getParameter("price");
        String page = request.getParameter("page");
        String search = request.getParameter("search");
        String delete = request.getParameter("delete");
        try {
            if (page == null) {
                page = "1";
            }

            AccountDAO dao = new AccountDAO();

            AdminDAO admin = new AdminDAO();
            if (breadId != null && delete == null) {

                boolean checkUpdate = admin.updateBreadByAdmin(Integer.parseInt(breadId), breadName, Integer.parseInt(typeId), Integer.parseInt(quantity), Double.parseDouble(price));
                if (checkUpdate) {
                    List<BreadDTO> breadList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
                    int totalProducts = dao.totalProducts;

                    if (!breadList.isEmpty()) {
                        request.setAttribute("ADMIN_PRODUCT_LIST", breadList);
                        request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                        request.setAttribute("TOTAL_PRODUCT", totalProducts);
                        url = SUCCESS;
                    } else {
                        request.setAttribute("MESSAGE", "No products found.");
                    }

                    request.setAttribute("page", page);
                }

            } else if (delete != null) {

                boolean checkDelete = admin.deleteBreadByAdmin(Integer.parseInt(breadId));
                if (checkDelete) {
                    List<BreadDTO> breadList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
                    int totalProducts = dao.totalProducts;

                    if (!breadList.isEmpty()) {
                        request.setAttribute("ADMIN_PRODUCT_LIST", breadList);
                        request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                        request.setAttribute("TOTAL_PRODUCT", totalProducts);
                        url = SUCCESS;
                    } else {
                        request.setAttribute("MESSAGE", "No products found.");
                    }

                    request.setAttribute("page", page);
                } else {
                    List<BreadDTO> breadList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
                    int totalProducts = dao.totalProducts;

                    if (!breadList.isEmpty()) {
                        request.setAttribute("ADMIN_PRODUCT_LIST", breadList);
                        request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                        request.setAttribute("TOTAL_PRODUCT", totalProducts);
                        request.setAttribute("ERROR_DELETE_ADMIN", true);
                        url = SUCCESS;
                    } else {
                        request.setAttribute("MESSAGE", "No products found.");
                    }

                    request.setAttribute("page", page);
                }

            } else {
                List<BreadDTO> breadList = dao.getListProduct(Integer.parseInt(page), PRODUCTS_PER_PAGE, search);
                int totalProducts = dao.totalProducts;

                if (!breadList.isEmpty()) {
                    request.setAttribute("ADMIN_PRODUCT_LIST", breadList);
                    request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                    request.setAttribute("TOTAL_PRODUCT", totalProducts);
                    url = SUCCESS;
                } else {
                    request.setAttribute("MESSAGE", "No products found.");
                }

                request.setAttribute("page", page);
            }

        } catch (Exception e) {
            log("Error at ProductController: " + e.toString());
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
