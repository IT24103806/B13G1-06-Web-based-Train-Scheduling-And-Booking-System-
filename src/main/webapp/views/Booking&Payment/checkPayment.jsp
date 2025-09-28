<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Check Payment</title>
</head>
<body>
<h2>Check & Make Payment</h2>
<form action="PaymentServlet" method="post">
    <label>Booking ID:</label>
    <input type="number" name="bookingId" required><br>

    <label>Amount:</label>
    <input type="number" step="0.01" name="amount" required><br>

    <label>Method:</label>
    <select name="method">
        <option value="CreditCard">Credit Card</option>
        <option value="DebitCard">Debit Card</option>
        <option value="Cash">Cash</option>
    </select><br>

    <button type="submit">Pay</button>
</form>

<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>
<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

</body>
</html>
