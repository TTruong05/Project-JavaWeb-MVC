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
        <section id="prodetails" class="section-p1">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="single-pro-img">
                            <img src="${product.thumbnail}" alt="" id="MainImg" width="100%">
                            <div class="small-img-group">
                                <div class="col-sm-3">
                                    <img src="assets/images/products/f1.jpg" alt="" class="small-img" width="100%">
                                </div>
                                <div class="col-sm-3">
                                    <img src="assets/images/products/f2.jpg" alt="" class="small-img" width="100%">
                                </div>
                                <div class="col-sm-3">
                                    <img src="assets/images/products/f3.jpg" alt="" class="small-img" width="100%">
                                </div>
                                <div class="col-sm-3">
                                    <img src="assets/images/products/f4.jpg" alt="" class="small-img" width="100%">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <form action="CartServlet" method="post" class="single-pro-details">
                            <input type="hidden" name="action" value="create"/>
                            <input type="hidden" name="productId" value="${product.id}"/>
                            <input type="hidden" name="price" value="${product.price}"/>
                            <h6>Category/Comedy</h6>
                            <div class="product-rating">
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star"></i>
                                <i class="fa-solid fa-star-half-stroke"></i>
                            </div>
                            <h4>${product.name}</h4>
                            <h2>$${product.price}</h2>
                            <h6>Quantity</h4>
                            <input name="quantity" type="number" value="1">
                            <button class="normal">Add To Basket</button>
                            <button class="normal favourite-button">Favourite</button>
                            <h4>Book Details</h4>
                            <span>${product.description}</span>
                        </form>
                    </div>
                </div>
            </div>
        </section>

                        
          <section class="section-p1 product1">
            <div class="section-header">
                <h2>Books on related topics</h2>
                <p>SEE MORE</p>
            </div>
            <div class="product-carousel-wrapper">
                <button class="carousel-arrow left-arrow" aria-label="Previous Products">
                    <i class="fas fa-chevron-left"></i>
                </button>

                <div class="prod-cont product-slider">
                    <c:forEach items="${hotProductList}" var="product">
                        <div class="prod"> <%-- Removed onclick="window.location.href='sproduct.html';" here --%>
                            <div class="img-wrapper">
                                <a href="ProductServlet?productId=${product.id}"
                                   ><img src="${product.thumbnail}" alt=""
                                   /></a>
                                <div class="overlay-buttons">
                                    <%-- Thêm form cho nút "ADD TO BASKET" --%>
                                    <form action="CartServlet" method="post">
                                        <input type="hidden" name="action" value="create"/>
                                        <input type="hidden" name="productId" value="${product.id}"/>
                                        <input type="hidden" name="price" value="${product.price}"/>
                                        <input type="hidden" name="quantity" value="1"/> <%-- M?c ??nh s? l??ng là 1 --%>
                                        <button class="add-to-basket normal" type="submit">ADD TO BASKET</button>
                                    </form>
                                    <button class="click-collect normal">CLICK & COLLECT</button>
                                </div>
                            </div>
                            <div class="des">
                                <h5>${product.name}</h5>
                                <span>Yael van der Wouden</span>
                                <h6>${product.description}</h6>
                                <div class="price">
                                    <h4 class="price-sales">$<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></h4>
                                    <h4>$<fmt:formatNumber value="${product.price}" pattern="#,##0.00"/></h4>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <button class="carousel-arrow right-arrow" aria-label="Next Products">
                    <i class="fas fa-chevron-right"></i>
                </button>
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
