<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Confirm Booking</title>
</head>
<body>
<h2>Confirm Your Booking</h2>
<form action="ConfirmBookingServlet" method="post">
    Booking ID: <input type="text" name="bookingId" required><br><br>
    Transaction ID: <input type="text" name="txnId" required><br><br>
    <input type="submit" value="Confirm Booking">
</form>
</body>
</html>
