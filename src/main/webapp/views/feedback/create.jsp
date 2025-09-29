<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Submit Feedback</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>
<body>
<div class="container">
  <div class="card">
    <h2 class="title">Submit Feedback</h2>
    <c:if test="${not empty error}"><div class="error">${error}</div></c:if>
    <c:if test="${not empty message}"><div class="msg">${message}</div></c:if>
    <form method="post" action="${pageContext.request.contextPath}/FeedbackServlet">
        <input type="text" name="subject" placeholder="Subject" required />
        <textarea name="message" placeholder="Your feedback" rows="6" required></textarea>
        <button type="submit" class="btn btn-primary">Send Feedback</button>
    </form>
    <div class="toolbar">
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/views/auth/dashboard.jsp">Home</a>
      <a class="btn btn-accent" href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp">Booking & Payment</a>
    </div>
  </div>
</div>
</body>
</html>


