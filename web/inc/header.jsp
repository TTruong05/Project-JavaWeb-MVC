<%-- 
    Document   : header
    Created on : Aug 12, 2024, 3:59:06 PM
    Author     : Welcome
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
    <header id="header">
      <div class="top-bar">
        <div class="left-section">
          <!-- Logo nhỏ nằm sát bên trái -->
          <div class="logo-wrapper">
            <a href="HomeServlet">
              <img
                src="assets/images/logo.png"
                class="logo logo-small"
                alt="Logo"
              />
            </a>
          </div>

          <a href="#"><i class="fa-solid fa-location-dot"></i> Shop Finder</a>
          <a href="#">Help</a>
          <a href="#">Events</a>
          <a href="#">Blog</a>
          <a href="#">Gift Cards</a>
          <a href="#">Win</a>
        </div>
        <div class="right-section">
          <c:if test="${sessionScope.user == null}">
            <a href="LoginServlet"><i class="fa-solid fa-user"></i> Account</a>
          </c:if>
          <c:if test="${sessionScope.user != null}">
            <a href="LogoutServlet"><i class="fa-solid fa-user"></i> Log out</a>
          </c:if>
          <a href="#">Join <span class="plus">plus</span></a>
          <a href="#">Wish List</a>
          <a href="CartServlet"><i class="fa-solid fa-bag-shopping"></i> Basket</a>
        </div>
      </div>

      <!-- Logo giữa khi chưa scroll -->
      <div class="center-logo">
          <a href="HomeServlet">
               <img
          src="assets/images/logo.png"
          class="logo logo-center"
          alt="Logo Center"
        />
          </a>
      </div>

      <nav class="main-menu">
          <div class="menu-item has-dropdown">
           <a href="ShopServlet?page=1">BESTSELLERS</a>
          <div class="mega-menu">
            <div class="column">
                <h4>Top Pages</h4>
                <c:forEach items="${categoryList}" var="category">
                    <a href="CategoryServlet?categoryId=${category.id}">${category.name}</a>
                </c:forEach>
            </div>
          </div>
        </div>
       

        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">HIGHLIGHTS</a>
          <div class="mega-menu">
            <div class="column">
              <h4>Top Pages</h4>
              <a href="ShopServlet?page=1">New Books</a>
              <a href="ShopServlet?page=1">Coming Soon</a>
              <a href="ShopServlet?page=1">Special Editions</a>
              <a href="ShopServlet?page=1">Vinyl</a>
              <a href="ShopServlet?page=1">Gift Books</a>
              <a href="ShopServlet?page=1">Gifts For</a>
              <a href="ShopServlet?page=1">Jellycat</a>
              <a href="ShopServlet?page=1">BookTok</a>
              <a href="ShopServlet?page=1">Books of the Month</a>
              <a href="ShopServlet?page=1">Game of the Month</a>
              <a href="ShopServlet?page=1">Paperback Offers</a>
              <a href="ShopServlet?page=1">Children's Paperback Offers</a>
              <a href="ShopServlet?page=1">Dyslexia-friendly Books</a>
              <a href="ShopServlet?page=1">Great Book Deals</a>
              <a href="ShopServlet?page=1">Clearance</a>
              <a href="ShopServlet?page=1">Prize Draws</a>
              <a href="ShopServlet?page=1">Waterstones App</a>
            </div>
            <div class="column">
              <h4>What's On</h4>
              <a href="ShopServlet?page=1">Waterstones Debut Fiction Prize</a>
              <a href="ShopServlet?page=1">Pride</a>
              <a href="ShopServlet?page=1">Refugee Week</a>
              <a href="ShopServlet?page=1">The Books You Need to Read in 2025 </a>
              <a href="ShopServlet?page=1">Waterstones Children's Book Prize </a>
              <a href="ShopServlet?page=1">The Books You've Always Meant to Read </a>
              <a href="ShopServlet?page=1">Events </a>
              <a href="ShopServlet?page=1">The Booker Library </a>
              <a href="ShopServlet?page=1">The Penguin Archive </a>
              <a href="ShopServlet?page=1">Book Awards </a>
              <a href="ShopServlet?page=1">Book Festivals </a>
              <a href="ShopServlet?page=1">Waterstones Blog </a>
              <a href="ShopServlet?page=1">Waterstones Podcast </a>
            </div>
            <div class="column">
              <h4>Favourite Authors</h4>
              <a href="ShopServlet?page=1">Jane Austen</a>
              <a href="ShopServlet?page=1">Stephen King</a>
              <a href="ShopServlet?page=1">Agatha Christie</a>
              <a href="ShopServlet?page=1">Sarah Maas</a>
              <a href="ShopServlet?page=1">Freida McFadden</a>
              <a href="ShopServlet?page=1">Alice Oseman</a>
              <a href="ShopServlet?page=1">Richard Osman</a>
              <a href="ShopServlet?page=1">Philip Pullman</a>
              <a href="ShopServlet?page=1">JRR Tolkien</a>
              <a href="ShopServlet?page=1">Rebecca Varros</a>
            </div>
            <div class="column">
              <h4>Favourite Series</h4>
              <a href="ShopServlet?page=1">Harry Potter</a>
              <a href="ShopServlet?page=1">Bridgerton</a>
              <a href="ShopServlet?page=1">Doctor Who</a>
              <a href="ShopServlet?page=1">Dune</a>
              <a href="ShopServlet?page=1">The Empyrean</a>
              <a href="ShopServlet?page=1">A Game of Thrones</a>
              <a href="ShopServlet?page=1">Heartstopper</a>
              <a href="ShopServlet?page=1">Hunger Games</a>
              <a href="ShopServlet?page=1">Star Wars</a>
              <a href="ShopServlet?page=1">Warhammer</a>
            </div>
          </div>
        </div>
        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">FICTION</a>
          <div class="mega-menu">
            <div class="column">
              <h4>Top Pages</h4>
              <a href="ShopServlet?page=1">All Fiction</a>
              <a href="ShopServlet?page=1">New Books</a>
              <a href="ShopServlet?page=1">Coming Soon</a>
              <a href="ShopServlet?page=1">Special Editions</a>
              <a href="ShopServlet?page=1">Gift Books</a>
              <a href="ShopServlet?page=1">Paperback Offers</a>
              <a href="ShopServlet?page=1">Clothbound Classics</a>
              <a href="ShopServlet?page=1">Waterstones Debut Fiction Prize</a>
              <a href="ShopServlet?page=1">International Booker Prize</a>
              <a href="ShopServlet?page=1">Women's Prize for Fiction</a>
            </div>
            <div class="column">
              <h4>Fiction</h4>
              <a href="ShopServlet?page=1">Anthologies & Short Stories</a>
              <a href="ShopServlet?page=1">Classics</a>
              <a href="ShopServlet?page=1">Clothbound Classics</a>
              <a href="ShopServlet?page=1">Fiction in Translation</a>
              <a href="ShopServlet?page=1">Historical Fiction</a>
              <a href="ShopServlet?page=1">Modern & Contemporary</a>
              <a href="ShopServlet?page=1">Myths & Legends</a>
              <a href="ShopServlet?page=1">Novellas</a>
              <a href="ShopServlet?page=1">Poetry, Drama & Literary Criticism</a>
              <a href="ShopServlet?page=1">Romance</a>
            </div>
            <div class="column">
              <h4>Crime</h4>
              <a href="ShopServlet?page=1">Classic Crime</a>
              <a href="ShopServlet?page=1">Cosy Crime</a>
              <a href="ShopServlet?page=1">Historical Crime</a>
              <a href="ShopServlet?page=1">Thrillers</a>
              <a href="ShopServlet?page=1">True Crime</a>
              <h4>Graphic Novels & Manga</h4>
              <a href="ShopServlet?page=1">Graphic Novels</a>
              <a href="ShopServlet?page=1">Manga</a>
            </div>
            <div class="column">
              <h4>Science Fiction, Fantasy & Horror</h4>
              <a href="ShopServlet?page=1">Fantasy</a>
              <a href="ShopServlet?page=1">Romantasy</a>
              <a href="ShopServlet?page=1">Science Fiction</a>
              <a href="ShopServlet?page=1">Horror</a>
              <h4>Teenage & Young Adult</h4>
              <a href="ShopServlet?page=1">Young Adult</a>
            </div>
          </div>
        </div>
        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">NON-FICTION</a>
          <div class="mega-menu">
            <div class="column">
              <h4>Top Pages</h4>
              <a href="ShopServlet?page=1">All Non-Fiction</a>
              <a href="ShopServlet?page=1">New Books</a>
              <a href="ShopServlet?page=1">Coming Soon</a>
              <a href="ShopServlet?page=1">Special Editions</a>
              <a href="ShopServlet?page=1">Gift Books</a>
              <a href="ShopServlet?page=1">Paperback Offers</a>
              <a href="ShopServlet?page=1">Women's Prize for Non-Fiction</a>
              <a href="ShopServlet?page=1">Baillie Gifford Prize</a>
            </div>
            <div class="column">
              <h4>Art & Entertainment</h4>
              <a href="ShopServlet?page=1">Art, Fashion & Photography</a>
              <a href="ShopServlet?page=1">Entertainment</a>
              <a href="ShopServlet?page=1">Film & TV</a>
              <a href="ShopServlet?page=1">Humour</a>
              <a href="ShopServlet?page=1">Music</a>
              <a href="ShopServlet?page=1">Vinyl</a>
              <h4>Biography & True Stories</h4>
              <a href="ShopServlet?page=1">Art & Entertainment Biographies</a>
              <a href="ShopServlet?page=1">Historical & Political Biographies</a>
              <a href="ShopServlet?page=1">Literary Biographies</a>
              <a href="ShopServlet?page=1">Sports Biographies</a>
              <a href="ShopServlet?page=1">True Crime</a>
              <h4>History & Politics</h4>
              <a href="ShopServlet?page=1">History</a>
              <a href="ShopServlet?page=1">Politics</a>
            </div>
            <div class="column">
              <h4>Home & Lifestyle</h4>
              <a href="ShopServlet?page=1">Food & Drink </a>
              <a href="ShopServlet?page=1">Health & Lifestyle </a>
              <a href="ShopServlet?page=1">Home & Garden </a>
              <a href="ShopServlet?page=1">Parenting </a>
              <h4>Nature</h4>
              <a href="ShopServlet?page=1">Environment </a>
              <a href="ShopServlet?page=1">Nature Writing </a>
              <a href="ShopServlet?page=1">Nature Writing </a>
              <a href="ShopServlet?page=1">Pets </a>
              <h4>Smart Thinking</h4>
              <a href="ShopServlet?page=1">Environment </a>
              <a href="ShopServlet?page=1">Business. Finance & Law </a>
              <a href="ShopServlet?page=1">Computing & Internet </a>
              <a href="ShopServlet?page=1">Language & Reference </a>
              <a href="ShopServlet?page=1">Personal Development </a>
              <a href="ShopServlet?page=1">Popular Science </a>
              <a href="ShopServlet?page=1">Science, Technology & Medicine </a>
              <a href="ShopServlet?page=1">Astronomy & Space </a>
            </div>
            <div class="column">
              <h4>Spirituality & Beliefs</h4>
              <a href="ShopServlet?page=1">Philosophy</a>
              <a href="ShopServlet?page=1">Mindfulness</a>
              <a href="ShopServlet?page=1">Religion</a>
              <h4>Sport & Hobbies</h4>
              <a href="ShopServlet?page=1">Hobbies, Quizzes & Games</a>
              <a href="ShopServlet?page=1">Sport</a>
              <a href="ShopServlet?page=1">Transport</a>
              <h4>Travel & Maps</h4>
              <a href="ShopServlet?page=1">British Travel</a>
              <a href="ShopServlet?page=1">Outdoor Pursuits</a>
              <a href="ShopServlet?page=1">Travel & Holiday Guides</a>
              <a href="ShopServlet?page=1">Travel Writing</a>
            </div>
          </div>
        </div>
        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">CHILDREN'S</a>
          <div class="mega-menu">
            <div class="column">
              <h4>Top Pages</h4>
              <a href="ShopServlet?page=1">All Children's Books </a>
              <a href="ShopServlet?page=1">Half Term Holidays </a>
              <a href="ShopServlet?page=1">New Books </a>
              <a href="ShopServlet?page=1">Coming Soon </a>
              <a href="ShopServlet?page=1">Special Editions </a>
              <a href="ShopServlet?page=1">Children's Gift Books </a>
              <a href="ShopServlet?page=1">Children's Paperback Offers </a>
              <a href="ShopServlet?page=1">Waterstones Children's Book Prize </a>
              <a href="ShopServlet?page=1">Waterstones Children's Laureate. </a>
              <a href="ShopServlet?page=1">Children's Favourite Authors </a>
              <a href="ShopServlet?page=1">Children's Favourite Characters </a>
            </div>
            <div class="column">
              <h4>Pre-School</h4>
              <a href="ShopServlet?page=1">Baby, Toddler & Pre-School </a>
              <a href="ShopServlet?page=1">Picture BookS </a>
              <a href="ShopServlet?page=1">Early Leaming </a>
              <h4>Children's Fiction</h4>
              <a href="ShopServlet?page=1">Children's Comics & Graphic Novels </a>
              <a href="ShopServlet?page=1">Dyslexia-friendly Books for Children </a>
              <a href="ShopServlet?page=1">Books for Reluctant Readers</a>
            </div>
            <div class="column">
              <h4>Teenage & Young Adult</h4>
              <a href="ShopServlet?page=1">Young Acult </a>
              <h4>Education & Reference</h4>
              <a href="ShopServlet?page=1">Study Guides & Education </a>
              <a href="ShopServlet?page=1">Reference </a>
              <a href="ShopServlet?page=1">Children's Religion & Bel efs </a>
              <a href="ShopServlet?page=1">Personal & Social Issues </a>
              <h4>Hobbies & Activities</h4>
              <a href="ShopServlet?page=1">Activity Books</a>
              <a href="ShopServlet?page=1">Hobbies & Interests </a>
            </div>
            <div class="column">
              <h4>Stationery & Gifts</h4>
              <a href="ShopServlet?page=1">Arts & Crafts </a>
              <a href="ShopServlet?page=1">Games & Puzzles </a>
              <a href="ShopServlet?page=1">Jigsaw Puzzles </a>
              <a href="ShopServlet?page=1">Stationery </a>
              <a href="ShopServlet?page=1">Educational Toys & Games </a>
              <a href="ShopServlet?page=1">Jellycal </a>
              <a href="ShopServlet?page=1">Legami </a>
              <a href="ShopServlet?page=1">Lego </a>
              <a href="ShopServlet?page=1">Soft Toys </a>
              <a href="ShopServlet?page=1">Tovs </a>
            </div>
          </div>
        </div>
        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">GAMES</a>
          <div class="mega-menu">
            <div class="column">
              <h4>All Games</h4>
              <a href="ShopServlet?page=1">Board Games </a>
              <a href="ShopServlet?page=1">Card Games </a>
              <a href="ShopServlet?page=1">Children's Games & Puzzles </a>
              <a href="ShopServlet?page=1">Games Flagship Shops </a>
              <a href="ShopServlet?page=1">Game of the Month </a>
            </div>
            <div class="column">
              <h4>Top Categories</h4>
              <a href="ShopServlet?page=1">Family Games </a>
              <a href="ShopServlet?page=1">Logic & Deduction Games </a>
              <a href="ShopServlet?page=1">Party Games </a>
              <a href="ShopServlet?page=1">Strategy Games </a>
              <a href="ShopServlet?page=1">Traditional Games </a>
              <a href="ShopServlet?page=1">Travel Games </a>
              <a href="ShopServlet?page=1">Word Games </a>
              <a href="ShopServlet?page=1">Accessories & Dice</a>
              <a href="ShopServlet?page=1">Dungeons & Dragons</a>
            </div>
            <div class="column">
              <h4>More Games Categories</h4>
              <a href="ShopServlet?page=1">Abstract Games </a>
              <a href="ShopServlet?page=1">Bluffing Games </a>
              <a href="ShopServlet?page=1">Cooperative Games </a>
              <a href="ShopServlet?page=1">Film & TV Games </a>
              <a href="ShopServlet?page=1">Single Player Games </a>
              <a href="ShopServlet?page=1">Thematic Games </a>
              <a href="ShopServlet?page=1">Two Player Games </a>
            </div>
          </div>
        </div>
        <div class="menu-item has-dropdown">
          <a href="ShopServlet?page=1">STATIONERY & GIFTS</a>
          <div class="mega-menu">
            <div class="column">
              <h4>Gifts</h4>
              <a href="ShopServlet?page=1">Gift Cards </a>
              <a href="ShopServlet?page=1">Cloth Bags </a>
              <a href="ShopServlet?page=1">Gadgets & Technology </a>
              <a href="ShopServlet?page=1">Home & Lifestyle </a>
              <a href="ShopServlet?page=1">Jigsaw Puzzles </a>
              <a href="ShopServlet?page=1">Literary Gifts </a>
              <a href="ShopServlet?page=1">Manga Gifts </a>
              <a href="ShopServlet?page=1">William Morris </a>
              <a href="ShopServlet?page=1">Novelty Gifts </a>
              <a href="ShopServlet?page=1">Toys & Games </a>
              <a href="ShopServlet?page=1">Vinyl </a>
            </div>
            <div class="column">
              <h4>Children's</h4>
              <a href="ShopServlet?page=1">Children's Arts & Crafts </a>
              <a href="ShopServlet?page=1">Children's Games & Puzzles </a>
              <a href="ShopServlet?page=1">Children's Jigsaw Puzzles </a>
              <a href="ShopServlet?page=1">Children's Stationery </a>
              <a href="ShopServlet?page=1">Educational Toys & Games </a>
              <a href="ShopServlet?page=1">Jellycat </a>
              <a href="ShopServlet?page=1">Legami </a>
              <a href="ShopServlet?page=1">LEGO® </a>
              <a href="ShopServlet?page=1">Soft Toys </a>
              <a href="ShopServlet?page=1">Toys </a>
            </div>
            <div class="column">
              <h4>Stationery</h4>
              <a href="ShopServlet?page=1">Cards, Postcards & Notecards </a>
              <a href="ShopServlet?page=1">Gift Wrap</a>
              <a href="ShopServlet?page=1">Calendars </a>
              <a href="ShopServlet?page=1">Diaries & Planners</a>
              <a href="ShopServlet?page=1">Notebooks & Journals</a>
              <a href="ShopServlet?page=1">Moleskine Notebooks</a>
              <a href="ShopServlet?page=1">Stationery Essentials</a>
              <h4>Book Accessories</h4>
              <a href="ShopServlet?page=1">Book Lights & Lamps </a>
              <a href="ShopServlet?page=1">Bookmarks </a>
              <a href="ShopServlet?page=1">Reading Glasses & Magnifiers </a>
            </div>
            <div class="column">
              <h4>Arts & Crafts</h4>
              <a href="ShopServlet?page=1">Brushes </a>
              <a href="ShopServlet?page=1">Canvas </a>
              <a href="ShopServlet?page=1">Crafting </a>
              <a href="ShopServlet?page=1">Paint </a>
              <a href="ShopServlet?page=1">Paper </a>
              <a href="ShopServlet?page=1">Pens, Pencils & Pastels </a>
            </div>
          </div>
        </div>

        <div class="search-container">
            <form action="SearchServlet" method="GET">
                <input type="text" placeholder="Search Title, Author, Keyword..." name="query" />
                <button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
            </form>
        </div>
      </nav>

      <div class="delivery-note">
        Free UK delivery on orders over £25, otherwise £2.99
      </div>
    </header>