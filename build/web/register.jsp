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
        <section id="wrapper">
            <div class="form-box register">
                <form action="RegisterServlet" method="post">
                    <h1>Registration</h1>
                    <span class="error">${error}</span>
                    <c:remove var="error" scope="session"/>
                    <div class="input-box">
                        <input name="email" type="email" placeholder="Email" required>
                        <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div class="input-box">
                        <input name="password" type="password" placeholder="Password" required>
                        <i class="fa-solid fa-lock"></i>
                    </div>
                    <div class="remember-forgot">
                        <label><input type="checkbox">I agree to the terms & conditions</label>
                        <!-- <a href="#">Forgot Password</a> -->
                    </div>
                    <button type="submit" class="normal">Register</button>
                    <div class="register-link">
                        <p>Already have an Account? <a href="LoginServlet">Login</a></p>
                    </div>
                </form>
            </div>
        </section>
        <%@include file="./inc/footer.jsp"%>
    </body>
