<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Feedback List</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  </head>
<body>
<div class="container">
  <div class="card">
    <h2 class="title">All Feedback</h2>
    <table>
        <thead>
        <tr>
            <th>ID</th>
            <th>User</th>
            <th>Subject</th>
            <th>Status</th>
            <th>Created</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="f" items="${feedbackList}">
            <tr>
                <td>${f.feedbackId}</td>
                <td>${f.userId}</td>
                <td>${f.subject}</td>
                <td>${f.status}</td>
                <td>${f.createdAt}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="toolbar" style="margin-top:12px">
      <a class="btn btn-outline" href="${pageContext.request.contextPath}/views/auth/dashboard.jsp">Home</a>
      <a class="btn btn-accent" href="${pageContext.request.contextPath}/views/Booking&Payment/dashboard.jsp">Booking & Payment</a>
    </div>
  </div>
</div>
</body>
</html>


