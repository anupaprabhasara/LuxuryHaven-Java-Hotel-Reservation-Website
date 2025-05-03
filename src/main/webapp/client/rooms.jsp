<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Rooms - Luxury Haven Hotel</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
</head>
<body class="font-sans">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Main Content -->
<main class="py-16">
  <div class="container mx-auto px-6">
    <h1 class="text-4xl font-bold text-center mb-12">Our Luxurious Rooms</h1>

    <c:if test="${empty rooms}">
      <p class="text-center text-gray-600">No rooms available at the moment.</p>
    </c:if>

    <!-- Dynamic Room Cards -->
    <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
      <c:forEach var="room" items="${rooms}">
        <div class="bg-white rounded-lg shadow-lg overflow-hidden">
          <img src="${pageContext.request.contextPath}/assets/rooms/${room.roomId}.jpg" alt="Room Image"
               class="w-full h-64 object-cover">
          <div class="p-6">
            <h3 class="text-2xl font-semibold mb-2">${room.roomType}</h3>
            <p class="text-gray-600 mb-4">Room Number: ${room.roomNumber}</p>
            <div class="flex justify-between items-center mb-4">
              <span class="text-2xl font-bold">$${room.pricePerNight}/night</span>
              <a href="${pageContext.request.contextPath}/booking?roomId=${room.roomId}"
			     class="bg-gray-900 text-white px-4 py-2 rounded hover:bg-gray-800 book-now-btn"
			     data-status="${room.status}">
			     Book Now
			  </a>
            </div>
            <div class="flex flex-wrap gap-2">
              <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">${room.roomType}</span>
              <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">${room.status}</span>
              <span class="px-3 py-1 bg-gray-100 rounded-full text-sm">ID: ${room.roomId}</span>
            </div>
          </div>
        </div>
      </c:forEach>
    </div>
  </div>
</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

<script>
  document.addEventListener("DOMContentLoaded", () => {
    const bookButtons = document.querySelectorAll(".book-now-btn");

    bookButtons.forEach(button => {
      button.addEventListener("click", (event) => {
        const status = button.getAttribute("data-status");
        if (status !== "Available") {
          event.preventDefault();
          alert("Booking is not allowed. This room is currently " + status + ".");
        }
      });
    });
  });
</script>

</body>
</html>