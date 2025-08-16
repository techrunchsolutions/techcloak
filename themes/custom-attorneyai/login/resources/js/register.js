
     // Check if content fits in viewport and disable scrolling accordingly
     function checkContentFit() {
       const documentHeight = document.documentElement.scrollHeight;
       const windowHeight = window.innerHeight;

       if (documentHeight <= windowHeight) {
         // Content fits, disable scrolling
         document.documentElement.style.overflow = 'hidden';
         document.body.style.overflow = 'hidden';
       } else {
         // Content doesn't fit, enable scrolling
         document.documentElement.style.overflow = 'auto';
         document.body.style.overflow = 'auto';
       }
     }

     // Check on load and resize
     window.addEventListener('load', checkContentFit);
     window.addEventListener('resize', checkContentFit);

     // Also check after a short delay to ensure all content is rendered
     setTimeout(checkContentFit, 100);

// Password visibility toggles
const togglePassword = document.querySelector("#togglePassword");
const password = document.querySelector("#password");
const togglePasswordConfirm = document.querySelector("#togglePasswordConfirm");
const passwordConfirm = document.querySelector("#password-confirm");

function setupPasswordToggle(toggleBtn, passwordField) {
  if (toggleBtn && passwordField) {
    toggleBtn.addEventListener("click", function () {
      const type =
        passwordField.getAttribute("type") === "password" ? "text" : "password";
      passwordField.setAttribute("type", type);

      this.innerHTML =
        type === "password"
          ? '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" /><path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" /></svg>'
          : '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" /></svg>';
    });
  }
}

setupPasswordToggle(togglePassword, password);
setupPasswordToggle(togglePasswordConfirm, passwordConfirm);

// Form validation
const form = document.querySelector("#kc-register-form");
const firstName = document.querySelector("#firstName");
const lastName = document.querySelector("#lastName");
const email = document.querySelector("#email");
const terms = document.querySelector("#terms");
const submitBtn = document.querySelector("#kc-register");

const emailValidation = document.querySelector("#email-validation");
const passwordValidation = document.querySelector("#password-validation");
const confirmPasswordValidation = document.querySelector(
  "#confirm-password-validation"
);
const termsValidation = document.querySelector("#terms-validation");
const confirmPasswordIcon = document.querySelector("#confirm-password-icon");

let validationState = {
  firstName: false,
  lastName: false,
  email: false,
  password: false,
  passwordConfirm: false,
  terms: false,
};

function updateSubmitButton() {
  const allValid = Object.values(validationState).every((valid) => valid);
  submitBtn.disabled = !allValid;
}

function validateEmail(emailValue) {
  const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return emailRegex.test(emailValue);
}

function validatePassword(passwordValue) {
  const hasUppercase = /[A-Z]/.test(passwordValue);
  const hasLowercase = /[a-z]/.test(passwordValue);
  const hasNumbers = /\d/.test(passwordValue);
  const hasMinLength = passwordValue.length >= 8;

  return hasUppercase && hasLowercase && hasNumbers && hasMinLength;
}

function showValidationMessage(element, message, isError = true) {
  element.textContent = message;
  element.classList.remove("hidden");
  element.classList.toggle("error", isError);
  element.classList.toggle("success", !isError);
}

function hideValidationMessage(element) {
  element.classList.add("hidden");
}

// First Name validation
firstName.addEventListener("input", function () {
  validationState.firstName = this.value.trim().length > 0;
  updateSubmitButton();
});

// Last Name validation
lastName.addEventListener("input", function () {
  validationState.lastName = this.value.trim().length > 0;
  updateSubmitButton();
});

// Email validation
email.addEventListener("input", function () {
  const isValid = validateEmail(this.value);
  validationState.email = isValid;

  if (this.value.length > 0) {
    if (isValid) {
      showValidationMessage(emailValidation, "Valid email address", false);
      this.classList.remove(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );
    } else {
      showValidationMessage(
        emailValidation,
        "Please enter a valid email address"
      );
      this.classList.add(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );
    }
  } else {
    hideValidationMessage(emailValidation);
    this.classList.remove(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
  }

  updateSubmitButton();
});

// Password validation
password.addEventListener("input", function () {
  const isValid = validatePassword(this.value);
  validationState.password = isValid;

  if (this.value.length > 0) {
    if (isValid) {
      showValidationMessage(passwordValidation, "Strong password!", false);
      this.classList.remove(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );
    } else {
      showValidationMessage(
        passwordValidation,
        "Password must be at least 8 characters with uppercase, lowercase and numbers"
      );
      this.classList.add(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );
    }
  } else {
    passwordValidation.textContent =
      "Password must be at least 8 characters with uppercase, lowercase and numbers";
    passwordValidation.classList.remove("hidden", "success");
    passwordValidation.classList.add("error");
    this.classList.remove(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
  }

  // Re-validate confirm password when password changes
  if (passwordConfirm.value.length > 0) {
    passwordConfirm.dispatchEvent(new Event("input"));
  }

  updateSubmitButton();
});

// Confirm Password validation
passwordConfirm.addEventListener("input", function () {
  const passwordsMatch = this.value === password.value && this.value.length > 0;
  validationState.passwordConfirm = passwordsMatch;

  if (this.value.length > 0) {
    if (passwordsMatch) {
      showValidationMessage(
        confirmPasswordValidation,
        "Passwords match!",
        false
      );
      this.classList.remove(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );

      // Change icon to green check
      confirmPasswordIcon.innerHTML = `
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
              </svg>
            `;
    } else {
      showValidationMessage(
        confirmPasswordValidation,
        "Passwords do not match"
      );
      this.classList.add(
        "border-[var(--error-color)]",
        "focus:ring-[var(--error-color)]"
      );

      // Reset icon to lock
      confirmPasswordIcon.innerHTML = `
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
              </svg>
            `;
    }
  } else {
    hideValidationMessage(confirmPasswordValidation);
    this.classList.remove(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );

    // Reset icon to lock
    confirmPasswordIcon.innerHTML = `
            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
              <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
            </svg>
          `;
  }

  updateSubmitButton();
});

// Terms validation
terms.addEventListener("change", function () {
  validationState.terms = this.checked;

  if (this.checked) {
    hideValidationMessage(termsValidation);
  } else {
    showValidationMessage(
      termsValidation,
      "You must agree to the Terms of Service and Privacy Policy"
    );
  }

  updateSubmitButton();
});

// Form submission validation
form.addEventListener("submit", function (e) {
  let hasErrors = false;

  // Validate all fields
  if (!validationState.firstName) {
    firstName.classList.add(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
    hasErrors = true;
  }

  if (!validationState.lastName) {
    lastName.classList.add(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
    hasErrors = true;
  }

  if (!validationState.email) {
    email.classList.add(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
    showValidationMessage(
      emailValidation,
      "Please enter a valid email address"
    );
    hasErrors = true;
  }

  if (!validationState.password) {
    password.classList.add(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
    showValidationMessage(
      passwordValidation,
      "Password must be at least 8 characters with uppercase, lowercase and numbers"
    );
    hasErrors = true;
  }

  if (!validationState.passwordConfirm) {
    passwordConfirm.classList.add(
      "border-[var(--error-color)]",
      "focus:ring-[var(--error-color)]"
    );
    showValidationMessage(confirmPasswordValidation, "Passwords do not match");
    hasErrors = true;
  }

  if (!validationState.terms) {
    showValidationMessage(
      termsValidation,
      "You must agree to the Terms of Service and Privacy Policy"
    );
    hasErrors = true;
  }

  if (hasErrors) {
    e.preventDefault();
  }
});

// Initialize validation state
updateSubmitButton();

