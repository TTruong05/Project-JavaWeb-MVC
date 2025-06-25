package truong.dev.data.model;

import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.model.OrderItem; // Import OrderItem
import java.sql.Timestamp;
import java.util.List; // Import List

public class Order {

    private int id;
    private String code;
    private String status;
    private int userId;
    private Timestamp createdAt;

    public static final String PENDING = "pending";
    public static final String FINISHED = "finished";

    public Order(String code, String status, int userId) {
        super();
        this.code = code;
        this.status = status;
        this.userId = userId;
    }

    public Order(int id, String code, String status, int userId, Timestamp createdAt) {
        super();
        this.id = id;
        this.code = code;
        this.status = status;
        this.userId = userId;
        this.createdAt = createdAt;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    public User getUser(){
        return DatabaseDao.getInstance().getUserDao().find(this.userId);
    }

    // Thêm phương thức getTotal() vào đây
    public double getTotal() {
        double total = 0;
        // Lấy tất cả OrderItem liên quan đến đơn hàng này
        List<OrderItem> orderItems = DatabaseDao.getInstance().getOrderItemDao().findByOrder(this.id);
        
        // Duyệt qua từng OrderItem để tính tổng
        for (OrderItem item : orderItems) {
            total += item.getQuantity() * item.getPrice();
        }
        return total;
    }
}