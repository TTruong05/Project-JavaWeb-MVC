package truong.dev.admin.pay;

import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.OrderDao;
import truong.dev.data.dao.OrderItemDao;
import truong.dev.data.model.Order;
import truong.dev.data.model.OrderItem;
import truong.dev.data.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import java.util.UUID; // Để tạo mã đơn hàng duy nhất

public class CheckoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user"); // Lấy thông tin người dùng từ session

        if (user == null) {
            // Nếu người dùng chưa đăng nhập, chuyển hướng về trang đăng nhập
            response.sendRedirect("login.jsp");
            return;
        }

        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart"); // Lấy giỏ hàng từ session

        if (cart == null || cart.isEmpty()) {
            // Nếu giỏ hàng trống, chuyển hướng về trang chủ hoặc trang giỏ hàng
            response.sendRedirect("HomeServlet"); // Hoặc "cart.jsp"
            return;
        }

        // Tạo một mã đơn hàng duy nhất
        String orderCode = UUID.randomUUID().toString().substring(0, 8).toUpperCase();

        // Tạo đối tượng Order
        Order order = new Order(orderCode, Order.PENDING, user.getId()); // Ban đầu trạng thái là PENDING

        OrderDao orderDao = DatabaseDao.getInstance().getOrderDao();
        OrderItemDao orderItemDao = DatabaseDao.getInstance().getOrderItemDao();

        // Chèn Order vào cơ sở dữ liệu
        if (orderDao.insert(order)) {
            // Lấy lại Order vừa được chèn để có ID (nếu ID được tạo tự động trong DB)
            Order newOrder = orderDao.findByCode(orderCode); // Lấy order vừa insert ra để có ID

            if (newOrder != null) {
                // Chèn các OrderItem vào cơ sở dữ liệu
                for (OrderItem item : cart) {
                    OrderItem newOrderItem = new OrderItem(item.getQuantity(), item.getPrice(), newOrder.getId(), item.getProductId());
                    orderItemDao.insert(newOrderItem);
                }

                // Xóa giỏ hàng khỏi session sau khi thanh toán thành công
                session.removeAttribute("cart");

                 // --- PHẦN THAY ĐỔI Ở ĐÂY ---
                // Chuyển hướng người dùng về trang chủ với một tham số thông báo thành công
                response.sendRedirect("index.jsp?orderSuccess=true");
                return; // Đảm bảo không có mã nào chạy sau lệnh redirect
            } else {
                request.setAttribute("errorMessage", "Error processing your order. Please try again.");
                request.getRequestDispatcher("cart.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("errorMessage", "Error processing your order. Please try again.");
            request.getRequestDispatcher("cart.jsp").forward(request, response);
        }
    }
}