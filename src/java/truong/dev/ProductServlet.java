package truong.dev;

import truong.dev.data.dao.DatabaseDao;
import truong.dev.data.dao.ProductDao;
import truong.dev.data.model.Product;
import truong.dev.util.Constants;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends BaseServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int productId = Integer.parseInt(request.getParameter("productId"));
        ProductDao productDao = DatabaseDao.getInstance().getProductDao();
        Product product = productDao.find(productId);
        
        // Lấy danh sách sản phẩm mới (nếu cần hiển thị ở đâu đó khác)
        List<Product> newsProductList = productDao.news(Constants.NUMBER_LIMIT); 
        
        // Lấy danh sách sản phẩm liên quan
        List<Product> relatedProductList = productDao.relatedProductList(product); // <-- THÊM DÒNG NÀY

        request.setAttribute("newsProductList", newsProductList);        
        request.setAttribute("product", product);
        request.setAttribute("hotProductList", relatedProductList); // <-- THÊM DÒNG NÀY ĐỂ ĐẶT SẢN PHẨM LIÊN QUAN VÀO ATTRIBUTE "hotProductList"
        
        request.getRequestDispatcher("product.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}