<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en" class="dark">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Luxury Haven | Add Admin</title>
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
          <h3 class="text-lg font-semibold">Create New Admin</h3>
          <a href="${pageContext.request.contextPath}/admin/admin" class="text-sm text-yellow-400 hover:underline">
            ← Back to Admin List
          </a>
        </div>

        <form action="${pageContext.request.contextPath}/admin/admin?action=create" method="POST" class="grid md:grid-cols-2 gap-6">
          <!-- Full Name -->
          <div>
            <label class="block text-sm mb-1" for="full_name">Full Name</label>
            <input type="text" id="full_name" name="full_name" required
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
          </div>

          <!-- Email -->
          <div>
            <label class="block text-sm mb-1" for="email">Email</label>
            <input type="email" id="email" name="email" required
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
          </div>

          <!-- Password -->
          <div class="md:col-span-2">
            <label class="block text-sm mb-1" for="password">Password</label>
            <input type="password" id="password" name="password" required
                   class="w-full px-4 py-2 bg-gray-700 border border-gray-600 rounded-lg text-sm focus:outline-none focus:ring-2 focus:ring-yellow-500" />
            <div class="mt-2 text-sm space-y-1 text-red-500">
              <p id="lengthHint">• At least 8 characters</p>
              <p id="uppercaseHint">• At least one uppercase letter</p>
              <p id="lowercaseHint">• At least one lowercase letter</p>
              <p id="digitHint">• At least one digit</p>
            </div>
          </div>

          <!-- Submit -->
          <div class="md:col-span-2">
            <button id="submitBtn" type="submit" disabled
                    class="w-full py-2 px-4 bg-yellow-500 text-gray-900 font-semibold rounded-lg transition opacity-50 cursor-not-allowed">
              <i class="fas fa-save mr-2"></i> Save Admin
            </button>
          </div>
        </form>
      </div>
    </main>
  </div>

  <!-- Live Password JS -->
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