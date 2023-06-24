/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bakery.controllers;

import bakery.dao.AccountDAO;
import bakery.dto.BreadDTO;
import java.io.IOException;
import java.io.PrintWriter;
import static java.util.Collections.list;
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
public class ProductController extends HttpServlet {

    private static final String ERROR = "product.jsp";
    private static final String SUCCESS = "product.jsp";
    private static final int PRODUCTS_PER_PAGE = 9;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            HttpSession session = request.getSession();
            Integer page = (Integer) session.getAttribute("page");

            if (page == null || request.getParameter("page") == null) {
                page = 1;
            } else {
                page = Integer.parseInt(request.getParameter("page"));
            }

            // Lấy tổng số sản phẩm
            AccountDAO accountDAO = new AccountDAO();
            int totalProducts = accountDAO.getTotalProducts();

            int totalPages = (int) Math.ceil((double) totalProducts / PRODUCTS_PER_PAGE);
            int pageNumber = Math.min(page, totalPages);
//            int pageNumber = page;
            // Mặc định endIndex là 9
            int numberOfProductPerPage = PRODUCTS_PER_PAGE;

            // Thực hiện xử lý logic để lấy danh sách sản phẩm
            List<BreadDTO> breadList = accountDAO.getListProduct(pageNumber, numberOfProductPerPage);
            if (!breadList.isEmpty()) {
                request.setAttribute("BREAD_LIST", breadList);
                request.setAttribute("TOTAL_PAGES", totalPages);
                request.setAttribute("CURRENT_PAGE", pageNumber);
                request.setAttribute("PRODUCTS_PER_PAGE", PRODUCTS_PER_PAGE);
                url = SUCCESS;
            } else {
                request.setAttribute("MESSAGE", "No products found.");
            }

            // Lưu giá trị số lần bấm vào session
            session.setAttribute("page", page);
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
