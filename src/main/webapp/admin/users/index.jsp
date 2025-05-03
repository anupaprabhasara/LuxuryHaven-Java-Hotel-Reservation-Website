<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Luxury Haven | Manage Users</title>
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
          <h3 class="text-lg font-semibold">All Users</h3>
        </div>
        <div class="overflow-auto flex-1">
          <table class="min-w-full table-auto divide-y divide-gray-700">
            <thead class="bg-gray-700 sticky top-0 z-10">
              <tr>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">ID</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Full Name</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Email</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Phone</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Actions</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
              <c:forEach var="user" items="${users}">
                <tr class="hover:bg-gray-700/30 transition">
                  <td class="px-6 py-4">${user.userId}</td>
                  <td class="px-6 py-4">${user.fullName}</td>
                  <td class="px-6 py-4">${user.email}</td>
                  <td class="px-6 py-4">${user.phone}</td>
                  <td class="px-6 py-4 space-x-2">
                    <a href="${pageContext.request.contextPath}/admin/user?action=delete&id=${user.userId}" onclick="return confirm('Are you sure you want to delete this user?');" class="text-red-400 hover:text-red-500"><i class="fas fa-trash-alt"></i> Delete</a>
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