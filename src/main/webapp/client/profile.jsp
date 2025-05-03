<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard | Luxury Haven</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
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
        <div class="flex flex-col lg:flex-row items-start gap-10">

            <!-- Details -->
            <div class="w-full lg:flex-1">
                <h1 class="text-3xl font-bold text-gray-800 mb-6">
                    Welcome, <c:out value="${user.fullName}" />
                </h1>

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6">

                    <div class="bg-white border border-gray-200 rounded-lg p-5 shadow-sm">
                        <h3 class="text-lg font-semibold text-gray-700 mb-2">
                            <i class="fas fa-user mr-2 text-gray-500"></i> Full Name
                        </h3>
                        <p class="text-gray-800">${user.fullName}</p>
                    </div>

                    <div class="bg-white border border-gray-200 rounded-lg p-5 shadow-sm">
                        <h3 class="text-lg font-semibold text-gray-700 mb-2">
                            <i class="fas fa-envelope mr-2 text-gray-500"></i> Email
                        </h3>
                        <p class="text-gray-800">${user.email}</p>
                    </div>

                    <div class="bg-white border border-gray-200 rounded-lg p-5 shadow-sm">
                        <h3 class="text-lg font-semibold text-gray-700 mb-2">
                            <i class="fas fa-phone mr-2 text-gray-500"></i> Phone
                        </h3>
                        <p class="text-gray-800">${user.phone}</p>
                    </div>

                    <div class="bg-white border border-gray-200 rounded-lg p-5 shadow-sm">
                        <h3 class="text-lg font-semibold text-gray-700 mb-2">
                            <i class="fas fa-map-marker-alt mr-2 text-gray-500"></i> Address
                        </h3>
                        <p class="text-gray-800">${user.address}</p>
                    </div>

                </div>
            </div>
        </div>
    </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>
</body>
</html>