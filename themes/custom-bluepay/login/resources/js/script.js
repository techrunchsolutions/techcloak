document.addEventListener("DOMContentLoaded", function () {
  // Form elements
  const registerForm = document.getElementById("kc-register-form");
  const passwordInput = document.getElementById("password");
  const confirmPasswordInput = document.getElementById("password-confirm");
  const registerButton = document.getElementById("registerButton");
  const passwordRequirements = document.querySelector(".password-requirements");
  const passwordError = document.querySelector(".password-error");
  const togglePasswordButtons = document.querySelectorAll(".password-toggle");

  // Requirement rules
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
  togglePasswordButtons.forEach((btn) => {
    btn.addEventListener("click", function () {
      const input = this.previousElementSibling;
      const icon = this.querySelector("i");
      if (input.type === "password") {
        input.type = "text";
        icon.classList.remove("fa-eye");
        icon.classList.add("fa-eye-slash");
      } else {
        input.type = "password";
        icon.classList.remove("fa-eye-slash");
        icon.classList.add("fa-eye");
      }
    });
  });

  // Show password requirements when user starts typing
  passwordInput.addEventListener("input", function () {
    if (this.value.length > 0) {
      passwordRequirements.classList.add("visible");
    } else {
      passwordRequirements.classList.remove("visible");
    }
    validatePassword();
  });

  // Password validation
  function validatePassword() {
    const password = passwordInput.value;
    const confirmPassword = confirmPasswordInput.value;
    let validCount = 0;

    // Check password requirements
    Object.entries(requirements).forEach(([key, requirement]) => {
      const isValid = requirement.regex.test(password);
      requirement.element.classList.toggle("valid", isValid);
      requirement.element.classList.toggle("invalid", !isValid);
      requirement.element.querySelector("img").src = isValid
        ? `${window.resourcesPath}/img/icon-valid.svg`
        : `${window.resourcesPath}/img/icon-invalid.svg`;
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
    registerButton.disabled = !allRequirementsMet;
    registerButton.classList.toggle("active", allRequirementsMet);
  }

  // Add validation on confirm password input
  confirmPasswordInput.addEventListener("input", validatePassword);

   // Email validation
  emailInput.addEventListener("input", function () {
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (this.value.trim() !== "" && !emailPattern.test(this.value)) {
      emailError.classList.remove("d-none");
    } else {
      emailError.classList.add("d-none");
    }
  });

  // Phone number validation (10 digits only)
  phoneInput.addEventListener("input", function () {
    let phone = this.value.replace(/\D/g, ""); // remove non-digits
    if (phone.length > 10) {
      phone = phone.slice(0, 10);
      this.value = phone;
    }

    if (phone.length !== 10) {
      phoneError.classList.remove("d-none");
    } else {
      phoneError.classList.add("d-none");
    }
  });


  // Form submission
  if (registerForm) {
    registerForm.addEventListener("submit", function (e) {
      if (registerButton.disabled) {
        e.preventDefault();
        return;
      }
      registerButton.innerHTML =
        '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Creating account...';
      registerButton.disabled = true;
    });
  }
});
