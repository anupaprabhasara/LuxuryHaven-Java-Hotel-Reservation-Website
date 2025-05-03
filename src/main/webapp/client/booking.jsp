<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Book Room | Luxury Haven Hotel</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-100 text-gray-900 font-sans">

<!-- Header -->
<%@ include file="./partials/sessionheader.jsp" %>

<main class="py-16">
  <div class="max-w-lg mx-auto bg-white p-10 rounded-lg shadow-md">
    <h2 class="text-2xl font-bold mb-6 text-center">Book Your Stay</h2>

    <!-- Success Message -->
    <c:if test="${not empty success}">
      <div class="mb-6 p-4 bg-green-100 text-green-800 border border-green-400 rounded-lg">
        <i class="fas fa-check-circle mr-2"></i> ${success}
      </div>
      <script>
        setTimeout(() => {
          window.location.href = '${pageContext.request.contextPath}/rooms';
        }, 1500);
      </script>
    </c:if>

    <!-- Error Message -->
    <c:if test="${not empty error}">
      <div class="mb-6 p-4 bg-red-100 text-red-800 border border-red-400 rounded-lg">
        <i class="fas fa-exclamation-circle mr-2"></i> ${error}
      </div>
    </c:if>

    <form action="${pageContext.request.contextPath}/booking" method="post" class="space-y-6">
      <input type="hidden" name="roomId" value="${param.roomId}" />

      <div>
        <label for="checkInDate" class="block text-sm font-medium mb-1">Check-In Date</label>
        <input type="date" id="checkInDate" name="checkInDate" required
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500">
      </div>

      <div>
        <label for="checkOutDate" class="block text-sm font-medium mb-1">Check-Out Date</label>
        <input type="date" id="checkOutDate" name="checkOutDate" required
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500">
      </div>

      <div id="dateError" class="text-sm text-red-600 font-medium hidden"></div>

      <button id="submitBtn" type="submit"
              class="w-full flex items-center justify-center gap-2 px-4 py-2 bg-gray-900 text-white text-sm font-medium rounded-lg transition cursor-not-allowed opacity-50"
              disabled>
        <i class="fas fa-bed"></i> Confirm Booking
      </button>
    </form>
  </div>
</main>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

<!-- Real-Time Validation Script -->
<script>
  const checkInInput = document.getElementById("checkInDate");
  const checkOutInput = document.getElementById("checkOutDate");
  const errorDiv = document.getElementById("dateError");
  const submitBtn = document.getElementById("submitBtn");

  // Helper to format YYYY-MM-DD
  function getTomorrowDateStr() {
    const tomorrow = new Date();
    tomorrow.setDate(tomorrow.getDate() + 1);
    return tomorrow.toISOString().split("T")[0];
  }

  // Set min for check-in date
  document.addEventListener("DOMContentLoaded", () => {
    const tomorrow = getTomorrowDateStr();
    checkInInput.min = tomorrow;
    checkOutInput.min = tomorrow;
  });

  // Validation Logic
  function validateDates() {
    const checkInDate = new Date(checkInInput.value);
    const checkOutDate = new Date(checkOutInput.value);
    const today = new Date();
    today.setHours(0, 0, 0, 0);
    const minCheckIn = new Date(today);
    minCheckIn.setDate(minCheckIn.getDate() + 1);

    errorDiv.classList.add("hidden");
    submitBtn.disabled = true;
    submitBtn.classList.add("opacity-50", "cursor-not-allowed");
    submitBtn.classList.remove("hover:bg-gray-800");

    if (!checkInInput.value || !checkOutInput.value) {
      return;
    }

    if (checkInDate < minCheckIn) {
      errorDiv.textContent = "Check-in must be at least tomorrow.";
      errorDiv.classList.remove("hidden");
      return;
    }

    if (checkOutDate <= checkInDate) {
      errorDiv.textContent = "Check-out must be after check-in.";
      errorDiv.classList.remove("hidden");
      return;
    }

    // Valid
    errorDiv.classList.add("hidden");
    submitBtn.disabled = false;
    submitBtn.classList.remove("opacity-50", "cursor-not-allowed");
    submitBtn.classList.add("hover:bg-gray-800");
  }

  checkInInput.addEventListener("input", validateDates);
  checkOutInput.addEventListener("input", validateDates);
</script>

</body>
</html>