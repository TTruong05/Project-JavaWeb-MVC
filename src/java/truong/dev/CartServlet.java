/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package truong.dev;

import truong.dev.data.model.OrderItem;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author duong van truong
 */
public class CartServlet extends BaseServlet {

     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        if(cart == null){
            cart = new ArrayList<OrderItem>();
        }
                
        request.setAttribute("cart",cart);
        request.getRequestDispatcher("cart.jsp").include(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){
            case "create":
                createOrder(request);
                break;
            case "update":
                updateOrder(request);
                break;
            case "delete":
                deleteOrder(request);
                break;
            default:
                throw new AssertionError();
        }
        response.sendRedirect("CartServlet");
    }

    private void createOrder(HttpServletRequest request) {
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int productId = Integer.parseInt(request.getParameter("productId"));
        double price = Double.parseDouble(request.getParameter("price"));
        
        OrderItem orderItem = new OrderItem(quantity, price, 0, productId);
        
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        
        boolean isExistInCart = false;
        
        if(cart == null){
            cart = new ArrayList<>();
        }else{
            for(OrderItem ord : cart){
                if(ord.getProductId() == productId){
                    ord.setQuantity(ord.getQuantity() + quantity);
                    isExistInCart = true;
                    break;
                }
            }
        }
        
        if(!isExistInCart){
            cart.add(orderItem);
        }
        session.setAttribute("cart", cart);
    }

    private void updateOrder(HttpServletRequest request) {
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");

        if(cart != null && cart.isEmpty() == false){
            for(OrderItem ord : cart){
                if(ord.getProductId() == productId){
                    ord.setQuantity(quantity);
                }
            }
        }
        
        session.setAttribute("cart", cart);
    }

    private void deleteOrder(HttpServletRequest request) {
       int productId = Integer.parseInt(request.getParameter("productId"));
        HttpSession session = request.getSession();
        List<OrderItem> cart = (List<OrderItem>) session.getAttribute("cart");
        
        if(cart != null){
            for (int i = 0; i < cart.size(); i++) {
                OrderItem ord = cart.get(i);
                if(ord.getProductId() == productId){
                    cart.remove(ord);
                }
            }
        }
        
        session.setAttribute("cart", cart);
    }

}

