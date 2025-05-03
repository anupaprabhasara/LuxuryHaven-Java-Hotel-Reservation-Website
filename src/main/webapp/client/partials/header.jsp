<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header class="bg-gray-900 text-white">
  <nav class="bg-gray-900 text-white sticky top-0 z-50 shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
      <div class="flex justify-between items-center h-16">

        <!-- Brand -->
        <a href="${pageContext.request.contextPath}/" class="flex items-center space-x-2 text-2xl font-bold">
          <i class="fas fa-hotel"></i> <span>Luxury Haven</span>
        </a>

        <!-- Navigation Links -->
        <div class="hidden md:flex space-x-6">
          <a href="${pageContext.request.contextPath}/" class="hover:text-gray-300 transition">Home</a>
          <a href="${pageContext.request.contextPath}/rooms" class="hover:text-gray-300 transition">Rooms</a>
          <a href="${pageContext.request.contextPath}/about" class="hover:text-gray-300 transition">About</a>
          <a href="${pageContext.request.contextPath}/contact" class="hover:text-gray-300 transition">Contact</a>
        </div>

        <!-- Auth Buttons -->
        <div class="flex items-center space-x-4">
          <a href="${pageContext.request.contextPath}/login" class="flex items-center gap-2 px-4 py-2 text-sm font-medium text-white bg-gray-700 rounded-lg hover:bg-gray-600 transition">
            <i class="fas fa-sign-in-alt"></i> Login
          </a>
          <a href="${pageContext.request.contextPath}/register" class="flex items-center gap-2 px-4 py-2 text-sm font-medium text-gray-900 bg-white rounded-lg hover:bg-gray-100 transition">
            <i class="fas fa-user-plus"></i> Register
          </a>
        </div>

      </div>
    </div>
  </nav>
</header>