<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>User Settings | Luxury Haven</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
</head>
<body class="bg-gray-100 font-sans">

<!-- Header -->
<c:choose>
  <c:when test="${isLoggedIn}">
    <jsp:include page="./partials/sessionheader.jsp" />
  </c:when>
  <c:otherwise>
    <jsp:include page="./partials/header.jsp" />
  </c:otherwise>
</c:choose>

<!-- Page Layout -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 flex">

  <!-- Sidebar -->
  <%@ include file="./partials/sidebar.jsp" %>

  <!-- Main Content -->
  <main class="flex-1 bg-white min-h-screen rounded-lg shadow-md p-8">
    <h1 class="text-3xl font-bold text-gray-800 mb-6">Edit Profile</h1>

    <form action="settings" method="POST" class="space-y-6">
      <input type="hidden" name="user_id" value="${user.userId}" />

      <!-- Full Name -->
      <div>
        <label for="full_name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
        <input type="text" id="full_name" name="full_name" required
               value="${user.fullName}"
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
      </div>

      <!-- Email -->
      <div>
        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
        <input type="email" id="email" name="email" required
               value="${user.email}"
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
      </div>

      <!-- Phone -->
      <div>
        <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
        <input type="text" id="phone" name="phone" required
               value="${user.phone}"
               class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
      </div>

      <!-- Address -->
      <div>
        <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
        <textarea id="address" name="address" rows="3" required
                  class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500">${user.address}</textarea>
      </div>

      <!-- Password -->
      <div>
        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
        <div class="relative">
          <input type="password" id="password" name="password" required
                 value="${user.password}"
                 class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500"/>
          <i id="togglePassword" class="fas fa-eye absolute top-1/2 right-3 transform -translate-y-1/2 text-gray-500 cursor-pointer"></i>
        </div>
        <div class="mt-2 text-sm text-red-500 space-y-1">
          <p id="lengthHint">• At least 8 characters</p>
          <p id="uppercaseHint">• At least one uppercase letter</p>
          <p id="lowercaseHint">• At least one lowercase letter</p>
          <p id="digitHint">• At least one digit</p>
        </div>
      </div>

      <!-- Submit -->
      <div>
        <button type="submit" id="submitBtn"
                class="w-full py-2 px-4 bg-yellow-500 text-gray-900 font-semibold rounded-lg transition opacity-50 cursor-not-allowed"
                disabled>
          <i class="fas fa-save mr-2"></i> Save Changes
        </button>
      </div>
    </form>
  </main>
</div>

<!-- Footer -->
<jsp:include page="./partials/footer.jsp" />

<!-- JS Validation -->
<script>
  const passwordInput = document.getElementById("password");
  const lengthHint = document.getElementById("lengthHint");
  const uppercaseHint = document.getElementById("uppercaseHint");
  const lowercaseHint = document.getElementById("lowercaseHint");
  const digitHint = document.getElementById("digitHint");
  const submitBtn = document.getElementById("submitBtn");
  const toggleBtn = document.getElementById("togglePassword");

  function validatePassword() {
    const val = passwordInput.value;
    const hasLength = val.length >= 8;
    const hasUpper = /[A-Z]/.test(val);
    const hasLower = /[a-z]/.test(val);
    const hasDigit = /\d/.test(val);

    lengthHint.classList.toggle("text-green-600", hasLength);
    lengthHint.classList.toggle("text-red-600", !hasLength);
    uppercaseHint.classList.toggle("text-green-600", hasUpper);
    uppercaseHint.classList.toggle("text-red-600", !hasUpper);
    lowercaseHint.classList.toggle("text-green-600", hasLower);
    lowercaseHint.classList.toggle("text-red-600", !hasLower);
    digitHint.classList.toggle("text-green-600", hasDigit);
    digitHint.classList.toggle("text-red-600", !hasDigit);

    const isValid = hasLength && hasUpper && hasLower && hasDigit;
    submitBtn.disabled = !isValid;
    submitBtn.classList.toggle("opacity-50", !isValid);
    submitBtn.classList.toggle("cursor-not-allowed", !isValid);
    submitBtn.classList.toggle("hover:bg-yellow-600", isValid);
  }

  passwordInput.addEventListener("input", validatePassword);
  validatePassword();

  toggleBtn.addEventListener("click", () => {
    const type = passwordInput.getAttribute("type") === "password" ? "text" : "password";
    passwordInput.setAttribute("type", type);
    toggleBtn.classList.toggle("fa-eye");
    toggleBtn.classList.toggle("fa-eye-slash");
  });
</script>
</body>
</html>