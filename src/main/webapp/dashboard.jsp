<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>TSBS Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f9;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        .menu {
            margin-top: 50px;
        }
        .menu a {
            display: inline-block;
            margin: 20px;
            padding: 15px 30px;
            text-decoration: none;
            font-size: 18px;
            background: #0078d7;
            color: white;
            border-radius: 8px;
        }
        .menu a:hover {
            background: #005fa3;
        }
    </style>
</head>
<body>
<h1>🚆 Train Schedule Booking System</h1>
<h2>Dashboard</h2>

<div class="menu">
    <a href="bookSeat.jsp">Book a Seat</a>
    <a href="confirmBooking.jsp">Confirm Booking</a>
    <a href="cancelBooking.jsp">Cancel Booking</a>
    <a href="checkPayment.jsp">Check Payment</a>
</div>
</body>
</html>
