<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section == "header">
        <title>Sign Up - NASD ZAM</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css"/>
    <#elseif section == "form">
<style>
.login-pf-page-header,
.login-pf-header,
h1#kc-page-title,
.login-pf-signup {
    display: none !important;
}

.login-pf-page {
    padding-top: 0;
    border: none;
}

.login-pf-page .card-pf {
    padding: 0;
    margin-bottom: 0;
    border: none;
    max-width: none;
}

#kc-content-wrapper {
    margin-top: 0;
}

body {
    background-color: white !important;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.register-container {
    min-height: 100vh;
    display: flex;
}

.left-content {
    width: 50%;
    position: relative;
    overflow: hidden;
    display: none;
}

@media (min-width: 992px) {
    .left-content { display: block; }
    .main-content { width: 50%; }
}

@media (max-width: 991px) {
    .main-content { width: 100%; }
}

.background-container {
    position: relative;
    width: 100%;
    height: 100vh;
    overflow: hidden;
}

.carousel-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0;
    transition: opacity 0.5s ease-in-out;
}

.carousel-image.active {
    opacity: 1;
}

.main-content {
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    min-height: 100vh;
    overflow-y: auto;
}

.brand-header {
    text-align: center;
    margin-bottom: 32px;
    margin-top: 40px;
}

.brand-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 8px;
}

.brand-title {
    font-weight: bold;
    font-size: 1.25rem;
    margin: 0;
    color: #333;
}

.page-title {
    text-align: center;
    margin-bottom: 48px;
}

.page-title h2 {
    font-weight: bold;
    font-size: 2.5rem;
    color: #333;
    margin: 0;
}

.register-form {
    max-width: 532px;
    margin: 0 auto;
}

.form-group {
    margin-bottom: 24px;
}

.form-label {
    font-weight: 600;
    font-size: 1.25rem;
    color: #333;
    margin-bottom: 8px;
    display: block;
}

.form-control-custom {
    width: 100%;
    height: 60px;
    padding: 16px;
    background-color: #f8f9fa;
    border: 1px solid #dee2e6;
    border-radius: 8px;
    font-size: 1rem;
    transition: border-color 0.3s ease;
}

.form-control-custom:focus {
    outline: none;
    border-color: #0066cc;
    box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.1);
}

.form-control-custom.error {
    border-color: #dc3545;
}

.form-control-custom.valid {
    border-color: #28a745;
}

.input-container {
    position: relative;
}

.password-toggle {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #6c757d;
    width: 20px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.password-toggle svg {
    width: 20px;
    height: 20px;
}

.btn-primary-custom {
    width: 100%;
    height: 60px;
    background-color: #0066cc;
    border: none;
    border-radius: 8px;
    color: white;
    font-size: 1.25rem;
    font-weight: 600;
    cursor: pointer;
    transition: background-color 0.3s ease;
    margin-bottom: 24px;
}

.btn-primary-custom:hover:not(:disabled) {
    background-color: #0052a3;
}

.btn-primary-custom:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    background-color: #6c757d;
}

.error-message {
    color: #dc3545;
    font-size: 0.875rem;
    margin-top: 4px;
    display: none;
}

.error-message.show {
    display: block;
}

.success-message {
    color: #28a745;
    font-size: 0.875rem;
    margin-top: 4px;
    display: none;
}

.success-message.show {
    display: block;
}

.footer-text {
    text-align: center;
    color: #6c757d;
    font-size: 0.9rem;
    margin-top: 32px;
}
</style>

