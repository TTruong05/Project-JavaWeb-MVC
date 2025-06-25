package truong.dev.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import truong.dev.data.dao.OrderItemDao;
import truong.dev.data.driver.MySQLDriver;
import truong.dev.data.model.OrderItem;

public class OrderItemImpl implements OrderItemDao {
	Connection con = MySQLDriver.getInstance().getConnection();

        @Override
        public boolean insert(OrderItem orderItem) {
            String sql = "INSERT INTO ORDER_ITEMS(ID, QUANTITY, PRICE, ORDER_ID, PRODUCT_ID) VALUES(NULL, ?, ?, ?, ?)";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, orderItem.getQuantity());
                stmt.setDouble(2, orderItem.getPrice());
                stmt.setInt(3, orderItem.getOrderId());
                stmt.setInt(4, orderItem.getProductId());

                return stmt.executeUpdate() > 0; // Sử dụng executeUpdate() và trả về kết quả
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
}

	@Override
        public boolean update(OrderItem orderItem) {
            String sql = "UPDATE ORDER_ITEMS SET quantity = ?, price = ?, order_id = ?, product_id = ? WHERE id = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, orderItem.getQuantity());
                stmt.setDouble(2, orderItem.getPrice());
                stmt.setInt(3, orderItem.getOrderId());
                stmt.setInt(4, orderItem.getProductId());
                stmt.setInt(5, orderItem.getId());
                return stmt.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }

	@Override
        public boolean delete(int id) {
            String sql = "DELETE FROM ORDER_ITEMS WHERE ID = ?"; // Sửa tên bảng từ ORDER-ITEMS thành ORDER_ITEMS
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, id);
                return stmt.executeUpdate() > 0;
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return false;
        }

	@Override
        public OrderItem find(int id) {
            String sql = "SELECT * FROM ORDER_ITEMS WHERE ID = ?"; // Sửa SQL query và tên bảng
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, id);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) { // Dùng if thay vì while vì chỉ mong đợi 1 kết quả
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        int orderId = rs.getInt("order_id");
                        int productId = rs.getInt("product_id");

                        return new OrderItem(id, quantity, price, orderId, productId); // Truyền ID vào constructor
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return null;
        }

	@Override
        public List<OrderItem> findAll() {
            List<OrderItem> orList = new ArrayList<>();
            String sql = "SELECT * FROM ORDER_ITEMS"; // Sửa tên bảng từ CATEGORIES thành ORDER_ITEMS
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        int orderId = rs.getInt("order_id");
                        int productId = rs.getInt("product_id");

                        orList.add(new OrderItem(id, quantity, price, orderId, productId)); // Thêm ID vào constructor
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return orList;
        }
	@Override
        public List<OrderItem> findByOrder(int orderId) {
            List<OrderItem> orderItemList = new ArrayList<>();
            String sql = "SELECT * FROM ORDER_ITEMS WHERE order_id = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, orderId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int id = rs.getInt("id"); // Lấy ID của order item
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        int productId = rs.getInt("product_id");
                        orderItemList.add(new OrderItem(id, quantity, price, orderId, productId)); // Thêm ID
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return orderItemList;
        }

	@Override
        public List<OrderItem> findByProduct(int productId) {
            List<OrderItem> orderItemList = new ArrayList<>();
            String sql = "SELECT * FROM ORDER_ITEMS WHERE product_id = ?";
            try (PreparedStatement stmt = con.prepareStatement(sql)) {
                stmt.setInt(1, productId);
                try (ResultSet rs = stmt.executeQuery()) {
                    while (rs.next()) {
                        int id = rs.getInt("id");
                        int quantity = rs.getInt("quantity");
                        double price = rs.getDouble("price");
                        int orderId = rs.getInt("order_id");
                        orderItemList.add(new OrderItem(id, quantity, price, orderId, productId));
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return orderItemList;
        }

}