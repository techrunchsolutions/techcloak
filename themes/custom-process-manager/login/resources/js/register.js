document.addEventListener("DOMContentLoaded", function () {
  const toggleIcons = document.querySelectorAll(".toggle-password");

  toggleIcons.forEach(iconWrapper => {
    const targetId = iconWrapper.getAttribute("data-target");
    const input = document.getElementById(targetId);
    const icon = iconWrapper.querySelector("i");

    iconWrapper.addEventListener("click", () => {
      const isPasswordHidden = input.type === "password";
      input.type = isPasswordHidden ? "text" : "password";

      icon.classList.toggle("bi-eye");
      icon.classList.toggle("bi-eye-slash");
    });
  });

  const password = document.getElementById("password");
  const confirmPassword = document.getElementById("password-confirm");
  const form = document.getElementById("kc-register-form");

  // Create error element once and reuse it
  const error = document.createElement("span");
  error.id = "confirm-password-error";
  error.className = "field-error";
  error.setAttribute("aria-live", "polite");
  error.innerText = "Passwords do not match.";

  function checkPasswordMatch() {
    const parent = confirmPassword.parentElement;
    const existingError = document.getElementById("confirm-password-error");

    if (password.value && confirmPassword.value && password.value !== confirmPassword.value) {
      if (!existingError) parent.appendChild(error);
    } else {
      if (existingError) existingError.remove();
    }
  }

  // Live check on typing
  password.addEventListener("input", checkPasswordMatch);
  confirmPassword.addEventListener("input", checkPasswordMatch);

  // Prevent submit if mismatch still exists
  form.addEventListener("submit", function (e) {
    if (password.value !== confirmPassword.value) {
      e.preventDefault();
      checkPasswordMatch();
    }
  });
});