<div class="register-container">
    <!-- Left Content (Hidden on smaller screens) -->
    <div class="left-content">
        <div class="background-container">
            <img src="${url.resourcesPath}/img/car4.png" class="carousel-image active"/>
            <img src="${url.resourcesPath}/img/car5.png" class="carousel-image"/>
            <img src="${url.resourcesPath}/img/car6.png" class="carousel-image"/>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Header with Logo -->
        <div class="brand-header">
            <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD ZAM</h1>
            </div>
        </div>

        <!-- Page Title -->
        <div class="page-title">
            <h2>Create your account</h2>
        </div>

        <!-- Registration Form -->
        <form id="kc-register-form" action="${url.registrationAction}" method="post" class="register-form">
            <div class="row g-4 mb-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="firstName" class="form-label">First Name</label>
                        <input type="text" id="firstName" name="firstName"
                               value="${(register.formData.firstName!'')}"
                               class="form-control-custom" required/>
                        <div class="error-message" id="firstName-error">First name is required</div>
                        <#if messagesPerField.existsError('firstName')>
                            <div class="error-message show">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</div>
                        </#if>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="lastName" class="form-label">Last Name</label>
                        <input type="text" id="lastName" name="lastName"
                               value="${(register.formData.lastName!'')}"
                               class="form-control-custom" required/>
                        <div class="error-message" id="lastName-error">Last name is required</div>
                        <#if messagesPerField.existsError('lastName')>
                            <div class="error-message show">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</div>
                        </#if>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" id="email" name="email"
                       value="${(register.formData.email!'')}"
                       class="form-control-custom" required/>
                <div class="error-message" id="email-error">Please enter a valid email address</div>
                <div class="success-message" id="email-success">Valid email address</div>
                <#if messagesPerField.existsError('email')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('email'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label for="password" class="form-label">Password</label>
                <div class="input-container">
                    <input type="password" id="password" name="password"
                           class="form-control-custom" style="padding-right: 50px;" required/>
                    <span class="password-toggle" id="password-toggle">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                        </svg>
                    </span>
                </div>
                <div class="error-message" id="password-error">Password must be at least 8 characters with uppercase, lowercase, and special character</div>
                <div class="success-message" id="password-success">Password meets requirements</div>
                <#if messagesPerField.existsError('password')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('password'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label for="password-confirm" class="form-label">Confirm Password</label>
                <div class="input-container">
                    <input type="password" id="password-confirm" name="password-confirm"
                           class="form-control-custom" style="padding-right: 50px;" required/>
                    <span class="password-toggle" id="password-confirm-toggle">
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                        </svg>
                    </span>
                </div>
                <div class="error-message" id="password-confirm-error">Passwords do not match</div>
                <div class="success-message" id="password-confirm-success">Passwords match</div>
                <#if messagesPerField.existsError('password-confirm')>
                    <div class="error-message show">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</div>
                </#if>
            </div>

            <button type="submit" id="submit-btn" class="btn-primary-custom" disabled>
                Create account
            </button>
        </form>

        <!-- Footer -->
        <div class="footer-text">
            © 2024 NASD Plc. All rights reserved
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Form validation state
    const validationState = {
        firstName: false,
        lastName: false,
        email: false,
        password: false,
        passwordConfirm: false
    };

    // Get form elements
    const form = document.getElementById('kc-register-form');
    const submitBtn = document.getElementById('submit-btn');
    const firstNameInput = document.getElementById('firstName');
    const lastNameInput = document.getElementById('lastName');
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    const passwordConfirmInput = document.getElementById('password-confirm');

    // Password toggle functionality
    function setupPasswordToggle(inputId, toggleId) {
        const input = document.getElementById(inputId);
        const toggle = document.getElementById(toggleId);

        if (input && toggle) {
            toggle.addEventListener('click', function() {
                if (input.type === 'password') {
                    input.type = 'text';
                    toggle.innerHTML = `
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                            <path d="M3 3l18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                        </svg>
                    `;
                } else {
                    input.type = 'password';
                    toggle.innerHTML = `
                        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                        </svg>
                    `;
                }
            });
        }
    }

    setupPasswordToggle('password', 'password-toggle');
    setupPasswordToggle('password-confirm', 'password-confirm-toggle');

    // Validation functions
    function validateEmail(email) {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return emailRegex.test(email);
    }

    function validatePassword(password) {
        const hasMinLength = password.length >= 8;
        const hasUppercase = /[A-Z]/.test(password);
        const hasLowercase = /[a-z]/.test(password);
        const hasSpecialChar = /[!@#$%^&*(),.?":{}|<>]/.test(password);
        return hasMinLength && hasUppercase && hasLowercase && hasSpecialChar;
    }

    function updateValidationUI(inputElement, isValid, errorElement, successElement) {
        if (isValid) {
            inputElement.classList.remove('error');
            inputElement.classList.add('valid');
            errorElement.classList.remove('show');
            successElement.classList.add('show');
        } else {
            inputElement.classList.add('error');
            inputElement.classList.remove('valid');
            errorElement.classList.add('show');
            successElement.classList.remove('show');
        }
    }

    function updateSubmitButton() {
        const allValid = Object.values(validationState).every(state => state);
        submitBtn.disabled = !allValid;
    }

    // First name validation
    if (firstNameInput) {
        firstNameInput.addEventListener('input', function() {
            const isValid = this.value.trim().length > 0;
            validationState.firstName = isValid;

            const errorElement = document.getElementById('firstName-error');
            if (this.value.length > 0) {
                if (isValid) {
                    this.classList.remove('error');
                    errorElement.classList.remove('show');
                } else {
                    this.classList.add('error');
                    errorElement.classList.add('show');
                }
            }
            updateSubmitButton();
        });
    }

    // Last name validation
    if (lastNameInput) {
        lastNameInput.addEventListener('input', function() {
            const isValid = this.value.trim().length > 0;
            validationState.lastName = isValid;

            const errorElement = document.getElementById('lastName-error');
            if (this.value.length > 0) {
                if (isValid) {
                    this.classList.remove('error');
                    errorElement.classList.remove('show');
                } else {
                    this.classList.add('error');
                    errorElement.classList.add('show');
                }
            }
            updateSubmitButton();
        });
    }

    // Email validation
    if (emailInput) {
        emailInput.addEventListener('input', function() {
            const isValid = validateEmail(this.value);
            validationState.email = isValid;

            const errorElement = document.getElementById('email-error');
            const successElement = document.getElementById('email-success');

            if (this.value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                errorElement.classList.remove('show');
                successElement.classList.remove('show');
            }
            updateSubmitButton();
        });
    }

    // Password validation
    if (passwordInput) {
        passwordInput.addEventListener('input', function() {
            const isValid = validatePassword(this.value);
            validationState.password = isValid;

            const errorElement = document.getElementById('password-error');
            const successElement = document.getElementById('password-success');

            if (this.value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                errorElement.classList.remove('show');
                successElement.classList.remove('show');
            }

            // Re-validate password confirmation
            if (passwordConfirmInput && passwordConfirmInput.value.length > 0) {
                passwordConfirmInput.dispatchEvent(new Event('input'));
            }

            updateSubmitButton();
        });
    }

    // Password confirmation validation
    if (passwordConfirmInput) {
        passwordConfirmInput.addEventListener('input', function() {
            const isValid = this.value === passwordInput.value && this.value.length > 0;
            validationState.passwordConfirm = isValid;

            const errorElement = document.getElementById('password-confirm-error');
            const successElement = document.getElementById('password-confirm-success');

            if (this.value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                errorElement.classList.remove('show');
                successElement.classList.remove('show');
            }
            updateSubmitButton();
        });
    }

    // Initial validation state
    updateSubmitButton();
});
</script>
    </#if>
</@layout.registrationLayout>
