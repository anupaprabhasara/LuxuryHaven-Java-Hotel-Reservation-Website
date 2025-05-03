<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<header class="flex justify-between items-center p-4 bg-gray-800 shadow-sm sticky top-0 z-40">
    <h2 class="text-xl font-bold"><span id="pageTitleText">Loading...</span></h2>
    <div class="flex items-center space-x-4">
        <div class="text-right text-sm">
            <p>${sessionScope.adminName}</p>
            <p class="text-gray-400 text-xs">Admin</p>
        </div>
        <img src="https://ui-avatars.com/api/?name=${sessionScope.adminName}&background=FACC15&color=000" alt="Admin Avatar" class="w-10 h-10 rounded-full shadow-md" />
    </div>
</header>

<script>
  const fullTitle = document.title;
  const separatorIndex = fullTitle.indexOf("|");
  const headerTitle = (separatorIndex !== -1) ? fullTitle.substring(separatorIndex + 1).trim() : fullTitle;
  document.getElementById("pageTitleText").textContent = headerTitle;
</script>