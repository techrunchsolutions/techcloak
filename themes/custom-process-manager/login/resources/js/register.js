document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".toggle-password");

  toggles.forEach(toggle => {
    const inputId = toggle.getAttribute("data-target");
    const input = document.getElementById(inputId);
    const icon = toggle.querySelector("i");

    if (input) {
      toggle.addEventListener("click", function () {
        const isPassword = input.type === "password";
        input.type = isPassword ? "text" : "password";
        icon.classList.toggle("bi-eye", isPassword);
        icon.classList.toggle("bi-eye-slash", !isPassword);
      });
    }
  });
});
