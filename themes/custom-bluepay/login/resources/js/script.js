// Get DOM elements
const passwordInput = document.getElementById('password');
const confirmPasswordInput = document.getElementById('password-confirm');
const registerButton = document.getElementById('registerButton');
const passwordMatchError = document.getElementById('passwordMatchError');
const togglePasswordButtons = document.querySelectorAll('.password-toggle');
const registerForm = document.getElementById('kc-register-form');

// Function to validate password match
function validatePasswordMatch() {
    const password = passwordInput.value;
    const confirmPassword = confirmPasswordInput.value;

    if (password !== confirmPassword) {
        passwordMatchError.style.display = 'block';
        registerButton.disabled = true;
    } else {
        passwordMatchError.style.display = 'none';
        registerButton.disabled = false;
    }
}

// Listen for input events on password and confirmPassword fields
passwordInput.addEventListener('input', validatePasswordMatch);
confirmPasswordInput.addEventListener('input', validatePasswordMatch);

// Toggle password visibility
togglePasswordButtons.forEach(button => {
    button.addEventListener('click', function() {
        const input = this.previousElementSibling;
        const icon = this.querySelector('i');

        if (input.type === 'password') {
            input.type = 'text';
            icon.classList.remove('fa-eye');
            icon.classList.add('fa-eye-slash');
        } else {
            input.type = 'password';
            icon.classList.remove('fa-eye-slash');
            icon.classList.add('fa-eye');
        }
    });
});

// Form submission
if (registerForm) {
    registerForm.addEventListener('submit', function(e) {
        const password = passwordInput.value;
        const confirmPassword = confirmPasswordInput.value;

        // Validate password match before submission
        if (password !== confirmPassword) {
            e.preventDefault(); // Prevent form submission
            passwordMatchError.style.display = 'block';
        } else {
            // Allow form submission
            registerButton.innerHTML = '<span class="spinner-border spinner-border-sm me-2" role="status" aria-hidden="true"></span> Creating account...';
            registerButton.disabled = true;
        }
    });
}