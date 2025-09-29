<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Confirm Booking - TSBS</title>
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

        .confirm-container {
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

        .confirm-container::before {
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

        .confirm-icon {
            font-size: 3.5em;
            color: #4fc3f7;
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.1);
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

        .confirm-form {
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
            color: #4fc3f7;
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
            border-color: #4fc3f7;
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(79, 195, 247, 0.3);
        }

        .submit-button {
            width: 100%;
            padding: 18px;
            background: linear-gradient(45deg, #4caf50, #8bc34a);
            border: none;
            border-radius: 15px;
            color: white;
            font-size: 1.2em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-top: 10px;
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
            box-shadow: 0 15px 40px rgba(76, 175, 80, 0.4);
            background: linear-gradient(45deg, #388e3c, #689f38);
        }

        .message-box {
            padding: 18px 20px;
            border-radius: 12px;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
            font-size: 1.05em;
            font-weight: 500;
            animation: slideInDown 0.5s ease-out;
        }

        @keyframes slideInDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .success-message {
            background: rgba(76, 175, 80, 0.2);
            border: 2px solid rgba(76, 175, 80, 0.4);
            color: #4caf50;
        }

        .error-message {
            background: rgba(244, 67, 54, 0.2);
            border: 2px solid rgba(244, 67, 54, 0.4);
            color: #f44336;
        }

        .message-box i {
            font-size: 1.5em;
        }

        .info-card {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 25px;
        }

        .info-card h3 {
            color: white;
            font-size: 1.1em;
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .info-card p {
            color: rgba(255, 255, 255, 0.85);
            line-height: 1.6;
        }

        @media (max-width: 768px) {
            .confirm-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .form-title {
                font-size: 2em;
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

<div class="confirm-container">
    <div class="form-header">
        <i class="fas fa-check-circle confirm-icon"></i>
        <h1 class="form-title">Confirm Booking</h1>
        <p class="form-subtitle">Finalize your reservation and complete your booking</p>
    </div>

    <c:if test="${not empty message}">
        <div class="message-box success-message">
            <i class="fas fa-check-circle"></i>
            <span>${message}</span>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="message-box error-message">
            <i class="fas fa-exclamation-circle"></i>
            <span>${error}</span>
        </div>
    </c:if>

    <div class="info-card">
        <h3>
            <i class="fas fa-info-circle" style="color: #4fc3f7;"></i>
            Before You Confirm
        </h3>
        <p>Please ensure you have your Booking ID ready. Once confirmed, your booking will be finalized and you'll receive a confirmation with your PNR number.</p>
    </div>

    <form class="confirm-form" action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-hashtag"></i>
                Booking ID
            </label>
            <input type="number" name="bookingId" class="form-input"
                   placeholder="Enter your Booking ID" required min="1">
        </div>

        <button type="submit" class="submit-button">
            <i class="fas fa-check-double"></i>
            Confirm My Booking
        </button>
    </form>
</div>

<script>
    function validateForm() {
        const bookingId = document.querySelector('input[name="bookingId"]').value;
        if (!bookingId || bookingId < 1) {
            alert('Please enter a valid Booking ID');
            return false;
        }
        return true;
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