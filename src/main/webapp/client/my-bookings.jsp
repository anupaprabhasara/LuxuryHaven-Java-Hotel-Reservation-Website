<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Bookings | Luxury Haven</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-100 font-sans">

<!-- Header -->
<c:choose>
    <c:when test="${isLoggedIn}">
        <jsp:include page="./partials/sessionheader.jsp" />
    </c:when>
    <c:otherwise>
        <jsp:include page="./partials/header.jsp" />
    </c:otherwise>
</c:choose>

<!-- Dashboard Layout -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 flex">

    <!-- Sidebar -->
    <%@ include file="./partials/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="flex-1 bg-white min-h-screen rounded-lg shadow-md p-8">
        <h1 class="text-3xl font-bold text-gray-800 mb-6">My Bookings</h1>

        <c:if test="${empty reservations}">
            <p class="text-gray-600">You have no bookings at the moment.</p>
        </c:if>

        <c:if test="${not empty reservations}">
            <div class="overflow-x-auto">
                <table class="min-w-full border border-gray-200 rounded-lg overflow-hidden text-sm">
                    <thead class="bg-gray-100 text-gray-700 uppercase text-xs tracking-wider">
                        <tr>
                            <th class="px-4 py-3 text-left">ID</th>
                            <th class="px-4 py-3 text-left">Room</th>
                            <th class="px-4 py-3 text-left">Type</th>
                            <th class="px-4 py-3 text-left">Check-In</th>
                            <th class="px-4 py-3 text-left">Check-Out</th>
                            <th class="px-4 py-3 text-left">Status</th>
                            <th class="px-4 py-3 text-left">Actions</th>
                        </tr>
                    </thead>
                    <tbody class="bg-white divide-y divide-gray-200">
                        <c:forEach var="reservation" items="${reservations}">
                            <tr class="hover:bg-gray-50 transition">
                                <td class="px-4 py-3">${reservation.reservationId}</td>
                                <td class="px-4 py-3">${reservation.roomNumber}</td>
                                <td class="px-4 py-3">${reservation.roomType}</td>
                                <td class="px-4 py-3">${reservation.checkInDate}</td>
                                <td class="px-4 py-3">${reservation.checkOutDate}</td>
                                <td class="px-4 py-3">
                                    <span class="inline-block px-2 py-1 rounded-full text-xs font-medium 
                                        <c:choose>
                                            <c:when test="${reservation.status == 'Confirmed'}">bg-green-100 text-green-700</c:when>
                                            <c:when test="${reservation.status == 'Cancelled'}">bg-red-100 text-red-700</c:when>
                                            <c:otherwise>bg-yellow-100 text-yellow-700</c:otherwise>
                                        </c:choose>">
                                        ${reservation.status}
                                    </span>
                                </td>
                                <c:choose>
								    <c:when test="${reservation.status eq 'Confirmed' and reservation.checkOutDate le today}">
								        <td class="px-4 py-3">
								            <a href="${pageContext.request.contextPath}/feedback?reservationId=${reservation.reservationId}" 
								               class="inline-flex items-center text-yellow-600 hover:text-yellow-700 font-medium text-sm transition">
								                <i class="fas fa-comment mr-1"></i> Give Feedback
								            </a>
								        </td>
								    </c:when>
								    <c:otherwise>
								        <td class="px-4 py-3">No Actions</td>
								    </c:otherwise>
								</c:choose>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </c:if>
    </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>
</body>
</html>