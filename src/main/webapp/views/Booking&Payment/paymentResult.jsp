<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Payment Result</title>
</head>
<body>
<h2>Payment Result</h2>

<c:if test="${not empty message}">
    <p style="color:green;">${message}</p>
</c:if>

<c:if test="${not empty error}">
    <p style="color:red;">${error}</p>
</c:if>

<c:if test="${payment != null}">
    <p><b>Payment ID:</b> ${payment.paymentId}</p>
    <p><b>Booking ID:</b> ${payment.bookingId}</p>
    <p><b>Amount:</b> ${payment.amount}</p>
    <p><b>Method:</b> ${payment.method}</p>
    <p><b>Status:</b> ${payment.status}</p>
    <p><b>Txn ID:</b> ${payment.gatewayTxnId}</p>
</c:if>

<a href="/views/Booking&Payment/dashboard.jsp">🔙 Back to Dashboard</a>
</body>
</html>
