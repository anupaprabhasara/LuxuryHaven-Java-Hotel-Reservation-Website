<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login | Luxury Haven</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-100 text-gray-900 font-sans">

    <!-- Header -->
    <%@ include file="./partials/header.jsp" %>

    <!-- Login Form -->
    <main>
        <!-- Hero Section -->
        <section class="relative py-20 bg-gray-900">
            <div class="container mx-auto px-6">
                <div class="text-center text-white">
                    <h1 class="text-4xl font-bold mb-4">Welcome Back</h1>
                    <p class="text-xl max-w-2xl mx-auto">
                        Log in to manage your bookings, explore exclusive offers, and enjoy your personalized Luxury Haven experience
                    </p>
                </div>
            </div>
        </section>
    
        <!-- Login Form Section -->
        <section class="bg-gray-100 py-16">
            <div class="max-w-md mx-auto bg-white p-10 rounded-lg shadow-lg">
                <div class="text-center mb-6">
                    <h2 class="text-2xl font-bold text-gray-800">Sign In</h2>
                    <p class="text-sm text-gray-600">Access your Luxury Haven account</p>
                </div>

                <!-- Display Error Message -->
                <c:if test="${not empty error}">
                    <div class="mb-4 p-4 text-sm text-red-700 bg-red-100 border border-red-400 rounded-lg">
                        <i class="fas fa-exclamation-circle mr-2"></i> ${error}
                    </div>
                </c:if>

                <form action="login" method="POST" class="space-y-6">
                    <div>
                        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
                        <input type="email" id="email" name="email" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                               placeholder="you@example.com"
                               value="${email != null ? email : ''}">
                    </div>
                    <div>
                        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
                        <input type="password" id="password" name="password" required
                               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                               placeholder="••••••••">
                    </div>
                    <div class="flex justify-between items-center">
                        <a href="#" class="text-sm text-gray-600 hover:text-gray-800">Forgot password?</a>
                    </div>
                    <button type="submit"
                            class="w-full flex items-center justify-center gap-2 px-4 py-2 bg-gray-900 text-white text-sm font-medium rounded-lg hover:bg-gray-800 transition">
                        <i class="fas fa-sign-in-alt"></i> Sign In
                    </button>
                </form>
            </div>
        </section>
    </main> 

    <!-- Footer -->
    <%@ include file="./partials/footer.jsp" %>
</body>
</html>