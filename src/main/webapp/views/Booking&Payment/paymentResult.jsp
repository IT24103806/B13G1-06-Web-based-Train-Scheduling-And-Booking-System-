<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Result - TSBS</title>
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
            max-width: 700px;
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
            font-size: 5em;
            margin-bottom: 20px;
            animation: checkmarkAnimation 0.8s ease-in-out;
        }

        .result-icon.success {
            color: #4caf50;
        }

        .result-icon.error {
            color: #f44336;
        }

        @keyframes checkmarkAnimation {
            0% {
                transform: scale(0) rotate(-45deg);
                opacity: 0;
            }
            50% {
                transform: scale(1.2) rotate(10deg);
            }
            100% {
                transform: scale(1) rotate(0deg);
                opacity: 1;
            }
        }

        .result-title {
            font-size: 2.8em;
            font-weight: 700;
            color: white;
            margin-bottom: 15px;
            text-shadow: 0 4px 20px rgba(0, 0, 0, 0.3);
        }

        .result-subtitle {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        .success-badge {
            display: inline-block;
            background: rgba(76, 175, 80, 0.25);
            border: 2px solid rgba(76, 175, 80, 0.5);
            color: #4caf50;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 15px;
            font-size: 1.1em;
        }

        .error-badge {
            display: inline-block;
            background: rgba(244, 67, 54, 0.25);
            border: 2px solid rgba(244, 67, 54, 0.5);
            color: #f44336;
            padding: 12px 25px;
            border-radius: 25px;
            font-weight: 600;
            margin-top: 15px;
            font-size: 1.1em;
        }

        .message-box {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 25px;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        .message-box p {
            color: white;
            font-size: 1.15em;
            line-height: 1.8;
            margin: 0;
        }

        .payment-details {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            position: relative;
            z-index: 2;
        }

        .payment-details h3 {
            color: white;
            font-size: 1.4em;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            gap: 12px;
            border-bottom: 2px solid rgba(255, 255, 255, 0.1);
            padding-bottom: 15px;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 0;
            border-bottom: 1px solid rgba(255, 255, 255, 0.08);
        }

        .detail-row:last-child {
            border-bottom: none;
        }

        .detail-label {
            color: rgba(255, 255, 255, 0.75);
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 1.05em;
        }

        .detail-value {
            color: white;
            font-weight: 600;
            font-size: 1.15em;
        }

        .detail-value.amount {
            color: #4caf50;
            font-size: 1.3em;
        }

        .detail-value.status-success {
            color: #4caf50;
        }

        .detail-value.status-failed {
            color: #f44336;
        }

        .button-group {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin-top: 30px;
            position: relative;
            z-index: 2;
        }

        .action-button {
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
            grid-column: 1 / -1;
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

        .btn-success {
            background: linear-gradient(45deg, #4caf50, #8bc34a);
            color: white;
        }

        .btn-success:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 40px rgba(76, 175, 80, 0.4);
        }

        .info-card {
            background: rgba(33, 150, 243, 0.15);
            border-left: 4px solid #2196f3;
            border-radius: 10px;
            padding: 20px;
            margin-top: 25px;
            position: relative;
            z-index: 2;
        }

        .info-card p {
            color: rgba(255, 255, 255, 0.9);
            line-height: 1.7;
            margin: 0;
        }

        .confetti {
            position: fixed;
            width: 10px;
            height: 10px;
            background: #f0f;
            position: absolute;
            animation: confetti-fall 3s linear forwards;
        }

        @keyframes confetti-fall {
            to {
                transform: translateY(100vh) rotate(360deg);
                opacity: 0;
            }
        }

        @media (max-width: 768px) {
            .result-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .result-title {
                font-size: 2.2em;
            }

            .button-group {
                grid-template-columns: 1fr;
            }

            .btn-primary {
                grid-column: 1;
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
            <c:when test="${not empty message || payment != null}">
                <div class="result-icon success">
                    <i class="fas fa-check-circle"></i>
                </div>
                <h1 class="result-title">Payment Successful!</h1>
                <p class="result-subtitle">Your booking has been confirmed</p>
                <span class="success-badge">Transaction Complete</span>
            </c:when>
            <c:otherwise>
                <div class="result-icon error">
                    <i class="fas fa-times-circle"></i>
                </div>
                <h1 class="result-title">Payment Failed</h1>
                <p class="result-subtitle">Transaction could not be processed</p>
                <span class="error-badge">Action Required</span>
            </c:otherwise>
        </c:choose>
    </div>

    <c:if test="${not empty message}">
    <div class="message-box">
        <p><i class="fas fa-info-circle"></i> ${message}</p>
    </div>
    </c:if>

    <c:if test="${not empty error}">
    <div class="message-box" style="background: rgba(244, 67, 54, 0.15); border: 1px solid rgba(244, 67, 54, 0.3);">
        <p><i class="fas fa-exclamation-triangle"></i> ${error}</p>
    </div>
    </c:if>

    <c:if test="${payment != null}">
    <div class="payment-details">
        <h3>
            <i class="fas fa-receipt"></i>
            Payment Receipt
        </h3>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-hashtag"></i>
                    Payment ID
                </span>
            <span class="detail-value">#${payment.paymentId}</span>
        </div>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-ticket-alt"></i>
                    Booking ID
                </span>
            <span class="detail-value">#${payment.bookingId}</span>
        </div>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-dollar-sign"></i>
                    Amount Paid
                </span>
            <span class="detail-value amount">$${payment.amount}</span>
        </div>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-credit-card"></i>
                    Payment Method
                </span>
            <span class="detail-value">${payment.method}</span>
        </div>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-check-circle"></i>
                    Status
                </span>
            <span class="detail-value status-success">${payment.status}</span>
        </div>

        <div class="detail-row">
                <span class="detail-label">
                    <i class="fas fa-exchange-alt"></i>
                    Transaction ID
                </span>
            <span class="detail-value">${payment.gatewayTxnId}</span>
        </div>
    </div>

    <div class="info-card">
        <p><strong><i class="fas fa-envelope"></i> Confirmation Email:</strong> A detailed receipt has been sent to your registered email address. Please keep the transaction ID for future reference.</p>
    </div>
    </c:if>

    <div class="button-group">
        <c:choose>
        <c:when test="${not empty message || payment != null}">
        <a href