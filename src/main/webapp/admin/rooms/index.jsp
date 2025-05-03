<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Luxury Haven | Manage Rooms</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

    <!-- Sidebar -->
    <%@ include file="../partials/sidebar.jsp" %>

    <!-- Main Content -->
    <div class="flex-1 md:ml-60 flex flex-col min-h-screen">

        <!-- Topbar -->
        <%@ include file="../partials/header.jsp" %>

        <!-- Table Container -->
        <main class="flex-1 p-6 overflow-hidden">
            <div class="bg-gray-800 rounded-lg shadow-lg h-full overflow-hidden flex flex-col">
                <div class="flex justify-between items-center px-6 py-4 border-b border-gray-700">
                    <h3 class="text-lg font-semibold">All Rooms</h3>
                    <a href="${pageContext.request.contextPath}/admin/room?action=create"
                       class="inline-flex items-center px-4 py-2 bg-yellow-500 hover:bg-yellow-600 text-gray-900 text-sm font-semibold rounded-lg shadow transition">
                        <i class="fas fa-plus mr-2"></i> Add Room
                    </a>
                </div>
                <div class="overflow-auto flex-1">
                    <table class="min-w-full table-auto divide-y divide-gray-700">
                        <thead class="bg-gray-700 sticky top-0 z-10">
                            <tr>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Room No.</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Type</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Price</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Status</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Image</th>
                                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="divide-y divide-gray-700">
                            <c:forEach var="room" items="${rooms}">
                                <tr class="hover:bg-gray-700/30 transition">
                                    <td class="px-6 py-4">${room.roomId}</td>
                                    <td class="px-6 py-4">${room.roomNumber}</td>
                                    <td class="px-6 py-4">${room.roomType}</td>
                                    <td class="px-6 py-4">Rs. ${room.pricePerNight}</td>
                                    <td class="px-6 py-4">${room.status}</td>
                                    <td class="px-6 py-4">
                                        <img src="${pageContext.request.contextPath}/assets/rooms/${room.roomId}.jpg"
                                             alt="Room Image"
                                             class="w-32 h-24 object-cover rounded-md border border-gray-300 dark:border-gray-600">
                                    </td>
                                    <td class="px-6 py-4 space-x-2">
                                        <a href="${pageContext.request.contextPath}/admin/room?action=edit&id=${room.roomId}" class="text-blue-400 hover:text-blue-500"><i class="fas fa-edit"></i></a>
                                        <a href="${pageContext.request.contextPath}/admin/room?action=delete&id=${room.roomId}" onclick="return confirm('Are you sure you want to delete this room?');" class="text-red-400 hover:text-red-500"><i class="fas fa-trash-alt"></i></a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </div>
</body>
</html>