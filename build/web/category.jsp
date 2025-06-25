<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Cara</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
              integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="assets/css/style.css">
    </head>
    <script>
    document.addEventListener("DOMContentLoaded", function () {
      const header = document.getElementById("header");

      window.addEventListener("scroll", function () {
        if (window.scrollY > 20) {
          header.classList.add("shrink");
        } else {
          header.classList.remove("shrink");
        }
      });
    });
  </script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <body>

        <%@include file="./inc/header.jsp"%>



        <section class="section-p1 product1 product-grid-section"> <div class="section-header">
                <h2>${category.name}</h2>
                <p>SEE MORE</p>
            </div>
            <div class="prod-cont"> 
                <c:forEach items="${productList}" var="product">
                    <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';"> <div class="img-wrapper">
                            <a href="ProductServlet?productId=${product.id}">
                                <img src="${product.thumbnail}" alt="" />
                            </a>
                            <div class="overlay-buttons">
                                <button class="add-to-basket">ADD TO BASKET</button>
                                <button class="click-collect">CLICK & COLLECT</button>
                            </div>
                        </div>
                        <div class="des">
                            <h5>${product.name}</h5>
                            <span>Yael van der Wouden</span>
                            <h6>${product.description}</h6>
                            <div class="price">
                                <h4 class="price-sales">$${product.price}</h4>
                                <h4>$${product.price}</h4>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
           </section>
        
        

        <section id="pagination" class="section-p1">
            <c:forEach var="i" begin="1" end="${numberPage + 1}">
                <a <c:if test="${i == page}">class="active"</c:if>  href="ShopServlet?page=${i}">${i}</a>
            </c:forEach>
            <a href="#"><i class="fa-solid fa-arrow-right"></i></a>
        </section>

        <%@include file="./inc/footer.jsp"%>

    </body>

</html>