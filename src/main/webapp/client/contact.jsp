<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Luxury Haven Hotel</title>
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
                    <h1 class="text-4xl font-bold mb-4">Get in Touch</h1>
                    <p class="text-xl max-w-2xl mx-auto">We're here to assist you with any inquiries about your stay at Luxury Haven</p>
                </div>
            </div>
        </section>

        <!-- Contact Information -->
        <section class="py-16">
            <div class="container mx-auto px-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">

                    <!-- Location -->
                    <div class="bg-white p-8 rounded-lg shadow-lg text-center">
                        <div class="text-4xl mb-4 text-gray-700">
                            <i class="fas fa-map-marker-alt"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Location</h3>
                        <p class="text-gray-600">
                            123 Luxury Street<br>
                            New York, NY 10001<br>
                            United States
                        </p>
                    </div>

                    <!-- Phone -->
                    <div class="bg-white p-8 rounded-lg shadow-lg text-center">
                        <div class="text-4xl mb-4 text-gray-700">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Phone</h3>
                        <p class="text-gray-600">
                            Reservations: (555) 123-4567<br>
                            Front Desk: (555) 123-4568<br>
                            Concierge: (555) 123-4569
                        </p>
                    </div>

                    <!-- Email -->
                    <div class="bg-white p-8 rounded-lg shadow-lg text-center">
                        <div class="text-4xl mb-4 text-gray-700">
                            <i class="fas fa-envelope"></i>
                        </div>
                        <h3 class="text-xl font-semibold mb-2">Email</h3>
                        <p class="text-gray-600">
                            Reservations: bookings@luxuryhaven.com<br>
                            General: info@luxuryhaven.com<br>
                            Events: events@luxuryhaven.com
                        </p>
                    </div>

                </div>
            </div>
        </section>

        <!-- Business Hours -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Business Hours</h2>
                <div class="max-w-2xl mx-auto bg-white p-8 rounded-lg shadow-lg">
                    <div class="space-y-4">
                        <div class="flex justify-between items-center border-b pb-4">
                            <span class="font-semibold">Front Desk</span>
                            <span class="text-gray-600">24/7</span>
                        </div>
                        <div class="flex justify-between items-center border-b pb-4">
                            <span class="font-semibold">Restaurant</span>
                            <span class="text-gray-600">6:30 AM - 11:00 PM</span>
                        </div>
                        <div class="flex justify-between items-center border-b pb-4">
                            <span class="font-semibold">Spa and Wellness</span>
                            <span class="text-gray-600">9:00 AM - 9:00 PM</span>
                        </div>
                        <div class="flex justify-between items-center border-b pb-4">
                            <span class="font-semibold">Fitness Center</span>
                            <span class="text-gray-600">6:00 AM - 10:00 PM</span>
                        </div>
                        <div class="flex justify-between items-center">
                            <span class="font-semibold">Business Center</span>
                            <span class="text-gray-600">8:00 AM - 8:00 PM</span>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Map Section -->
        <section class="py-16">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Location</h2>
                <div class="bg-white p-8 rounded-lg shadow-lg">
                    <div class="aspect-w-16 aspect-h-9">
                        <img src="https://images.pexels.com/photos/1738434/pexels-photo-1738434.jpeg" alt="Hotel Location" class="w-full h-96 object-cover rounded-lg">
                    </div>
                    <div class="mt-8 text-center">
                        <p class="text-gray-600 mb-4">Located in the heart of New York City, just minutes away from Central Park and major attractions.</p>
                        <p class="text-gray-600">Nearest Subway: 5th Avenue Station (Lines A, B, C, D)</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>