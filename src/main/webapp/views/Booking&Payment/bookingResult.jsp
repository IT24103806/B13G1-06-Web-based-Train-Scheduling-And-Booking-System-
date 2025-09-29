<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Result - TSBS</title>
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

        .result-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 50px 40px;
            width: 100%;
            max-width: 650px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.3);
            animation: slideInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .result-container::before {
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

        .result-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
        }

        .result-icon {
            font-size: 4em;
            margin-bottom: 20px;
            animation: bounce 1s ease-in-out;
        }

        .result-icon.success {
            color: #4caf50;
        }

        .result-icon.error {
            color: #f44336;
        }

        @keyframes bounce {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.2);
            }
        }

        .result-title {
            font-size: 2.5em;
            font-weight: 700;
            color: white;
            margin-bottom: 15px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .result-message {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        .result-message p {
            color: white;
            font-size: 1.2em;
            line-height: 1.8;
            margin-bottom: 0;
        }

        .booking-details {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        .booking-details h3 {
            color: white;
            font-size: 1.3em;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            color: rgba(255, 255, 255, 0.8);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .detail-value {
            color: white;
            font-weight: 600;
            font-size: 1.1em;
        }

        .button-group {
            display: flex;
            gap: 15px;
            margin-top: 30px;
            position: relative;
            z-index: 2;
        }

        .action-button {
            flex: 1;
            padding: 18px;
            border: none;
            border-radius: 15px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            position: relative;
            overflow: hidden;
        }

        .action-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.3), transparent);
            transition: left 0.5s ease;
        }

        .action-button:hover::before {
            left: 100%;
        }

        .btn-primary {
            background: linear-gradient(45deg, #0078d7, #00bcd4);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(0, 120, 215, 0.4);
        }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.3);
            color: white;
        }

        .btn-secondary:hover {
            background: rgba(255, 255, 255, 0.2);
            transform: translateY(-3px);
        }

        .success-badge {
            display: inline-block;
            background: rgba(76, 175, 80, 0.2);
            border: 2px solid rgba(76, 175, 80, 0.4);
            color: #4caf50;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 15px;
        }

        .error-badge {
            display: inline-block;
            background: rgba(244, 67, 54, 0.2);
            border: 2px solid rgba(244, 67, 54, 0.4);
            color: #f44336;
            padding: 10px 20px;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 15px;
        }

        .info-card {
            background: rgba(33, 150, 243, 0.15);
            border-left: 4px solid #2196f3;
            border-radius: 10px;
            padding: 20px;
            margin-top: 20px;
            position: relative;
            z-index: 2;
        }

        .info-card p {
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.6;
            margin: 0;
        }

        @media (max-width: 768px) {
            .result-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .result-title {
                font-size: 2em;
            }

            .button-group {
                flex-direction: column;
            }

            .detail-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 8px;
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

<div class="result-container">
    <div class="result-header">
        <c:choose>
            <c:when test="${not empty booking || (not empty resultMessage && resultMessage.contains('successful'))}">
                <div class="result-icon success">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h1 class="result-title">Booking Successful!</h1>
                <span class="success-badge">Confirmed</span>
            </c:when>
            <c:otherwise>
                <div class="result-icon error">
                    <i class="fas fa-times-circle"></i>
                </div>
                <h1 class="result-title">Booking Failed</h1>
                <span class="error-badge">Action Required</span>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty resultMessage}">
        <div class="result-message">
            <p>${resultMessage}</p>
        </div>
    </c:if>

    <c:if test="${not empty booking}">
        <div class="booking-details">
            <h3>
                <i class="fas fa-info-circle"></i>
                Booking Details
            </h3>
            <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-hashtag"></i>
                    Status
                </span>
                <span class="detail-value">${booking}</span>
            </div>
        </div>

        <div class="info-card">
            <p><strong>Next Steps:</strong> Please proceed to payment to confirm your booking. Your seat will be held for 15 minutes.</p>
        </div>
    </c:if>

    <c:if test="${not empty error}">
        <div class="booking-details">
            <h3>
                <i class="fas fa-exclamation-triangle"></i>
                Error Details
            </h3>
            <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-info-circle"></i>
                    Message
                </span>
                <span class="detail-value" style="color: #f44336;">${error}</span>
            </div>
        </div>

        <div class="info-card">
            <p><strong>Suggestion:</strong> Please check your booking details and try again. If the problem persists, contact our support team.</p>
        </div>
    </c:if>

    <div class="button-group">
        <a href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp" class="action-button btn-secondary">
            <i class="fas fa-home"></i>
            Dashboard
        </a>
        <c:choose>
            <c:when test="${not empty booking || (not empty resultMessage && resultMessage.contains('successful'))}">
                <a href="${pageContext.request.contextPath}/views/Booking&Payment/checkPayment.jsp" class="action-button btn-primary">
                    <i class="fas fa-credit-card"></i>
                    Proceed to Payment
                </a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/views/Booking&Payment/bookSeat.jsp" class="action-button btn-primary">
                    <i class="fas fa-redo"></i>
                    Try Again
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        const icon = document.querySelector('.result-icon');
        if (icon) {
            setTimeout(() => {
                icon.style.transform = 'scale(1)';
            }, 100);
        }
    });
</script>
</body>
</html>