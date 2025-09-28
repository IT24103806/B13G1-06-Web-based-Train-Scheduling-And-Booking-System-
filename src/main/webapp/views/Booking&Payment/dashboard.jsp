<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>TSBS Dashboard - Train Schedule Booking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Navigation */
        .navbar {
            position: fixed;
            top: 0;
            width: 100%;
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            padding: 15px 0;
            z-index: 1000;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .logo i {
            color: #0078d7;
            font-size: 28px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
            list-style: none;
        }

        .nav-links a {
            text-decoration: none;
            color: #333;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .nav-links a:hover {
            color: #0078d7;
        }

        /* Hero Section */
        .hero-section {
            margin-top: 80px;
            padding: 60px 20px;
            text-align: center;
            position: relative;
        }

        .hero-content {
            max-width: 800px;
            margin: 0 auto;
            color: white;
        }

        .hero-title {
            font-size: 3.5em;
            font-weight: 700;
            margin-bottom: 20px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
            animation: slideInUp 1s ease-out;
        }

        .hero-subtitle {
            font-size: 1.3em;
            margin-bottom: 40px;
            opacity: 0.95;
            animation: slideInUp 1s ease-out 0.2s both;
        }

        /* Image Slider */
        .slider-container {
            position: relative;
            max-width: 1000px;
            margin: 50px auto;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
            animation: slideInUp 1s ease-out 0.4s both;
        }

        .slider {
            position: relative;
            width: 100%;
            height: 400px;
        }

        .slide {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 1s ease-in-out;
        }

        .slide.active {
            opacity: 1;
        }

        .slide img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .slide-overlay {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background: linear-gradient(transparent, rgba(0, 0, 0, 0.7));
            padding: 40px 30px 20px;
            color: white;
        }

        .slide-title {
            font-size: 2em;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .slide-description {
            font-size: 1.1em;
            opacity: 0.9;
        }

        .slider-nav {
            position: absolute;
            bottom: 20px;
            left: 50%;
            transform: translateX(-50%);
            display: flex;
            gap: 10px;
        }

        .nav-dot {
            width: 12px;
            height: 12px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.5);
            cursor: pointer;
            transition: background 0.3s ease;
        }

        .nav-dot.active {
            background: white;
        }

        /* Action Cards */
        .actions-section {
            padding: 80px 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .section-title {
            text-align: center;
            font-size: 2.5em;
            color: white;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .section-subtitle {
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1em;
            margin-bottom: 60px;
        }

        .cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
            margin-top: 40px;
        }

        .action-card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 40px 30px;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .action-card::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: rotate(-45deg);
            transition: all 0.6s ease;
            opacity: 0;
        }

        .action-card:hover::before {
            animation: shine 0.8s ease-in-out;
        }

        .action-card:hover {
            transform: translateY(-10px);
            background: rgba(255, 255, 255, 0.25);
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.3);
        }

        .card-icon {
            font-size: 3.5em;
            color: #4fc3f7;
            margin-bottom: 20px;
            transition: all 0.3s ease;
        }

        .action-card:hover .card-icon {
            transform: scale(1.2) rotate(10deg);
            color: #29b6f6;
        }

        .card-title {
            font-size: 1.4em;
            font-weight: 600;
            color: white;
            margin-bottom: 15px;
        }

        .card-description {
            color: rgba(255, 255, 255, 0.8);
            line-height: 1.6;
            margin-bottom: 25px;
        }

        .card-button {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(45deg, #0078d7, #00bcd4);
            color: white;
            text-decoration: none;
            border-radius: 25px;
            font-weight: 500;
            transition: all 0.3s ease;
            border: none;
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .card-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .card-button:hover::before {
            left: 100%;
        }

        .card-button:hover {
            transform: scale(1.05);
            box-shadow: 0 10px 25px rgba(0, 120, 215, 0.4);
        }

        /* Footer */
        .footer {
            background: rgba(0, 0, 0, 0.2);
            padding: 40px 20px;
            text-align: center;
            color: rgba(255, 255, 255, 0.8);
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-links {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 20px;
        }

        .footer-links a {
            color: rgba(255, 255, 255, 0.8);
            text-decoration: none;
            transition: color 0.3s ease;
        }

        .footer-links a:hover {
            color: white;
        }

        /* Animations */
        @keyframes slideInUp {
            from {
                opacity: 0;
                transform: translateY(50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes shine {
            0% {
                opacity: 0;
                transform: translateX(-100%) translateY(-100%) rotate(-45deg);
            }
            50% {
                opacity: 1;
            }
            100% {
                opacity: 0;
                transform: translateX(100%) translateY(100%) rotate(-45deg);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .hero-title {
                font-size: 2.5em;
            }

            .nav-links {
                display: none;
            }

            .cards-grid {
                grid-template-columns: 1fr;
            }

            .slider {
                height: 250px;
            }
        }

        /* Floating Elements */
        .floating-elements {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: -1;
        }

        .floating-element {
            position: absolute;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.1);
            animation: float 6s ease-in-out infinite;
        }

        .floating-element:nth-child(1) {
            width: 100px;
            height: 100px;
            top: 20%;
            left: 10%;
            animation-delay: 0s;
        }

        .floating-element:nth-child(2) {
            width: 60px;
            height: 60px;
            top: 60%;
            right: 10%;
            animation-delay: 2s;
        }

        .floating-element:nth-child(3) {
            width: 80px;
            height: 80px;
            bottom: 20%;
            left: 20%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }
    </style>
</head>
<body>
<!-- Floating Background Elements -->
<div class="floating-elements">
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    <div class="floating-element"></div>
</div>

<!-- Navigation -->
<nav class="navbar">
    <div class="nav-container">
        <div class="logo">
            <i class="fas fa-train"></i>
            <span>TSBS</span>
        </div>
        <ul class="nav-links">
            <li><a href="#home">Home</a></li>
            <li><a href="#services">Services</a></li>
            <li><a href="#about">About</a></li>
            <li><a href="#contact">Contact</a></li>
        </ul>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero-section">
    <div class="hero-content">
        <h1 class="hero-title">🚆 Train Schedule Booking System</h1>
        <p class="hero-subtitle">Experience seamless train travel with our advanced booking and payment management system</p>
    </div>

    <!-- Image Slider -->
    <div class="slider-container">
        <div class="slider">
            <div class="slide active">
                <img src="https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Modern Train">
                <div class="slide-overlay">
                    <div class="slide-title">Modern High-Speed Trains</div>
                    <div class="slide-description">Experience comfort and efficiency with our state-of-the-art railway system</div>
                </div>
            </div>
            <div class="slide">
                <img src="https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Train Journey">
                <div class="slide-overlay">
                    <div class="slide-title">Scenic Railway Adventures</div>
                    <div class="slide-description">Discover breathtaking landscapes on your journey across the country</div>
                </div>
            </div>
            <div class="slide">
                <img src="https://images.unsplash.com/photo-1558618666-fcd25c85cd64?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Train Station">
                <div class="slide-overlay">
                    <div class="slide-title">Premium Station Experience</div>
                    <div class="slide-description">Modern facilities and exceptional service at every station</div>
                </div>
            </div>
        </div>
        <div class="slider-nav">
            <div class="nav-dot active" onclick="currentSlide(1)"></div>
            <div class="nav-dot" onclick="currentSlide(2)"></div>
            <div class="nav-dot" onclick="currentSlide(3)"></div>
        </div>
    </div>
</section>

<!-- Actions Section -->
<section class="actions-section">
    <h2 class="section-title">Booking & Payment Management</h2>
    <p class="section-subtitle">Choose from our comprehensive range of services designed to make your travel experience effortless</p>

    <div class="cards-grid">
        <div class="action-card" onclick="location.href='bookSeat.jsp'">
            <div class="card-icon">
                <i class="fas fa-ticket-alt"></i>
            </div>
            <h3 class="card-title">Book Your Seat</h3>
            <p class="card-description">Reserve your preferred seat with our intelligent booking system. Choose from various classes and enjoy real-time availability.</p>
            <button class="card-button">Book Now</button>
        </div>

        <div class="action-card" onclick="location.href='confirmBooking.jsp'">
            <div class="card-icon">
                <i class="fas fa-check-circle"></i>
            </div>
            <h3 class="card-title">Confirm Booking</h3>
            <p class="card-description">Verify and confirm your reservation details. Review your journey information and finalize your travel plans.</p>
            <button class="card-button">Confirm</button>
        </div>

        <div class="action-card" onclick="location.href='cancelBooking.jsp'">
            <div class="card-icon">
                <i class="fas fa-times-circle"></i>
            </div>
            <h3 class="card-title">Cancel Booking</h3>
            <p class="card-description">Need to change your plans? Cancel your booking easily with our flexible cancellation policy and instant refunds.</p>
            <button class="card-button">Cancel</button>
        </div>

        <div class="action-card" onclick="location.href='checkPayment.jsp'">
            <div class="card-icon">
                <i class="fas fa-credit-card"></i>
            </div>
            <h3 class="card-title">Payment Status</h3>
            <p class="card-description">Track your payment status, view transaction history, and manage your billing information securely.</p>
            <button class="card-button">Check Status</button>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="footer-content">
        <div class="footer-links">
            <a href="#privacy">Privacy Policy</a>
            <a href="#terms">Terms of Service</a>
            <a href="#support">Support</a>
            <a href="#help">Help Center</a>
        </div>
        <p>&copy; 2024 Train Schedule Booking System. All rights reserved. | Designed with ❤️ for exceptional travel experiences</p>
    </div>
</footer>

<script>
    // Image Slider Functionality
    let slideIndex = 1;
    let slideInterval;

    function showSlide(n) {
        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.nav-dot');

        if (n > slides.length) { slideIndex = 1; }
        if (n < 1) { slideIndex = slides.length; }

        slides.forEach(slide => slide.classList.remove('active'));
        dots.forEach(dot => dot.classList.remove('active'));

        slides[slideIndex - 1].classList.add('active');
        dots[slideIndex - 1].classList.add('active');
    }

    function currentSlide(n) {
        clearInterval(slideInterval);
        showSlide(slideIndex = n);
        autoSlide();
    }

    function nextSlide() {
        showSlide(slideIndex += 1);
    }

    function autoSlide() {
        slideInterval = setInterval(nextSlide, 4000);
    }

    // Initialize slider
    document.addEventListener('DOMContentLoaded', function() {
        showSlide(slideIndex);
        autoSlide();
    });

    // Smooth scrolling for navigation links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });

    // Add scroll effect to navbar
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 100) {
            navbar.style.background = 'rgba(255, 255, 255, 0.98)';
        } else {
            navbar.style.background = 'rgba(255, 255, 255, 0.95)';
        }
    });

    // Intersection Observer for animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.animationDelay = '0s';
                entry.target.style.animationFillMode = 'both';
            }
        });
    }, observerOptions);

    // Observe all cards for animation
    document.querySelectorAll('.action-card').forEach((card, index) => {
        card.style.animationDelay = `${index * 0.1}s`;
        observer.observe(card);
    });
</script>
</body>
</html>
