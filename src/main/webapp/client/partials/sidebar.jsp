<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Sidebar -->
<aside class="w-64 bg-white shadow-md p-6 rounded-lg mr-8">
    <div class="text-center">
        <img src="https://ui-avatars.com/api/?name=${userFullName}&background=6b7280&color=fff"
             alt="User Avatar"
             class="w-20 h-20 mx-auto rounded-full mb-2">
        <h2 class="text-xl font-semibold text-gray-800">${userFullName}</h2>
        <p class="text-sm text-gray-500">${sessionScope.userSession.email}</p>
    </div>

    <nav class="mt-6 space-y-2">
        <a href="${pageContext.request.contextPath}/my-bookings"
           class="flex items-center px-4 py-2 text-gray-700 rounded-lg hover:bg-gray-100 transition">
            <i class="fas fa-ticket-alt mr-3 text-gray-500"></i> My Bookings
        </a>
        <a href="${pageContext.request.contextPath}/profile"
           class="flex items-center px-4 py-2 text-gray-700 rounded-lg hover:bg-gray-100 transition">
            <i class="fas fa-user mr-3 text-gray-500"></i> My Profile
        </a>
        <a href="${pageContext.request.contextPath}/settings"
           class="flex items-center px-4 py-2 text-gray-700 rounded-lg hover:bg-gray-100 transition">
            <i class="fas fa-cog mr-3 text-gray-500"></i> Settings
        </a>
    </nav>
</aside>