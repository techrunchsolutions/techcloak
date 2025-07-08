document.addEventListener("DOMContentLoaded", function () {
  // Keycloak form elements
  const kcForm = document.getElementById("kc-passwd-update-form");
  const kcNewPassword = document.getElementById("password-new");
  const kcConfirmPassword = document.getElementById("password-confirm");

  // Visible form elements
  const form = document.getElementById("resetPasswordForm");
  const newPasswordInput = document.getElementById("newPassword");
  const confirmPasswordInput = document.getElementById("confirmPassword");
  const changePasswordBtn = document.getElementById("changePasswordBtn");
  const passwordRequirements = document.querySelector(".password-requirements");
  const passwordError = document.querySelector(".password-error");

  const requirements = {
    length: {
      regex: /.{8,}/,
      element: document.querySelector('[data-requirement="length"]'),
    },
    uppercase: {
      regex: /[A-Z]/,
      element: document.querySelector('[data-requirement="uppercase"]'),
    },
    lowercase: {
      regex: /[a-z]/,
      element: document.querySelector('[data-requirement="lowercase"]'),
    },
    digit: {
      regex: /[0-9]/,
      element: document.querySelector('[data-requirement="digit"]'),
    },
    special: {
      regex: /[~!@#$]/,
      element: document.querySelector('[data-requirement="special"]'),
    },
  };

  // Password visibility toggle
  document.querySelectorAll(".password-toggle").forEach((toggle) => {
    toggle.addEventListener("click", () => {
      const targetId = toggle.getAttribute("data-target");
      const input = document.getElementById(targetId);

      if (input.type === "password") {
        input.type = "text";
        toggle.classList.remove("bi-eye-slash");
        toggle.classList.add("bi-eye");
      } else {
        input.type = "password";
        toggle.classList.remove("bi-eye");
        toggle.classList.add("bi-eye-slash");
      }
    });
  });

  // Show password requirements when user starts typing
  newPasswordInput.addEventListener("input", function () {
    if (this.value.length > 0) {
      passwordRequirements.classList.add("visible");
    } else {
      passwordRequirements.classList.remove("visible");
    }
    validatePassword();
  });

  // Password validation
  function validatePassword() {
    const password = newPasswordInput.value;
    const confirmPassword = confirmPasswordInput.value;
    let validCount = 0;

    // Check password requirements
    Object.entries(requirements).forEach(([key, requirement]) => {
      const isValid = requirement.regex.test(password);
      requirement.element.classList.toggle("valid", isValid);
      requirement.element.classList.toggle("invalid", !isValid);
      requirement.element.querySelector("img").src = isValid
        ? "${url.resourcesPath}/img/icon-valid.svg"
        : "${url.resourcesPath}/img/icon-invalid.svg";
      if (isValid) validCount++;
    });

    // Check if passwords match
    const passwordsMatch =
      password === confirmPassword && confirmPassword !== "";

    // Show/hide error message
    if (confirmPassword && !passwordsMatch) {
      passwordError.classList.add("visible");
    } else {
      passwordError.classList.remove("visible");
    }

    // Update button state
    const allRequirementsMet = validCount === 5 && passwordsMatch;
    changePasswordBtn.disabled = !allRequirementsMet;
    changePasswordBtn.classList.toggle("active", allRequirementsMet);
  }

  // Add validation on confirm password input
  confirmPasswordInput.addEventListener("input", validatePassword);

  // Form submission
  changePasswordBtn.addEventListener("click", function (e) {
    e.preventDefault();

    // Sync values to Keycloak's hidden form
    kcNewPassword.value = newPasswordInput.value;
    kcConfirmPassword.value = confirmPasswordInput.value;

    // Submit Keycloak's form
    kcForm.submit();
  });
});
