<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Luxury Haven | Manage Reservations</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-900 text-gray-100 min-h-screen flex">

  <%@ include file="../partials/sidebar.jsp" %>

  <div class="flex-1 md:ml-60 flex flex-col min-h-screen">
    <%@ include file="../partials/header.jsp" %>

    <main class="flex-1 p-6 overflow-hidden">
      <div class="bg-gray-800 rounded-lg shadow-lg h-full overflow-hidden flex flex-col">
        <div class="flex justify-between items-center px-6 py-4 border-b border-gray-700">
          <h3 class="text-lg font-semibold">All Reservations</h3>
        </div>
        <div class="overflow-auto flex-1">
          <table class="min-w-full table-auto divide-y divide-gray-700">
            <thead class="bg-gray-700 sticky top-0 z-10">
              <tr>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">ID</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Guest Name</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Room</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Type</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Check-In</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Check-Out</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Status</th>
                <th class="px-6 py-3 text-left text-sm font-semibold uppercase tracking-wider">Action</th>
              </tr>
            </thead>
            <tbody class="divide-y divide-gray-700">
              <c:forEach var="reservation" items="${reservations}">
                <tr class="hover:bg-gray-700/30 transition">
                  <td class="px-6 py-4">${reservation.reservationId}</td>
                  <td class="px-6 py-4">${reservation.guestName}</td>
                  <td class="px-6 py-4">${reservation.roomNumber}</td>
                  <td class="px-6 py-4">${reservation.roomType}</td>
                  <td class="px-6 py-4">${reservation.checkInDate}</td>
                  <td class="px-6 py-4">${reservation.checkOutDate}</td>
                  <td class="px-6 py-4">${reservation.status}</td>
                  <td class="px-6 py-4">
                    <form method="post" action="${pageContext.request.contextPath}/admin/reservation">
                      <input type="hidden" name="action" value="update"/>
                      <input type="hidden" name="id" value="${reservation.reservationId}"/>
                      <select name="status" class="bg-gray-700 border border-gray-600 rounded px-2 py-1 text-sm">
                        <option value="Pending" ${reservation.status == 'Pending' ? 'selected' : ''}>Pending</option>
                        <option value="Confirmed" ${reservation.status == 'Confirmed' ? 'selected' : ''}>Confirmed</option>
                        <option value="Cancelled" ${reservation.status == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                      </select>
                      <button type="submit" class="ml-2 px-3 py-1 bg-yellow-500 text-gray-900 text-sm rounded font-semibold hover:bg-yellow-600">Update</button>
                    </form>
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