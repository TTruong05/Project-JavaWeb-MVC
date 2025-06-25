package truong.dev;

import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.ProductDao;
import truong.dev.data.dao.CategoryDao;
import truong.dev.data.model.Product;
import truong.dev.data.model.Category;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author Welcome
 */
public class SearchServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("query"); // Đã sửa từ "keyword" sang "query"
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        List<Product> productList = null;

        if (keyword != null && !keyword.trim().isEmpty()) {
            productList = productDao.findByName(keyword.trim());
        } else {
            productList = new ArrayList<>();
        }
                
        request.setAttribute("keyword", keyword); // Vẫn giữ tên "keyword" cho JSP hiển thị
        request.setAttribute("productList", productList);
        
        CategoryDao categoryDao = DatabaseDao.getInstance().getCategoryDao();
        List<Category> categoryList = categoryDao.findAll();
        request.setAttribute("categoryList", categoryList);

        request.getRequestDispatcher("search.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

}