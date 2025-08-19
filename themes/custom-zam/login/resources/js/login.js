// Carousel functionality
let currentSlide = 1;
const totalSlides = 3;
let autoSlideInterval;

function showSlide(slideNumber) {
  // Hide all images
  for (let i = 1; i <= totalSlides; i++) {
    document.getElementById(`carousel-img-${i}`).classList.remove("active");
    document.getElementById(`indicator-${i}`).className = "carousel-indicator";
  }

  // Show current image
  document
    .getElementById(`carousel-img-${slideNumber}`)
    .classList.add("active");
  document.getElementById(`indicator-${slideNumber}`).className =
    "carousel-indicator-active";

  // Update navigation buttons
  document.getElementById("carousel-prev").style.display =
    slideNumber === 1 ? "none" : "block";
  document.getElementById("carousel-next").style.display =
    slideNumber === totalSlides ? "none" : "block";
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
document.getElementById("carousel-next").addEventListener("click", () => {
  stopAutoSlide();
  nextSlide();
  startAutoSlide();
});

document.getElementById("carousel-prev").addEventListener("click", () => {
  stopAutoSlide();
  prevSlide();
  startAutoSlide();
});

// Start auto-slide
startAutoSlide();

// Password toggle functionality
document.getElementById("password-toggle").addEventListener("click", () => {
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
