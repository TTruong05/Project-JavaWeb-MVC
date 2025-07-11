/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package truong.dev.admin.category;

import truong.dev.admin.BaseAdminServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import truong.dev.data.dao.DatabaseDao;
import java.io.IOException;
import truong.dev.data.dao.CategoryDao;

/**
 *
 * @author duong van truong
 */
public class DeleteCategoryServlet extends BaseAdminServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int categoryId = Integer.parseInt(request.getParameter("categoryId"));
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao(); 
        categoryDao.delete(categoryId);

        response.sendRedirect("IndexCategoryServlet");
    }

}

