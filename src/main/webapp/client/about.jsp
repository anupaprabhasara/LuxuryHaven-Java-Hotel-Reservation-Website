<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - Luxury Haven Hotel</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
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

    <main>
        <!-- Hero Section -->
        <section class="relative py-20 bg-gray-900">
            <div class="container mx-auto px-6">
                <div class="text-center text-white">
                    <h1 class="text-4xl font-bold mb-4">Our Story</h1>
                    <p class="text-xl max-w-2xl mx-auto">Discover the legacy of luxury and excellence that defines Luxury Haven</p>
                </div>
            </div>
        </section>

        <!-- History Section -->
        <section class="py-16">
            <div class="container mx-auto px-6">
                <div class="grid grid-cols-1 md:grid-cols-2 gap-12 items-center">
                    <div>
                        <img src="https://images.pexels.com/photos/261102/pexels-photo-261102.jpeg" alt="Hotel History" class="rounded-lg shadow-lg">
                    </div>
                    <div>
                        <h2 class="text-3xl font-bold mb-6">A Legacy of Excellence</h2>
                        <p class="text-gray-600 mb-4">Founded in 1995, Luxury Haven has been setting the standard for luxury hospitality for over two decades. Our commitment to exceptional service and attention to detail has earned us numerous accolades and the loyalty of guests from around the world.</p>
                        <p class="text-gray-600">Today, we continue to innovate and elevate the guest experience, combining timeless elegance with modern luxury.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Values Section -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Our Core Values</h2>
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

                    <!-- Excellence -->
                    <div class="text-center p-6">
                        <div class="text-4xl mb-4 text-yellow-500">
                            <i class="fas fa-gem"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Excellence</h3>
                        <p class="text-gray-600">We strive for perfection in every detail of our service</p>
                    </div>

                    <!-- Hospitality -->
                    <div class="text-center p-6">
                        <div class="text-4xl mb-4 text-green-500">
                            <i class="fas fa-handshake"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Hospitality</h3>
                        <p class="text-gray-600">Creating memorable experiences for our guests</p>
                    </div>

                    <!-- Sustainability -->
                    <div class="text-center p-6">
                        <div class="text-4xl mb-4 text-blue-500">
                            <i class="fas fa-recycle"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Sustainability</h3>
                        <p class="text-gray-600">Committed to environmental responsibility</p>
                    </div>

                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>