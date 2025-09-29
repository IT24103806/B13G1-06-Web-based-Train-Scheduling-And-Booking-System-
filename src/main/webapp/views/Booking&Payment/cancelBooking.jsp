<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Cancel Booking - TSBS</title>
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
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            position: relative;
            overflow-x: hidden;
        }

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
            width: 120px;
            height: 120px;
            top: 10%;
            left: 15%;
        }

        .floating-element:nth-child(2) {
            width: 80px;
            height: 80px;
            top: 70%;
            right: 20%;
            animation-delay: 2s;
        }

        .floating-element:nth-child(3) {
            width: 100px;
            height: 100px;
            bottom: 15%;
            left: 25%;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0px) rotate(0deg);
            }
            50% {
                transform: translateY(-30px) rotate(180deg);
            }
        }

        .back-button {
            position: fixed;
            top: 30px;
            left: 30px;
            background: rgba(255, 255, 255, 0.2);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            padding: 12px 20px;
            border-radius: 50px;
            color: white;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            gap: 8px;
            z-index: 1000;
        }

        .back-button:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
        }

        .cancel-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 50px 40px;
            width: 100%;
            max-width: 550px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.3);
            animation: slideInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .cancel-container::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.03), transparent);
            transform: rotate(-45deg);
            animation: shimmer 3s ease-in-out infinite;
        }

        @keyframes shimmer {
            0%, 100% {
                transform: translateX(-100%) translateY(-100%) rotate(-45deg);
            }
            50% {
                transform: translateX(0%) translateY(0%) rotate(-45deg);
            }
        }

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

        .form-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .cancel-icon {
            font-size: 3.5em;
            color: #ff6b6b;
            margin-bottom: 20px;
            animation: shake 2s infinite;
        }

        @keyframes shake {
            0%, 100% {
                transform: rotate(0deg);
            }
            25% {
                transform: rotate(-5deg);
            }
            75% {
                transform: rotate(5deg);
            }
        }

        .form-title {
            font-size: 2.5em;
            font-weight: 700;
            color: white;
            margin-bottom: 10px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .form-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.1em;
        }

        .cancel-form {
            position: relative;
            z-index: 2;
        }

        .form-group {
            margin-bottom: 30px;
        }

        .form-label {
            display: block;
            color: white;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 1.1em;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .form-label i {
            color: #ff6b6b;
            width: 20px;
        }

        .form-input {
            width: 100%;
            padding: 15px 20px;
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 15px;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            color: white;
            font-size: 1.1em;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-input::placeholder {
            color: rgba(255, 255, 255, 0.6);
        }

        .form-input:focus {
            border-color: #ff6b6b;
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(255, 107, 107, 0.3);
        }

        .warning-card {
            background: rgba(255, 152, 0, 0.15);
            border: 2px solid rgba(255, 152, 0, 0.3);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 25px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                box-shadow: 0 0 0 0 rgba(255, 152, 0, 0.4);
            }
            50% {
                box-shadow: 0 0 20px 10px rgba(255, 152, 0, 0.1);
            }
        }

        .warning-card h3 {
            color: #ffa726;
            font-size: 1.1em;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .warning-card p {
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .warning-card ul {
            color: rgba(255, 255, 255, 0.85);
            margin-left: 25px;
            line-height: 1.8;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .submit-button {
            flex: 1;
            padding: 18px;
            background: linear-gradient(45deg, #f44336, #e91e63);
            border: none;
            border-radius: 15px;
            color: white;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .submit-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .submit-button:hover::before {
            left: 100%;
        }

        .submit-button:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(244, 67, 54, 0.4);
            background: linear-gradient(45deg, #d32f2f, #c2185b);
        }

        .back-link {
            flex: 1;
            padding: 18px;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 15px;
            color: white;
            font-size: 1.1em;
            font-weight: 600;
            text-decoration: none;
            text-align: center;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .back-link:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
        }

        .checkbox-group {
            display: flex;
            align-items: flex-start;
            gap: 12px;
            margin: 20px 0;
            padding: 15px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 10px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 20px;
            height: 20px;
            margin-top: 2px;
            cursor: pointer;
        }

        .checkbox-group label {
            color: rgba(255, 255, 255, 0.9);
            font-size: 0.95em;
            line-height: 1.5;
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .cancel-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .form-title {
                font-size: 2em;
            }

            .button-group {
                flex-direction: column;
            }

            .back-button {
                top: 15px;
                left: 15px;
                padding: 10px 15px;
            }
        }
    </style>
</head>
<body>
<div class="floating-elements">
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    <div class="floating-element"></div>
</div>

<a href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp" class="back-button">
    <i class="fas fa-arrow-left"></i>
    Back to Dashboard
</a>

<div class="cancel-container">
    <div class="form-header">
        <i class="fas fa-times-circle cancel-icon"></i>
        <h1 class="form-title">Cancel Booking</h1>
        <p class="form-subtitle">We're sorry to see you cancel. Please review our policy below.</p>
    </div>

    <div class="warning-card">
        <h3>
            <i class="fas fa-exclamation-triangle"></i>
            Cancellation Policy
        </h3>
        <p>Please be aware of the following:</p>
        <ul>
            <li>Cancellations made 24 hours before departure receive full refund</li>
            <li>Cancellations within 24 hours may incur a 20% fee</li>
            <li>No-show bookings are non-refundable</li>
            <li>Refunds will be processed within 5-7 business days</li>
        </ul>
    </div>

    <form class="cancel-form" action="${pageContext.request.contextPath}/CancelBookingServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-hashtag"></i>
                Booking ID
            </label>
            <input type="number" name="bookingId" class="form-input"
                   placeholder="Enter your Booking ID" required min="1" id="bookingIdInput">
        </div>

        <div class="checkbox-group">
            <input type="checkbox" id="confirmCancel" required>
            <label for="confirmCancel">
                I understand the cancellation policy and confirm that I want to cancel this booking. This action cannot be undone.
            </label>
        </div>

        <div class="button-group">
            <a href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp" class="back-link">
                <i class="fas fa-arrow-left"></i>
                Keep Booking
            </a>
            <button type="submit" class="submit-button">
                <i class="fas fa-ban"></i>
                Cancel Booking
            </button>
        </div>
    </form>
</div>

<script>
    function validateForm() {
        const bookingId = document.getElementById('bookingIdInput').value;
        const confirmCheck = document.getElementById('confirmCancel').checked;

        if (!bookingId || bookingId < 1) {
            alert('Please enter a valid Booking ID');
            return false;
        }

        if (!confirmCheck) {
            alert('Please confirm that you understand the cancellation policy');
            return false;
        }

        const confirmMessage = 'Are you absolutely sure you want to cancel booking #' + bookingId + '? This action cannot be undone.';
        return confirm(confirmMessage);
    }

    document.querySelectorAll('.form-input').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
    });
</script>
</body>
</html>