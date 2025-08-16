
      // Password visibility toggle functionality
      document.addEventListener('DOMContentLoaded', function() {
        // Password toggle
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const passwordEyeOpen = document.getElementById('passwordEyeOpen');
        const passwordEyeClosed = document.getElementById('passwordEyeClosed');

        if (togglePassword && passwordInput) {
          togglePassword.addEventListener('click', function() {
            if (passwordInput.type === 'password') {
              passwordInput.type = 'text';
              passwordEyeOpen.style.display = 'none';
              passwordEyeClosed.style.display = 'block';
            } else {
              passwordInput.type = 'password';
              passwordEyeOpen.style.display = 'block';
              passwordEyeClosed.style.display = 'none';
            }
          });
        }

        // Confirm password toggle
        const togglePasswordConfirm = document.getElementById('togglePasswordConfirm');
        const confirmPasswordInput = document.getElementById('password-confirm');
        const confirmEyeOpen = document.getElementById('confirmEyeOpen');
        const confirmEyeClosed = document.getElementById('confirmEyeClosed');

        if (togglePasswordConfirm && confirmPasswordInput) {
          togglePasswordConfirm.addEventListener('click', function() {
            if (confirmPasswordInput.type === 'password') {
              confirmPasswordInput.type = 'text';
              confirmEyeOpen.style.display = 'none';
              confirmEyeClosed.style.display = 'block';
            } else {
              confirmPasswordInput.type = 'password';
              confirmEyeOpen.style.display = 'block';
              confirmEyeClosed.style.display = 'none';
            }
          });
        }

        // Password validation
        function validatePassword(password) {
          const lengthValid = password.length >= 8;
          const mixValid = /^(?=.*[a-zA-Z])(?=.*\d)/.test(password);
          return { lengthValid, mixValid, valid: lengthValid && mixValid };
        }

        function validatePasswordMatch() {
          const password = passwordInput.value;
          const confirmPassword = confirmPasswordInput.value;
          const validation = document.getElementById('confirm-password-validation');

          if (confirmPassword === '') {
            validation.classList.add('hidden');
            return null;
          }

          if (password === confirmPassword) {
            validation.textContent = 'Passwords match';
            validation.className = 'validation-text success';
            validation.classList.remove('hidden');
            return true;
          } else {
            validation.textContent = 'Passwords do not match';
            validation.className = 'validation-text error';
            validation.classList.remove('hidden');
            return false;
          }
        }

        function validateForm() {
          const firstName = document.getElementById('firstName').value.trim();
          const lastName = document.getElementById('lastName').value.trim();
          const email = document.getElementById('email').value.trim();
          const usernameField = document.getElementById('username');
          const username = usernameField ? usernameField.value.trim() : 'valid';
          const password = passwordInput.value;
          const confirmPassword = confirmPasswordInput.value;

          const passwordValidation = validatePassword(password);
          const passwordsMatch = validatePasswordMatch();

          const allFieldsFilled = firstName && lastName && email && username && password && confirmPassword;
          const allRequirementsMet = passwordValidation.valid && passwordsMatch === true;

          const registerButton = document.getElementById('kc-register');
          registerButton.disabled = !(allFieldsFilled && allRequirementsMet);
        }

        // Password validation display
        passwordInput.addEventListener('input', function() {
          const validation = validatePassword(this.value);
          const validationDiv = document.getElementById('password-validation');

          if (this.value === '') {
            validationDiv.textContent = 'Use at least 8 characters with a mix of letters and numbers';
            validationDiv.className = 'validation-text';
          } else if (validation.valid) {
            validationDiv.textContent = 'Password meets requirements';
            validationDiv.className = 'validation-text success';
          } else {
            validationDiv.textContent = 'Password must be at least 8 characters with letters and numbers';
            validationDiv.className = 'validation-text error';
          }

          validateForm();
        });

        confirmPasswordInput.addEventListener('input', function() {
          validateForm();
        });

        // Add event listeners to all required inputs
        const allInputs = document.querySelectorAll('input[type="text"], input[type="email"]');
        allInputs.forEach(input => {
          input.addEventListener('input', validateForm);
        });

        // Initial validation
        validateForm();

        // Add loading state to register button
        const registerForm = document.getElementById('kc-register-form');
        const registerButton = document.getElementById('kc-register');

        if (registerForm && registerButton) {
          registerForm.addEventListener('submit', function() {
            registerButton.innerHTML = `
              <svg class="animate-spin h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Creating account...
            `;
            registerButton.disabled = true;
          });
        }
      });
  
