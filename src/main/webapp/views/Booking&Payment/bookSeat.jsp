<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Book a Train Seat - TSBS</title>
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

        /* Floating Background Elements */
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
            animation-delay: 0s;
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

        /* Back to Dashboard Button */
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

        /* Main Container */
        .booking-container {
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

        .booking-container::before {
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

        /* Header */
        .form-header {
            text-align: center;
            margin-bottom: 40px;
            position: relative;
            z-index: 2;
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
            margin-bottom: 20px;
        }

        .train-icon {
            font-size: 3em;
            color: #4fc3f7;
            margin-bottom: 20px;
            animation: bounce 2s infinite;
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% {
                transform: translateY(0);
            }
            40% {
                transform: translateY(-10px);
            }
            60% {
                transform: translateY(-5px);
            }
        }

        /* Form Styling */
        .booking-form {
            position: relative;
            z-index: 2;
        }

        .form-group {
            margin-bottom: 30px;
            position: relative;
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

        .form-input:valid {
            border-color: #4caf50;
        }

        /* Submit Button */
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

        .submit-button:active {
            transform: translateY(-1px);
        }

        /* Form Row for Better Layout */
        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        /* Seat Selection Visual */
        .seat-selector {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 15px;
            padding: 20px;
            background: rgba(255, 255, 255, 0.05);
            border-radius: 15px;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .seat {
            aspect-ratio: 1;
            background: rgba(255, 255, 255, 0.1);
            border: 2px solid rgba(255, 255, 255, 0.2);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            color: rgba(255, 255, 255, 0.7);
            font-weight: 500;
        }

        .seat:hover {
            background: rgba(79, 195, 247, 0.3);
            border-color: #4fc3f7;
            transform: scale(1.05);
        }

        .seat.selected {
            background: linear-gradient(45deg, #4fc3f7, #29b6f6);
            border-color: #29b6f6;
            color: white;
            transform: scale(1.1);
        }

        .seat.occupied {
            background: rgba(244, 67, 54, 0.3);
            border-color: #f44336;
            cursor: not-allowed;
            opacity: 0.6;
        }

        /* Amount Display */
        .amount-display {
            background: linear-gradient(45deg, rgba(76, 175, 80, 0.2), rgba(139, 195, 74, 0.2));
            border: 2px solid rgba(76, 175, 80, 0.3);
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            margin: 20px 0;
        }

        .amount-label {
            color: rgba(255, 255, 255, 0.8);
            font-size: 1em;
            margin-bottom: 5px;
        }

        .amount-value {
            color: #4caf50;
            font-size: 2em;
            font-weight: bold;
            text-shadow: 0 2px 10px rgba(76, 175, 80, 0.3);
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .booking-container {
                margin: 10px;
                padding: 30px 20px;
            }

            .form-title {
                font-size: 2em;
            }

            .form-row {
                grid-template-columns: 1fr;
            }

            .back-button {
                top: 15px;
                left: 15px;
                padding: 10px 15px;
            }
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

        /* Success Message */
        .success-message {
            background: rgba(76, 175, 80, 0.2);
            border: 1px solid rgba(76, 175, 80, 0.3);
            color: #4caf50;
            padding: 15px 20px;
            border-radius: 10px;
            margin-bottom: 20px;
            display: none;
            align-items: center;
            gap: 10px;
        }

        .success-message.show {
            display: flex;
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
    </style>
</head>
<body>
<!-- Floating Background Elements -->
<div class="floating-elements">
    <div class="floating-element"></div>
    <div class="floating-element"></div>
    <div class="floating-element"></div>
</div>

<!-- Back to Dashboard Button -->
<a href="/views/Booking&Payment/dashboard.jsp" class="back-button">
    <i class="fas fa-arrow-left"></i>
    Back to Dashboard
</a>

<!-- Main Booking Container -->
<div class="booking-container">
    <!-- Header -->
    <div class="form-header">
        <i class="fas fa-train train-icon"></i>
        <h1 class="form-title">Book Your Train Seat</h1>
        <p class="form-subtitle">Reserve your perfect seat for a comfortable journey</p>
    </div>

    <!-- Success Message -->
    <div class="success-message" id="successMessage">
        <i class="fas fa-check-circle"></i>
        <span>Booking details updated successfully!</span>
    </div>

    <!-- Booking Form -->
    <form class="booking-form" action="BookingServlet" method="post" onsubmit="return validateForm()">

        <div class="form-row">
            <div class="form-group">
                <label class="form-label">
                    <i class="fas fa-user"></i>
                    User ID
                </label>
                <input type="number" name="userId" class="form-input" placeholder="Enter your User ID" required min="1">
            </div>

            <div class="form-group">
                <label class="form-label">
                    <i class="fas fa-calendar-alt"></i>
                    Schedule ID
                </label>
                <input type="number" name="scheduleId" class="form-input" placeholder="Enter Schedule ID" required min="1" onchange="updateAmount()">
            </div>
        </div>

        <div class="form-group">
            <label class="form-label">
                <i class="fas fa-chair"></i>
                Seat Selection
            </label>
            <input type="text" name="seatNo" id="seatInput" class="form-input" placeholder="Click a seat below or enter manually" required readonly>

            <!-- Visual Seat Selector -->
            <div class="seat-selector">
                <div class="seat" onclick="selectSeat('A1')">A1</div>
                <div class="seat" onclick="selectSeat('A2')">A2</div>
                <div class="seat occupied">A3</div>
                <div class="seat" onclick="selectSeat('A4')">A4</div>
                <div class="seat" onclick="selectSeat('B1')">B1</div>
                <div class="seat occupied">B2</div>
                <div class="seat" onclick="selectSeat('B3')">B3</div>
                <div class="seat" onclick="selectSeat('B4')">B4</div>
                <div class="seat" onclick="selectSeat('C1')">C1</div>
                <div class="seat" onclick="selectSeat('C2')">C2</div>
                <div class="seat" onclick="selectSeat('C3')">C3</div>
                <div class="seat occupied">C4</div>
                <div class="seat" onclick="selectSeat('D1')">D1</div>
                <div class="seat" onclick="selectSeat('D2')">D2</div>
                <div class="seat" onclick="selectSeat('D3')">D3</div>
                <div class="seat" onclick="selectSeat('D4')">D4</div>
            </div>
        </div>

        <!-- Amount Display -->
        <div class="amount-display">
            <div class="amount-label">Total Amount</div>
            <div class="amount-value" id="amountDisplay">$0.00</div>
            <input type="hidden" name="amount" id="amountInput" step="0.01" required>
        </div>

        <button type="submit" class="submit-button">
            <i class="fas fa-ticket-alt"></i>
            Reserve My Seat
        </button>
    </form>
</div>

<script>
    // Seat Selection Functionality
    let selectedSeat = null;
    const baseFare = 25.50; // Base fare amount

    function selectSeat(seatNumber) {
        // Remove previous selection
        if (selectedSeat) {
            selectedSeat.classList.remove('selected');
        }

        // Select new seat
        const seatElement = event.target;
        if (!seatElement.classList.contains('occupied')) {
            seatElement.classList.add('selected');
            selectedSeat = seatElement;

            // Update input field
            document.getElementById('seatInput').value = seatNumber;

            // Update amount
            updateAmount();

            // Show success message briefly
            showSuccessMessage();
        }
    }

    function updateAmount() {
        const scheduleId = document.querySelector('input[name="scheduleId"]').value;
        const seatNo = document.getElementById('seatInput').value;

        if (scheduleId && seatNo) {
            // Calculate amount based on schedule and seat (you can customize this logic)
            let multiplier = 1;

            // Premium seats cost more
            if (seatNo.includes('A')) multiplier = 1.3; // First class
            else if (seatNo.includes('B')) multiplier = 1.1; // Business class
            else multiplier = 1; // Economy class

            // Different schedules have different base prices
            const scheduleMultiplier = (parseInt(scheduleId) % 3) + 1;

            const totalAmount = (baseFare * multiplier * scheduleMultiplier).toFixed(2);

            document.getElementById('amountDisplay').textContent = `$${totalAmount}`;
            document.getElementById('amountInput').value = totalAmount;
        }
    }

    function showSuccessMessage() {
        const message = document.getElementById('successMessage');
        message.querySelector('span').textContent = 'Seat selected successfully!';
        message.classList.add('show');

        setTimeout(() => {
            message.classList.remove('show');
        }, 2000);
    }

    function validateForm() {
        const userId = document.querySelector('input[name="userId"]').value;
        const scheduleId = document.querySelector('input[name="scheduleId"]').value;
        const seatNo = document.getElementById('seatInput').value;
        const amount = document.getElementById('amountInput').value;

        if (!userId || !scheduleId || !seatNo || !amount) {
            alert('Please fill in all required fields and select a seat.');
            return false;
        }

        // Show final success message
        const message = document.getElementById('successMessage');
        message.querySelector('span').textContent = 'Booking submitted successfully! Redirecting...';
        message.classList.add('show');

        return true;
    }

    // Add smooth hover effects to form inputs
    document.querySelectorAll('.form-input').forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'scale(1.02)';
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'scale(1)';
        });
    });

    // Auto-update amount when schedule changes
    document.querySelector('input[name="scheduleId"]').addEventListener('input', updateAmount);

    // Initialize amount display
    updateAmount();
</script>
</body>
</html>