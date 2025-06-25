
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package truong.dev.admin.user;

import truong.dev.BaseServlet;
import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.UserDAO;
import truong.dev.data.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
/**
 *
 * @author Welcome
 */
public class CreateUserServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/user/create.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String repeatPass = request.getParameter("repassword");
        String role = request.getParameter("role");
        UserDAO userDao = DatabaseDao.getInstance().getUserDao();
        User user = userDao.find(email);
        HttpSession session = request.getSession();
        //        Kiểm tra thông tin đăng ký 
        // Xử lý lỗi khi nhập thông tin thiếu
        if (email.isEmpty() || password.isEmpty() || repeatPass.isEmpty() || role.isEmpty()) {

            session.setAttribute("error", "Vui lòng điền đầy đủ thông tin đăng ký");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
            // Xử lý lỗi khi emai trùng
        } else if (user != null) {
            session.setAttribute("error", "Email trùng");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
            // Xử lý lỗi khi mật khẩu nhập lại không đúng
        } else if (!password.equals(repeatPass)) {
            session.setAttribute("error", "Mật khẩu nhập lại không trùng");
            request.getRequestDispatcher("admin/user/create.jsp").forward(request, response);
        } else {
            // Xử lý thông tin đăng ký hợp lệ
            user = new User(email, password, role);
            userDao.insert(user);
            response.sendRedirect("IndexUserServlet");
        }
    }

}