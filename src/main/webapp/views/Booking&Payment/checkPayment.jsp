<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Payment - TSBS</title>
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

        .payment-container {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 25px;
            padding: 50px 40px;
            width: 100%;
            max-width: 600px;
            box-shadow: 0 25px 80px rgba(0, 0, 0, 0.3);
            animation: slideInUp 0.8s ease-out;
            position: relative;
            overflow: hidden;
        }

        .payment-container::before {
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

        .payment-icon {
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

        .payment-form {
            position: relative;
            z-index: 2;
        }

        .form-group {
            margin-bottom: 25px;
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

        .form-input, .form-select {
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

        .form-input:focus, .form-select:focus {
            border-color: #4fc3f7;
            background: rgba(255, 255, 255, 0.15);
            transform: translateY(-2px);
            box-shadow: 0 10px 30px rgba(79, 195, 247, 0.3);
        }

        .form-select {
            cursor: pointer;
        }

        .form-select option {
            background: #5a67d8;
            color: white;
            padding: 10px;
        }

        .payment-methods {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 15px;
            margin-top: 15px;
        }

        .payment-method-card {
            background: rgba(255, 255, 255, 0.08);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 12px;
            padding: 20px 10px;
            text-align: center;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
        }

        .payment-method-card:hover {
            background: rgba(79, 195, 247, 0.2);
            border-color: #4fc3f7;
            transform: translateY(-5px);
        }

        .payment-method-card.selected {
            background: rgba(79, 195, 247, 0.3);
            border-color: #4fc3f7;
            box-shadow: 0 10px 30px rgba(79, 195, 247, 0.3);
        }

        .payment-method-card i {
            font-size: 2.5em;
            color: white;
            margin-bottom: 8px;
        }

        .payment-method-card span {
            display: block;
            color: white;
            font-size: 0.9em;
            font-weight: 500;
        }

        .amount-display {
            background: linear-gradient(45deg, rgba(76, 175, 80, 0.2), rgba(139, 195, 74, 0.2));
            border: 2px solid rgba(76, 175, 80, 0.3);
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            margin: 25px 0;
        }

        .amount-label {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1em;
            margin-bottom: 8px;
        }

        .amount-value {
            color: #4caf50;
            font-size: 2.5em;
            font-weight: bold;
            text-shadow: 0 2px 10px rgba(76, 175, 80, 0.3);
        }

        .secure-badge {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            background: rgba(76, 175, 80, 0.15);
            border: 1px solid rgba(76, 175, 80, 0.3);
            border-radius: 10px;
            padding: 12px;
            margin-bottom: 20px;
            color: #4caf50;
            font-size: 0.95em;
        }

        .submit-button {
            width: 100%;
            padding: 18px;
            background: linear-gradient(45deg, #0078d7, #00bcd4);
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
            margin-top: 20px;
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
            box-shadow: 0 15px 40px rgba(0, 120, 215, 0.4);
            background: linear-gradient(45deg, #005fa3, #0097a7);
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

        @media (max-width: 768px) {
            .payment-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .form-title {
                font-size: 2em;
            }

            .payment-methods {
                grid-template-columns: 1fr;
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

<div class="payment-container">
    <div class="form-header">
        <i class="fas fa-credit-card payment-icon"></i>
        <h1 class="form-title">Payment</h1>
        <p class="form-subtitle">Complete your booking with secure payment</p>
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

    <div class="secure-badge">
        <i class="fas fa-lock"></i>
        <span>Secure Payment - Your information is protected with 256-bit SSL encryption</span>
    </div>

    <form class="payment-form" action="${pageContext.request.contextPath}/PaymentServlet" method="post" onsubmit="return validateForm()">
        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-hashtag"></i>
                Booking ID
            </label>
            <input type="number" name="bookingId" id="bookingId" class="form-input"
                   placeholder="Enter your Booking ID" required min="1">
        </div>

        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-dollar-sign"></i>
                Amount
            </label>
            <input type="number" step="0.01" name="amount" id="amount" class="form-input"
                   placeholder="Enter payment amount" required min="0.01">
        </div>

        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-wallet"></i>
                Payment Method
            </label>
            <input type="hidden" name="method" id="methodInput" value="CreditCard">

            <div class="payment-methods">
                <div class="payment-method-card selected" onclick="selectMethod('CreditCard', this)">
                    <i class="fas fa-credit-card"></i>
                    <span>Credit Card</span>
                </div>
                <div class="payment-method-card" onclick="selectMethod('DebitCard', this)">
                    <i class="fas fa-credit-card"></i>
                    <span>Debit Card</span>
                </div>
                <div class="payment-method-card" onclick="selectMethod('Cash', this)">
                    <i class="fas fa-money-bill-wave"></i>
                    <span>Cash</span>
                </div>
            </div>
        </div>

        <div class="amount-display">
            <div class="amount-label">Total Payment Amount</div>
            <div class="amount-value" id="displayAmount">$0.00</div>
        </div>

        <button type="submit" class="submit-button">
            <i class="fas fa-lock"></i>
            Process Payment
        </button>
    </form>
</div>

<script>
    function selectMethod(method, element) {
        document.querySelectorAll('.payment-method-card').forEach(card => {
            card.classList.remove('selected');
        });
        element.classList.add('selected');
        document.getElementById('methodInput').value = method;
    }

    document.getElementById('amount').addEventListener('input', function() {
        const amount = parseFloat(this.value) || 0;
        document.getElementById('displayAmount').textContent = '$' + amount.toFixed(2);
    });

    function validateForm() {
        const bookingId = document.getElementById('bookingId').value;
        const amount = document.getElementById('amount').value;
        const method = document.getElementById('methodInput').value;

        if (!bookingId || bookingId < 1) {
            alert('Please enter a valid Booking ID');
            return false;
        }

        if (!amount || parseFloat(amount) <= 0) {
            alert('Please enter a valid amount');
            return false;
        }

        if (!method) {
            alert('Please select a payment method');
            return false;
        }

        return confirm('Confirm payment of $' + parseFloat(amount).toFixed(2) + ' for Booking #' + bookingId + '?');
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