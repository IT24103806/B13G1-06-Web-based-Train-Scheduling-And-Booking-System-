<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Seat Reservation Hold</title>
  <style>
    body {font-family: Arial, sans-serif; background:#0f172a; color:#e2e8f0;}
    .card {max-width: 720px; margin: 40px auto; padding: 24px; background:#111827; border-radius:12px; box-shadow:0 10px 25px rgba(0,0,0,.3)}
    input, button {width:100%; padding:12px; margin:8px 0; border-radius:8px; border:1px solid #334155; background:#0b1324; color:#e2e8f0}
    button {background:#f59e0b; border:none; cursor:pointer}
    a {color:#93c5fd}
    .msg {color:#86efac}
  </style>
  <meta name="viewport" content="width=device-width, initial-scale=1" />
</head>
<body>
<div class="card">
  <h2>Place Seat on Hold</h2>
  <c:if test="${not empty message}"><div class="msg">${message}</div></c:if>
  <form method="post" action="${pageContext.request.contextPath}/ReservationServlet">
    <input type="hidden" name="action" value="hold" />
    <input type="number" name="scheduleId" placeholder="Schedule ID" required />
    <input type="text" name="seatNo" placeholder="Seat No (e.g., A1)" required />
    <input type="number" name="minutes" placeholder="Hold minutes (e.g., 10)" value="10" required />
    <button type="submit">Hold Seat</button>
  </form>

  <h3 style="margin-top:24px">Cancel Reservation</h3>
  <form method="post" action="${pageContext.request.contextPath}/ReservationServlet">
    <input type="hidden" name="action" value="cancel" />
    <input type="number" name="reservationId" placeholder="Reservation ID" required />
    <button type="submit">Cancel Hold</button>
  </form>

  <p><a href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp">Back to Dashboard</a></p>
</div>
</body>
</html>


