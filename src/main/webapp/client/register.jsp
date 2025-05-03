<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Register | Luxury Haven</title>
  <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-100 text-gray-900 font-sans">

  <!-- Header -->
  <%@ include file="./partials/header.jsp" %>

  <!-- Registration Section -->
  <main>
    <!-- Hero -->
    <section class="relative py-20 bg-gray-900">
      <div class="container mx-auto px-6">
        <div class="text-center text-white">
          <h1 class="text-4xl font-bold mb-4">Join Luxury Haven</h1>
          <p class="text-xl max-w-2xl mx-auto">Create your account and unlock a premium booking experience</p>
        </div>
      </div>
    </section>

    <!-- Form -->
    <section class="bg-gray-100 py-16">
      <div class="max-w-xl mx-auto bg-white p-10 rounded-lg shadow-lg">
        <div class="text-center mb-6">
          <h2 class="text-2xl font-bold text-gray-800">Create an Account</h2>
          <p class="text-sm text-gray-600">Start booking your perfect stay today</p>
        </div>

        <!-- Error Message -->
        <c:if test="${not empty error}">
          <div class="mb-4 p-4 text-sm text-red-700 bg-red-100 border border-red-400 rounded-lg">
            <i class="fas fa-exclamation-circle mr-2"></i> ${error}
          </div>
        </c:if>

        <!-- Success Message -->
        <c:if test="${not empty success}">
          <div class="mb-4 p-4 text-sm text-green-700 bg-green-100 border border-green-400 rounded-lg">
            <i class="fas fa-check-circle mr-2"></i> ${success}
          </div>
        </c:if>

        <form action="register" method="POST" class="space-y-6" autocomplete="off">
          <div>
            <label for="full_name" class="block text-sm font-medium text-gray-700 mb-1">Full Name</label>
            <input type="text" id="full_name" name="full_name" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                   placeholder="John Doe">
          </div>

          <div>
            <label for="email" class="block text-sm font-medium text-gray-700 mb-1">Email</label>
            <input type="email" id="email" name="email" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                   placeholder="you@example.com">
          </div>

          <div>
            <label for="phone" class="block text-sm font-medium text-gray-700 mb-1">Phone</label>
            <input type="number" id="phone" name="phone" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                   placeholder="07XXXXXXXX">
          </div>

          <div>
            <label for="address" class="block text-sm font-medium text-gray-700 mb-1">Address</label>
            <input type="text" id="address" name="address" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                   placeholder="123 Main Street, Colombo">
          </div>

          <div>
            <label for="password" class="block text-sm font-medium text-gray-700 mb-1">Password</label>
            <input type="password" id="password" name="password" required
                   class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-gray-500 text-gray-900"
                   placeholder="••••••••">
            <div class="mt-2 text-sm space-y-1">
              <p id="lengthHint" class="text-red-600">• At least 8 characters</p>
              <p id="uppercaseHint" class="text-red-600">• At least one uppercase letter</p>
              <p id="lowercaseHint" class="text-red-600">• At least one lowercase letter</p>
              <p id="digitHint" class="text-red-600">• At least one digit</p>
            </div>
          </div>

          <button id="submitBtn" type="submit" disabled
                  class="w-full py-2 px-4 bg-yellow-500 text-gray-900 font-semibold rounded-lg transition opacity-50 cursor-not-allowed">
            <i class="fas fa-user-plus mr-2"></i> Register
          </button>
        </form>
      </div>
    </section>
  </main>

  <!-- Footer -->
  <%@ include file="./partials/footer.jsp" %>

  <!-- Password Validation Script -->
  <script>
    const passwordInput = document.getElementById("password");
    const lengthHint = document.getElementById("lengthHint");
    const uppercaseHint = document.getElementById("uppercaseHint");
    const lowercaseHint = document.getElementById("lowercaseHint");
    const digitHint = document.getElementById("digitHint");
    const submitBtn = document.getElementById("submitBtn");

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
  </script>
</body>
</html>