<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Book a Train Seat</title>
</head>
<body>
<h2>Train Booking Form</h2>
<form action="BookingServlet" method="post">
    <label>User ID:</label>
    <input type="number" name="userId" required><br>

    <label>Schedule ID:</label>
    <input type="number" name="scheduleId" required><br>

    <label>Seat No:</label>
    <input type="text" name="seatNo" required><br>

    <label>Amount:</label>
    <input type="number" step="0.01" name="amount" required><br>

    <button type="submit">Book Seat</button>
</form>
</body>
</html>
