document.addEventListener("DOMContentLoaded", function () {
  const togglePassword = document.getElementById("toggle-password");
  const passwordInput = document.getElementById("password");
  const eyeIcon = document.getElementById("eye-icon");

  if (togglePassword && passwordInput && eyeIcon) {
    togglePassword.addEventListener("click", () => {
      const type = passwordInput.getAttribute("type");
      if (type === "password") {
        passwordInput.setAttribute("type", "text");
        eyeIcon.classList.remove("bi-eye-slash");
        eyeIcon.classList.add("bi-eye");
      } else {
        passwordInput.setAttribute("type", "password");
        eyeIcon.classList.remove("bi-eye");
        eyeIcon.classList.add("bi-eye-slash");
      }
    });
  }
});
