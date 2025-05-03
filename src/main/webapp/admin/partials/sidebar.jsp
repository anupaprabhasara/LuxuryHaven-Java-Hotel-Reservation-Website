<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<aside class="w-60 hidden md:flex flex-col bg-gray-800 border-r border-gray-700 shadow-md fixed h-full">
    <div class="p-6 text-center border-b border-gray-700">
        <h1 class="text-2xl font-bold text-yellow-400">Luxury Haven</h1>
        <p class="text-sm text-gray-400">Admin Panel</p>
    </div>
    <nav id="sidebarNav" class="flex-1 px-4 py-6 space-y-2 overflow-y-auto">
        <a href="${pageContext.request.contextPath}/admin/room" class="flex items-center p-3 rounded hover:bg-yellow-900 transition"><i class="fas fa-bed mr-3"></i> Rooms</a>
        <a href="${pageContext.request.contextPath}/admin/reservation" class="flex items-center p-3 rounded hover:bg-yellow-900 transition"><i class="fas fa-calendar-check mr-3"></i> Reservations</a>
        <a href="${pageContext.request.contextPath}/admin/user" class="flex items-center p-3 rounded hover:bg-yellow-900 transition"><i class="fas fa-users mr-3"></i> Users</a>
        <a href="${pageContext.request.contextPath}/admin/admin" class="flex items-center p-3 rounded hover:bg-yellow-900 transition"><i class="fas fa-users-cog mr-3"></i> Admins</a>
        <a href="${pageContext.request.contextPath}/admin/feedback" class="flex items-center p-3 rounded hover:bg-yellow-900 transition"><i class="fas fa-comment-dots mr-3"></i> Feedbacks</a>
    </nav>
    <div class="p-4 border-t border-gray-700">
        <button onclick="logout()" class="w-full flex items-center justify-center text-red-500 hover:text-red-400 font-semibold transition">
            <i class="fas fa-sign-out-alt mr-2"></i> Logout
        </button>
    </div>
</aside>

<script>
    function logout() {
        window.location.href = "${pageContext.request.contextPath}/admin/logout";
    }

    // Dynamic Sidebar Highlight Based on Title
    window.addEventListener('DOMContentLoaded', () => {
        const fullTitle = document.title;
        const suffix = fullTitle.includes("|") ? fullTitle.split("|")[1].trim() : fullTitle;
        const keyword = suffix.split(" ").pop(); // e.g., "Admins"

        const links = document.querySelectorAll("#sidebarNav a");
        links.forEach(link => {
            const linkText = link.textContent.trim();
            if (linkText.toLowerCase().includes(keyword.toLowerCase())) {
                link.classList.add("bg-yellow-900", "font-semibold");
            } else {
                link.classList.remove("bg-yellow-900", "font-semibold");
            }
        });
    });
</script>