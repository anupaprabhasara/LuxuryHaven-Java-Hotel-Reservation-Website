<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Luxury Haven | Edit Room</title>
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

    <!-- Form Content -->
    <main class="flex-1 p-6 overflow-y-auto">
      <div class="mx-auto bg-gray-800 rounded-lg shadow-lg p-8 space-y-6">

        <div class="flex justify-between items-center">
          <h3 class="text-lg font-semibold">Edit Room</h3>
          <a href="${pageContext.request.contextPath}/admin/room" class="text-sm text-yellow-400 hover:underline">
            ← Back to Room List
          </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/room?action=update"
              method="POST"
              enctype="multipart/form-data"
              class="grid md:grid-cols-2 gap-6">

          <input type="hidden" name="id" value="${room.roomId}" />

          <!-- Room Number -->
          <div>
            <label class="block text-sm mb-1" for="room_number">Room Number</label>
            <input type="text" id="room_number" name="room_number" required
                   value="${room.roomNumber}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
          </div>

          <!-- Room Type -->
          <div>
            <label class="block text-sm mb-1" for="room_type">Room Type</label>
            <input type="text" id="room_type" name="room_type" required
                   value="${room.roomType}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
          </div>

          <!-- Price Per Night -->
          <div>
            <label class="block text-sm mb-1" for="price_per_night">Price Per Night</label>
            <input type="number" step="0.01" id="price_per_night" name="price_per_night" required
                   value="${room.pricePerNight}"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
          </div>

          <!-- Status -->
          <div>
            <label class="block text-sm mb-1" for="status">Status</label>
            <select id="status" name="status"
                    class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500">
              <option value="Available" ${room.status == 'Available' ? 'selected' : ''}>Available</option>
              <option value="Reserved" ${room.status == 'Reserved' ? 'selected' : ''}>Reserved</option>
              <option value="Maintenance" ${room.status == 'Maintenance' ? 'selected' : ''}>Maintenance</option>
            </select>
          </div>

          <!-- Room Image -->
          <div class="md:col-span-2">
            <label class="block text-sm mb-1" for="room_image">Room Image</label>
            <input type="file" id="room_image" name="room_image" accept="image/*"
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm text-gray-300 file:mr-4 file:py-2 file:px-4 file:rounded-lg file:border-0 file:text-sm file:font-semibold file:bg-yellow-500 file:text-gray-900 hover:file:bg-yellow-600" />
            <div class="mt-4">
              <img src="${pageContext.request.contextPath}/assets/rooms/${room.roomId}.jpg"
                   alt="Room Image"
                   class="w-40 h-28 object-cover rounded-md border border-gray-500">
            </div>
          </div>

          <!-- Submit -->
          <div class="md:col-span-2">
            <button type="submit"
                    class="w-full py-2 px-4 bg-yellow-500 text-gray-900 font-semibold rounded-lg hover:bg-yellow-600 transition">
              <i class="fas fa-save mr-2"></i> Update Room
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>

</body>
</html>