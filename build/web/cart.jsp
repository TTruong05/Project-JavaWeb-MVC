<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
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
    <link rel="stylesheet" href="./assets/css/style.css">
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

    <div class="cart-banner">
        <img src="assets/images/cart/p1.jpg">
    </div>

    <section id="cart" class="section-p1">
        <table width="100%">
            <thead>
                <tr>
                    <td>Remove</td>
                    <td>Image</td>
                    <td>Product</td>
                    <td>Value of order</td>
                    <td>Quantity</td> <%-- ?ã s?a 'Quantidy' thành 'Quantity' --%>
                    <td>Price</td>
                </tr>
            </thead>
            <tbody>
                <c:set var="overallTotal" value="${0}" /> 
                <c:forEach items="${cart}" var="orderItem">
                    <tr>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="delete"/>
                                <input type="hidden" name="productId" value="${orderItem.productId}"/>
                                <button type="submit" class="fa-regular fa-circle-xmark"></button>
                            </form>
                        </td>
                        <td><img src="${orderItem.product.thumbnail}""></td>
                        <td>${orderItem.product.name}</td>
                        <%-- **THAY ??I: C?t Price hi?n th? giá ??n v?** --%>
                        <td>$<fmt:formatNumber value="${orderItem.price}" pattern="#,##0.00"/></td>
                        <td>
                            <form action="CartServlet" method="post">
                                <input type="hidden" name="action" value="update"/>
                                <input type="hidden" name="productId" value="${orderItem.productId}"/>
                                <input onchange="this.form.submit()" name="quantity" type="number" value="${orderItem.quantity}" min="1">
                            </form>
                        </td>
                        <%-- **THAY ??I: C?t Subtotal hi?n th? t?ng giá tr? c?a dòng hàng** --%>
                        <td>$<fmt:formatNumber value="${orderItem.price * orderItem.quantity}" pattern="#,##0.00"/></td>
                    </tr>
                    <%-- **THAY ??I: C?ng d?n giá tr? c?a t?ng dòng hàng vào overallTotal** --%>
                    <c:set var="overallTotal" value="${overallTotal + (orderItem.price * orderItem.quantity)}" />
                </c:forEach>
            </tbody>
        </table>
    </section>

    <section id="cart-add" class="section-p1">
        <div class="coupon">
            <h3>Apply Coupon</h3>
            <div>
                <input type="text" placeholder="Enter Your Coupon">
                <button class="normal">Apply</button>
            </div>
        </div>

        <div class="subtotal">
            <h3>Cart Total</h3>
            <table>
                <tr>
                    <td>Cart Subtotal</td>
                    <%-- **THAY ??I: Hi?n th? overallTotal cho Cart Subtotal** --%>
                    <td>$<fmt:formatNumber value="${overallTotal}" pattern="#,##0.00"/></td>
                </tr>
                <tr>
                    <td>Shipping</td>
                    <td>Free</td>
                </tr>
                <tr>
                    <td><strong>Total</strong></td>
                    <%-- **THAY ??I: Hi?n th? overallTotal cho Total** --%>
                    <td><strong>$<fmt:formatNumber value="${overallTotal}" pattern="#,##0.00"/></strong></td>
                </tr>
            </table>
            <button class="normal">Proceed to checkout</button>
        </div>
    </section>

      <%@include file="./inc/footer.jsp"%>
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

               // Ch?n T?T C? các slider có class 'product-slider'
               const productSliders = document.querySelectorAll(".product-slider");

               // L?p qua t?ng slider ?? g?n s? ki?n và logic
               productSliders.forEach(productSlider => {
                 // Tìm m?i tên ?i?u khi?n trong cùng m?t wrapper v?i slider hi?n t?i
                 const productCarouselWrapper = productSlider.closest(".product-carousel-wrapper");
                 const leftArrow = productCarouselWrapper ? productCarouselWrapper.querySelector(".left-arrow") : null;
                 const rightArrow = productCarouselWrapper ? productCarouselWrapper.querySelector(".right-arrow") : null;

                 // Function ?? cu?n slider c? th? này
                 function scrollSlider(direction) {
                   const productWidth = productSlider.querySelector(".prod").offsetWidth;
                   const scrollAmount = productWidth * 3;

                   if (direction === "left") {
                     productSlider.scrollBy({
                       left: -scrollAmount,
                       behavior: "smooth",
                     });
                   } else {
                     productSlider.scrollBy({
                       left: scrollAmount,
                       behavior: "smooth",
                     });
                   }
                 }

                 // G?n s? ki?n click cho m?i tên
                 if (leftArrow) {
                   leftArrow.addEventListener("click", () => scrollSlider("left"));
                 }
                 if (rightArrow) {
                   rightArrow.addEventListener("click", () => scrollSlider("right"));
                 }


                 if (leftArrow) {
                     leftArrow.style.display = "block";
                 }
                 if (rightArrow) {
                     rightArrow.style.display = "block";
                 }

               }); // K?t thúc vòng l?p foreach
             });
         </script>
</body>

</html>