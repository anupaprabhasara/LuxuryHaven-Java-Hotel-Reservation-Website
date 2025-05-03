<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Feedback | Luxury Haven</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
</head>
<body class="bg-gray-100 text-gray-900 font-sans">

<!-- Header -->
<%@ include file="./partials/sessionheader.jsp" %>

<!-- Layout -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-10 flex">

    <!-- Sidebar -->
    <%@ include file="./partials/sidebar.jsp" %>

    <!-- Main Content -->
    <main class="flex-1 bg-white min-h-screen rounded-lg shadow-md p-8">
        <h1 class="text-3xl font-bold mb-6 text-gray-800">Submit Your Feedback</h1>

        <c:if test="${not empty success}">
		    <div class="mb-6 p-4 bg-green-100 border border-green-300 text-green-800 rounded">
		        <i class="fas fa-check-circle mr-2"></i> ${success} Redirecting to your bookings...
		    </div>
		    <script>
		        setTimeout(() => {
		            window.location.href = "<c:url value='/my-bookings' />";
		        }, 1500);
		    </script>
		</c:if>

        <c:if test="${not empty error}">
            <div class="mb-6 p-4 bg-red-100 border border-red-300 text-red-800 rounded">
                <i class="fas fa-exclamation-circle mr-2"></i> ${error}
            </div>
        </c:if>

        <form method="POST" action="feedback" class="space-y-6">
            <input type="hidden" name="reservationId" value="${reservationId}" />
            <input type="hidden" name="rating" id="ratingInput" />

            <!-- Star Rating -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Rating</label>
                <div id="starContainer" class="flex gap-2 text-2xl text-yellow-400 cursor-pointer">
                    <i class="far fa-star" data-value="1"></i>
                    <i class="far fa-star" data-value="2"></i>
                    <i class="far fa-star" data-value="3"></i>
                    <i class="far fa-star" data-value="4"></i>
                    <i class="far fa-star" data-value="5"></i>
                </div>
            </div>

            <!-- Comment -->
            <div>
                <label for="comment" class="block text-sm font-medium text-gray-700 mb-1">Your Feedback</label>
                <textarea id="comment" name="comment" rows="5" required
                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-yellow-500 text-gray-900"
                          placeholder="Tell us about your experience..."></textarea>
            </div>

            <!-- Submit -->
            <div>
                <button type="submit"
                        class="inline-flex items-center gap-2 px-6 py-2 bg-yellow-500 text-white rounded-lg font-medium hover:bg-yellow-600 transition">
                    <i class="fas fa-paper-plane"></i> Submit Feedback
                </button>
            </div>
        </form>
    </main>
</div>

<!-- Footer -->
<%@ include file="./partials/footer.jsp" %>

<!-- Star Rating Script -->
<script>
    const stars = document.querySelectorAll('#starContainer i');
    const ratingInput = document.getElementById('ratingInput');

    stars.forEach((star, index) => {
        star.addEventListener('click', () => {
            const value = index + 1;
            ratingInput.value = value;

            stars.forEach((s, i) => {
                s.classList.toggle('fas', i < value);
                s.classList.toggle('far', i >= value);
            });
        });
    });
</script>
</body>
</html>