/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package truong.dev.admin.user;

import truong.dev.admin.BaseAdminServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.UserDAO;
import java.io.IOException;

/**
 *
 * @author duong van truong
 */
public class DeleteUserServlet extends BaseAdminServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        UserDAO userDao = DatabaseDao.getInstance().getUserDao(); 
        userDao.delete(userId);

        response.sendRedirect("IndexUserServlet");
    }

}

