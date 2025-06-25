package truong.dev.data.dao;

import java.util.List;
import truong.dev.data.model.OrderItem;

public interface OrderItemDao {

    public boolean insert(OrderItem orderItem);

    public boolean update(OrderItem orderItem);

    public boolean delete(int id);

    public OrderItem find(int id);

    public List<OrderItem> findAll();

    public List<OrderItem> findByOrder(int id);

    public List<OrderItem> findByProduct(int id);

}