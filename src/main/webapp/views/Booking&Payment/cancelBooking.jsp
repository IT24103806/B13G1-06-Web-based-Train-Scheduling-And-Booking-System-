<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Cancel Booking</title>
</head>
<body>
<h2>Cancel Your Booking</h2>
<form action="CancelBookingServlet" method="post">
    Booking ID: <input type="text" name="bookingId" required><br><br>
    <input type="submit" value="Cancel Booking">
</form>
</body>
</html>
