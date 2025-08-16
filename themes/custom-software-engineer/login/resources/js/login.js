
      document.addEventListener('DOMContentLoaded', function() {
        const togglePassword = document.getElementById('togglePassword');
        const passwordInput = document.getElementById('password');
        const eyeOpen = document.getElementById('eyeOpen');
        const eyeClosed = document.getElementById('eyeClosed');

        if (togglePassword && passwordInput && eyeOpen && eyeClosed) {
          togglePassword.addEventListener('click', function() {
            if (passwordInput.type === 'password') {
              passwordInput.type = 'text';
              eyeOpen.style.display = 'none';
              eyeClosed.style.display = 'block';
            } else {
              passwordInput.type = 'password';
              eyeOpen.style.display = 'block';
              eyeClosed.style.display = 'none';
            }
          });
        }

        // Add loading state to login button
        const loginForm = document.getElementById('kc-form-login');
        const loginButton = document.getElementById('kc-login');

        if (loginForm && loginButton) {
          loginForm.addEventListener('submit', function() {
            loginButton.innerHTML = `
              <svg class="animate-spin h-5 w-5 mr-2" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                <circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
                <path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
              </svg>
              Signing in...
            `;
            loginButton.disabled = true;
          });
        }
      });
 
