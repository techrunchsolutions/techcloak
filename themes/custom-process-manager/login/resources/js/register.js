document.addEventListener("DOMContentLoaded", function () {
  const toggleIcons = document.querySelectorAll(".toggle-password");

  toggleIcons.forEach(iconWrapper => {
    const targetId = iconWrapper.getAttribute("data-target");
    const input = document.getElementById(targetId);
    const icon = iconWrapper.querySelector("i");

    iconWrapper.addEventListener("click", () => {
      if (!input) return;

      const isHidden = input.type === "password";
      input.type = isHidden ? "text" : "password";

      // Swap icon
      icon.classList.toggle("bi-eye-slash", !isHidden);
      icon.classList.toggle("bi-eye", isHidden);
    });
  });

  const password = document.getElementById("password");
  const confirmPassword = document.getElementById("password-confirm");
  const errorSpan = document.getElementById("confirm-password-error");
  const form = document.getElementById("kc-register-form");

  function checkPasswordMatch() {
    if (!password || !confirmPassword || !errorSpan) return;

    const pw = password.value;
    const cpw = confirmPassword.value;

    if (pw && cpw && pw !== cpw) {
      errorSpan.style.display = "block";
    } else {
      errorSpan.style.display = "none";
    }
  }

  password.addEventListener("input", checkPasswordMatch);
  confirmPassword.addEventListener("input", checkPasswordMatch);

  form.addEventListener("submit", function (e) {
    if (password.value !== confirmPassword.value) {
      e.preventDefault();
      errorSpan.style.display = "block";
    }
  });
});
