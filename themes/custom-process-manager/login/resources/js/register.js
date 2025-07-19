document.addEventListener("DOMContentLoaded", function () {
  const password = document.getElementById("password");
  const confirmPassword = document.getElementById("password-confirm");

  // Create toggles
  const toggleVisibility = (fieldId) => {
    const field = document.getElementById(fieldId);
    const wrapper = field.parentElement;
    const toggle = document.createElement("button");

    toggle.type = "button";
    toggle.textContent = "Show";
    toggle.className = "btn btn-sm btn-outline-secondary mt-2";

    toggle.addEventListener("click", () => {
      const isHidden = field.type === "password";
      field.type = isHidden ? "text" : "password";
      toggle.textContent = isHidden ? "Hide" : "Show";
    });

    wrapper.appendChild(toggle);
  };

  toggleVisibility("password");
  toggleVisibility("password-confirm");

  // Validate password match
  const form = document.getElementById("kc-register-form");
  form.addEventListener("submit", function (e) {
    if (password.value !== confirmPassword.value) {
      e.preventDefault();

      // Remove old error if present
      const oldError = document.getElementById("confirm-password-error");
      if (oldError) oldError.remove();

      const error = document.createElement("span");
      error.id = "confirm-password-error";
      error.className = "field-error";
      error.setAttribute("aria-live", "polite");
      error.innerText = "Passwords do not match.";

      confirmPassword.parentElement.appendChild(error);
    }
  });
});
