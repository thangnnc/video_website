var menuIcon = document.querySelector(".menu-icon");
		var sidebar = document.querySelector(".sidebar123");
		var container = document.querySelector(".container123");

		menuIcon.onclick = function() {
			sidebar.classList.toggle("small-sidebar123");
			container.classList.toggle("large-container123")
		}