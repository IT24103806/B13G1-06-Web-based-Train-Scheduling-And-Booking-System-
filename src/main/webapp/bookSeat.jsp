<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Book a Train Seat</title>
</head>
<body>
<h2>Train Booking Form</h2>
<form action="BookingServlet" method="post">
    User ID: <input type="text" name="userId" required><br><br>
    Schedule ID: <input type="text" name="scheduleId" required><br><br>
    Seat No: <input type="text" name="seatNo" required><br><br>
    Amount: <input type="text" name="amount" required><br><br>
    <input type="submit" value="Book Seat">
</form>
</body>
</html>
