<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%@ taglib
prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Cara</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
      integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="assets/css/style.css" />
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
     <c:if test="${param.orderSuccess == 'true'}">
        <div class="alert alert-success text-center" role="alert" style="margin-top: 20px;">
            Thank you! Your order has been placed successfully. We will process it as soon as possible.
        </div>
    </c:if>
    <section id="hero-slider">
      <div id="carouselExample" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="./assets/images/home/home-slide1.png"
              class="d-block w-100"
              alt="Slide 1"
            />
          </div>
          <div class="carousel-item">
            <img
              src="./assets/images/home/home-slide2.png"
              class="d-block w-100"
              alt="Slide 2"
            />
          </div>
          <div class="carousel-item">
            <img
              src="./assets/images/home/home-slide3.png"
              class="d-block w-100"
              alt="Slide 3"
            />
          </div>
        </div>

        <!-- Nút ?i?u h??ng -->
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselExample"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselExample"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
      </div>
    </section>

    <section id="features" class="section-p1">
      <h3>You Might Be Looking For...</h3>
      <div class="container">
        <div class="fe-box">
          <img src="./assets/images/youmbf/home1.png" alt="" />
          <h6>Bestsellers</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home2.png" alt="" />
          <h6>Fiction</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home3.png" alt="" />
          <h6>Non-Fiction</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home4.png" alt="" />
          <h6>Children's</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home5.png" alt="" />
          <h6>Teen and Ya</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home6.png" alt="" />
          <h6>Games</h6>
        </div>
        <div class="fe-box">
          <img src="./assets/images/youmbf/home7.png" alt="" />
          <h6>Gifts</h6>
        </div>
      </div>
    </section>

    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Our Bestsellers</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="baner4 container">
      <img src="assets/images/products2/p1.jpg" alt="" />
      <img src="assets/images/products2/p2.jpg" alt="" />
      <img src="assets/images/products2/p3.jpg" alt="" />
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Everyone's Talking About...</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Non-Fiction to Change Your Mind</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="baner1 container">
      <img src="assets/images/banner/b1.jpg" alt="" />
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Signed & Special Editions</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Coming Soon - The Biggest Books Coming in 2025 & Beyond</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="baner2 container">
      <img src="assets/images/banner/b2.jpg" alt="" />
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Perfect Paperbacks</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="section-p1 product1">
      <div class="section-header">
        <h2>Our Best Fiction Books</h2>
        <p>SEE MORE</p>
      </div>
      <div class="product-carousel-wrapper">
        <button
          class="carousel-arrow left-arrow"
          aria-label="Previous Products"
        >
          <i class="fas fa-chevron-left"></i>
        </button>

        <div class="prod-cont product-slider">
          <c:forEach items="${hotProductList}" var="product">
            <div class="prod" onclick="window.location.href='ProductServlet?productId=${product.id}';">
              <div class="img-wrapper">
                <a href="ProductServlet?productId=${product.id}"
                  ><img src="${product.thumbnail}" alt=""
                /></a>
                <div class="overlay-buttons">
                  <form action="CartServlet" method="post">
                    <input type="hidden" name="action" value="create" />
                    <input
                      type="hidden"
                      name="productId"
                      value="${product.id}"
                    />
                    <input
                      type="hidden"
                      name="price"
                      value="${product.price}"
                    />
                    <input type="hidden" name="quantity" value="1" /> <%-- M?c
                    ??nh s? l??ng là 1 --%>
                    <button class="add-to-basket normal" type="submit">
                      ADD TO BASKET
                    </button>
                  </form>
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
        <button class="carousel-arrow right-arrow" aria-label="Next Products">
          <i class="fas fa-chevron-right"></i>
        </button>
      </div>
    </section>
    <section class="baner3 container">
      <img src="assets/images/banner/b3.jpg" alt="" />
    </section>
    <section
      id="simple-banners-grid"
      class="simple-banners-grids section-p1 container"
    >
      <div class="simple-banner-container">
        <div class="simple-banner-item">
          <img src="assets/images/products3/p1.jpg" alt="Simple Banner 1" />

          <a href="ShopServlet?page=1" class="simple-banner-link"
            >The Waterstones Round Up: June's Best Books</a
          >
          <p class="simple-banner-text">
            As we run headlong into the summer sunshine, check out our pick of
            the very best publishing this June.
          </p>
        </div>

        <div class="simple-banner-item">
          <img src="assets/images/products3/p2.jpg" alt="Simple Banner 2" />

          <a href="ShopServlet?page=1" class="simple-banner-link"
            >The Waterstones Round Up: June's Best Books</a
          >
          <p class="simple-banner-text">
            Explore our hand-picked selection of children's books. coming out
            this June
          </p>
        </div>

        <div class="simple-banner-item">
          <img src="assets/images/products3/p3.jpg" alt="Simple Banner 3" />
          <a href="ShopServlet?page=1" class="simple-banner-link"
            >The Books You Need to Read in 2025</a
          >
          <p class="simple-banner-text">
            Make space in your baskets and wish lists; it's time to dive into
            the most eagerly awaited books of 20251
          </p>
        </div>

        <div class="simple-banner-item">
          <img src="assets/images/products3/p4.jpg" alt="Simple Banner 4" />
          <a href="ShopServlet?page=1" class="simple-banner-link"
            >The Fiction You Need to Read in 2025</a
          >
          <p class="simple-banner-text">
            From big names to new voices, which of the books from our selection
            of 2025's most exciting fiction will be your favourite?
          </p>
        </div>
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
        productSliders.forEach((productSlider) => {
          // Tìm m?i tên ?i?u khi?n trong cùng m?t wrapper v?i slider hi?n t?i
          const productCarouselWrapper = productSlider.closest(
            ".product-carousel-wrapper"
          );
          const leftArrow = productCarouselWrapper
            ? productCarouselWrapper.querySelector(".left-arrow")
            : null;
          const rightArrow = productCarouselWrapper
            ? productCarouselWrapper.querySelector(".right-arrow")
            : null;

          // Function ?? cu?n slider c? th? này
          function scrollSlider(direction) {
            const productWidth =
              productSlider.querySelector(".prod").offsetWidth;
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
