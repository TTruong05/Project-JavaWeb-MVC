package truong.dev;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.ProductDao;
import truong.dev.data.dao.CategoryDao; // Import CategoryDao
import truong.dev.data.model.Product;
import truong.dev.data.model.Category; // Import Category
import truong.dev.util.Constants;

/**
 *
 * @author duong van truong
 */
public class ShopServlet extends BaseServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        List<Product> productList = productDao.findAll();

        if (request.getParameter("page") != null) {
            int page = Integer.parseInt(request.getParameter("page"));
            int total = productList.size();
            int numberPage = total / Constants.PER_PAGE;
            productList = productDao.getProducts((page-1) * Constants.PER_PAGE, Constants.PER_PAGE);

            request.setAttribute("total", total);
            request.setAttribute("page", page);
            request.setAttribute("numberPage", numberPage);
        }
        // Đặt lại tên thuộc tính sản phẩm về "productList" nếu shop.jsp mong đợi tên này
        // Hoặc bạn có thể giữ "hotProductList" và điều chỉnh shop.jsp tương ứng
        request.setAttribute("hotProductList", productList); // Sử dụng lại "productList"

        // THÊM ĐOẠN CODE NÀY ĐỂ LẤY VÀ THIẾT LẬP categoryList
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll(); // Giả sử có phương thức findAll() trong CategoryDao
        request.setAttribute("categoryList", categoryList);
        // KẾT THÚC ĐOẠN CODE CẦN THÊM

        request.getRequestDispatcher("shop.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}

