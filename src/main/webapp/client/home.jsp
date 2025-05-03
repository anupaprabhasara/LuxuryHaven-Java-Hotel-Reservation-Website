<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Luxury Haven Hotel</title>
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

    <!-- Main Content -->
    <main>
        <!-- Hero Section -->
        <section class="relative h-screen">
            <div class="absolute inset-0">
                <img src="https://images.pexels.com/photos/258154/pexels-photo-258154.jpeg" alt="Hotel Exterior" class="w-full h-full object-cover">
                <div class="absolute inset-0 bg-black opacity-50"></div>
            </div>
            <div class="relative container mx-auto px-6 h-full flex items-center">
                <div class="text-white max-w-2xl">
                    <h1 class="text-5xl font-bold mb-4">Welcome to Luxury Haven</h1>
                    <p class="text-xl mb-8">Experience unparalleled luxury and comfort in the heart of the city.</p>
                    <a href="${pageContext.request.contextPath}/rooms" class="bg-white text-gray-900 px-8 py-3 rounded-lg hover:bg-gray-100">Explore Rooms</a>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6">
                <div class="grid grid-cols-1 md:grid-cols-3 gap-8">
                    <div class="text-center">
                        <div class="text-4xl mb-4 text-yellow-500"><i class="fas fa-hotel"></i></div>
                        <h3 class="text-xl font-semibold mb-2">Luxury Rooms</h3>
                        <p class="text-gray-600">Elegantly designed rooms with modern amenities</p>
                    </div>
                    <div class="text-center">
                        <div class="text-4xl mb-4 text-red-500"><i class="fas fa-utensils"></i></div>
                        <h3 class="text-xl font-semibold mb-2">Fine Dining</h3>
                        <p class="text-gray-600">World-class restaurants and dining experiences</p>
                    </div>
                    <div class="text-center">
                        <div class="text-4xl mb-4 text-purple-500"><i class="fas fa-spa"></i></div>
                        <h3 class="text-xl font-semibold mb-2">Spa and Wellness</h3>
                        <p class="text-gray-600">Rejuvenate your body and mind</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- Special Offers -->
        <section class="py-16">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Special Offers</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                        <img src="https://images.pexels.com/photos/3225531/pexels-photo-3225531.jpeg" alt="Weekend Getaway" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Weekend Getaway</h3>
                            <p class="text-gray-600 mb-4">20% off on weekend stays</p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                        <img src="https://images.pexels.com/photos/1838554/pexels-photo-1838554.jpeg" alt="Spa Package" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Spa Package</h3>
                            <p class="text-gray-600 mb-4">Complimentary spa treatment</p>
                        </div>
                    </div>
                    <div class="bg-white rounded-lg shadow-lg overflow-hidden">
                        <img src="https://images.pexels.com/photos/3184183/pexels-photo-3184183.jpeg" alt="Business Package" class="w-full h-48 object-cover">
                        <div class="p-6">
                            <h3 class="text-xl font-semibold mb-2">Business Package</h3>
                            <p class="text-gray-600 mb-4">Special rates for corporate stays</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="py-16 bg-gray-100">
            <div class="container mx-auto px-6">
                <h2 class="text-3xl font-bold text-center mb-12">Guest Reviews</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
                    <div class="bg-white p-6 rounded-lg shadow-lg">
                        <div class="text-yellow-400 mb-4">★★★★★</div>
                        <p class="text-gray-600 mb-4">"An exceptional experience! The staff went above and beyond to make our stay memorable."</p>
                        <p class="font-semibold">- Sarah Johnson</p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-lg">
                        <div class="text-yellow-400 mb-4">★★★★★</div>
                        <p class="text-gray-600 mb-4">"The rooms are stunning and the service is impeccable. Will definitely return!"</p>
                        <p class="font-semibold">- Michael Chen</p>
                    </div>
                    <div class="bg-white p-6 rounded-lg shadow-lg">
                        <div class="text-yellow-400 mb-4">★★★★★</div>
                        <p class="text-gray-600 mb-4">"Perfect location, luxurious amenities, and outstanding dining options."</p>
                        <p class="font-semibold">- Emma Thompson</p>
                    </div>
                </div>
            </div>
        </section>
    </main>

    <!-- Footer -->
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>