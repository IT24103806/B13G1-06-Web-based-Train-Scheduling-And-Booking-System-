<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Confirm Booking</title>
</head>
<body>
<h2>Confirm Your Booking</h2>
<form action="ConfirmBookingServlet" method="post">
    <label>Booking ID:</label>
    <input type="number" name="bookingId" required><br>
    <button type="submit">Confirm Booking</button>
</form>

<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

</body>
</html>
