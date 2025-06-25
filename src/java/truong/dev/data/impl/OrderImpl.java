package truong.dev.data.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import truong.dev.data.dao.OrderDao;
import truong.dev.data.driver.MySQLDriver;
import truong.dev.data.model.Order;
import java.util.logging.Logger;
import java.util.logging.Level;
import truong.dev.data.dao.DatabaseDao;

public class OrderImpl implements OrderDao {

    Connection con = MySQLDriver.getInstance().getConnection();

    @Override
    public boolean insert(Order order) {
        String sql = "INSERT INTO ORDERS(ID, CODE, STATUS, USER_ID) VALUES(NULL, ?, ?, ?)";
        try (PreparedStatement stmt = con.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS)) {
            stmt.setString(1, order.getCode());
            stmt.setString(2, order.getStatus());
            stmt.setInt(3, order.getUserId());

            int affectedRows = stmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        order.setId(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Order order) {
        String sql = "UPDATE ORDERS SET code = ?, status = ?, user_id = ? WHERE id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, order.getCode());
            stmt.setString(2, order.getStatus());
            stmt.setInt(3, order.getUserId());
            stmt.setInt(4, order.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM ORDERS WHERE ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Order find(int id) {
        String sql = "SELECT * FROM ORDERS WHERE ID = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String code = rs.getString("code");
                    String status = rs.getString("status");
                    int userId = rs.getInt("user_id");
                    Timestamp created_at = rs.getTimestamp("created_at");

                    return new Order(id, code, status, userId, created_at);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Order> findAll() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM ORDERS";
        try (PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                int id = rs.getInt("id");
                String code = rs.getString("code");
                String status = rs.getString("status");
                int userId = rs.getInt("user_id");
                Timestamp created_at = rs.getTimestamp("created_at");

                orders.add(new Order(id, code, status, userId, created_at));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    @Override
    public List<Order> findByUser(int userId) {
        List<Order> orderList = new ArrayList<>();
        String sql = "SELECT * FROM ORDERS WHERE user_id = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String code = rs.getString("code");
                    String status = rs.getString("status");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    orderList.add(new Order(id, code, status, userId, createdAt));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderList;
    }

    @Override
    public List<Order> findByStatus(String status) {
        List<Order> orderList = new ArrayList<>();
        try (PreparedStatement stmt = con.prepareStatement("SELECT * FROM ORDERS WHERE STATUS = ?")) {
            stmt.setString(1, status);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String code = rs.getString("code");
                    int userId = rs.getInt("user_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");
                    orderList.add(new Order(id, code, status, userId, createdAt));
                }
            }
        } catch (SQLException ex) {
             Logger.getLogger(OrderImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return orderList;
    }

    @Override
    public Order findByCode(String code) {
        String sql = "SELECT * FROM ORDERS WHERE CODE= ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, code);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String status = rs.getString("status");
                    int userId = rs.getInt("user_id");
                    Timestamp createdAt = rs.getTimestamp("created_at");

                    return new Order(id, code, status, userId, createdAt);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public int countOrderByDay(String date) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM orders WHERE DATE(created_at)=?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, date);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    count = rs.getInt("count");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    // TRIỂN KHAI PHƯƠNG THỨC MỚI NÀY
    @Override
    public int countOrderByDayAndStatus(String date, String status) {
        int count = 0;
        String sql = "SELECT COUNT(*) AS count FROM orders WHERE DATE(created_at) = ? AND status = ?";
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, date);
            stmt.setString(2, status);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) { // Dùng if vì chỉ mong đợi 1 hàng kết quả COUNT
                    count = rs.getInt("count");
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return count;
    }

    @Override
    public double earningOrderByDay(String date) {
        double total = 0;
        String sql = "SELECT id FROM orders WHERE DATE(created_at)=?"; // Chỉ cần ID để tìm OrderItems
        try (PreparedStatement stmt = con.prepareStatement(sql)) {
            stmt.setString(1, date);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    int orderId = rs.getInt("id");
                    // Lấy các order item cho mỗi order và tính tổng
                    List<truong.dev.data.model.OrderItem> orderItems = DatabaseDao.getInstance().getOrderItemDao().findByOrder(orderId);
                    for (truong.dev.data.model.OrderItem item : orderItems) {
                        total += item.getQuantity() * item.getPrice();
                    }
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(OrderImpl.class.getName()).log(Level.SEVERE, null, ex);
        }
        return total;
    }
}