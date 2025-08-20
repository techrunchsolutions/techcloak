 
      // Carousel functionality
      let currentSlide = 1;
      const totalSlides = 3;
      let autoSlideInterval;

      function showSlide(slideNumber) {
        // Hide all images
        for (let i = 1; i <= totalSlides; i++) {
          const img = document.getElementById(`carousel-img-${i}`);
          const indicator = document.getElementById(`indicator-${i}`);
          if (img) img.classList.remove("active");
          if (indicator) indicator.className = "carousel-indicator";
        }

        // Show current image
        const currentImg = document.getElementById(`carousel-img-${slideNumber}`);
        const currentIndicator = document.getElementById(`indicator-${slideNumber}`);
        if (currentImg) currentImg.classList.add("active");
        if (currentIndicator) currentIndicator.className = "carousel-indicator-active";

        // Update navigation buttons
        const prevBtn = document.getElementById("carousel-prev");
        const nextBtn = document.getElementById("carousel-next");
        if (prevBtn) prevBtn.style.display = slideNumber === 1 ? "none" : "block";
        if (nextBtn) nextBtn.style.display = slideNumber === totalSlides ? "none" : "block";
      }

      function nextSlide() {
        if (currentSlide < totalSlides) {
          currentSlide++;
          showSlide(currentSlide);
        }
      }

      function prevSlide() {
        if (currentSlide > 1) {
          currentSlide--;
          showSlide(currentSlide);
        }
      }

      function startAutoSlide() {
        autoSlideInterval = setInterval(() => {
          if (currentSlide < totalSlides) {
            nextSlide();
          } else {
            currentSlide = 1;
            showSlide(currentSlide);
          }
        }, 5000);
      }

      function stopAutoSlide() {
        clearInterval(autoSlideInterval);
      }

      // Event listeners for carousel
      const nextBtn = document.getElementById("carousel-next");
      const prevBtn = document.getElementById("carousel-prev");

      if (nextBtn) {
        nextBtn.addEventListener("click", () => {
          stopAutoSlide();
          nextSlide();
          startAutoSlide();
        });
      }

      if (prevBtn) {
        prevBtn.addEventListener("click", () => {
          stopAutoSlide();
          prevSlide();
          startAutoSlide();
        });
      }

      // Start auto-slide
      startAutoSlide();

      // Password toggle functionality
      const passwordToggle = document.getElementById("password-toggle");
      if (passwordToggle) {
        passwordToggle.addEventListener("click", () => {
          const passwordInput = document.getElementById("password");
          const toggle = document.getElementById("password-toggle");

          if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggle.classList.remove("bi-eye");
            toggle.classList.add("bi-eye-slash");
          } else {
            passwordInput.type = "password";
            toggle.classList.remove("bi-eye-slash");
            toggle.classList.add("bi-eye");
          }
        });
      }
