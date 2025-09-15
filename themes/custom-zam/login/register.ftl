<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section == "header">
        <title>Sign Up - NASD ZAM</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css"/>
    <#elseif section == "form">
<style>
  /* ===== CSS VARIABLES ===== */
  :root {
    --primary-color: #0066cc;
    --primary-hover: #0052a3;
    --error-color: #dc3545;
    --success-color: #28a745;
    --text-primary: #333;
    --text-secondary: #6c757d;
    --background-light: #f8f9fa;
    --border-color: #dee2e6;
    --border-radius: 8px;
    --transition: 0.3s ease;
    --font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    --input-height: 60px;
    --spacing-xs: 8px;
    --spacing-sm: 16px;
    --spacing-md: 24px;
    --spacing-lg: 32px;
    --spacing-xl: 40px;
    --spacing-xxl: 48px;
  }

  /* ===== KEYCLOAK OVERRIDES ===== */
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

  /* ===== BASE STYLES ===== */
  body {
    background-color: white !important;
    font-family: var(--font-family);
  }

  /* ===== LAYOUT COMPONENTS ===== */
  .auth-container {
    min-height: 100vh;
    display: flex;
  }

  .auth-sidebar {
    width: 50%;
    position: relative;
    overflow: hidden;
    display: none;
  }

  .auth-main {
    padding: var(--spacing-xl);
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    min-height: 100vh;
    overflow-y: auto;
  }

  @media (min-width: 992px) {
    .auth-sidebar {
      display: block;
    }
    .auth-main {
      width: 50%;
    }
  }

  @media (max-width: 991px) {
    .auth-main {
      width: 100%;
    }
  }

  /* ===== CAROUSEL COMPONENTS ===== */
  .carousel-container {
    position: relative;
    width: 100%;
    height: 100vh;
    overflow: hidden;
  }

  .carousel-slide {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    object-fit: cover;
    opacity: 0;
    transition: opacity 0.5s var(--transition);
  }

  .carousel-slide--active {
    opacity: 1;
  }

  /* ===== BRAND COMPONENTS ===== */
  .brand-header {
    text-align: center;
    margin-bottom: var(--spacing-lg);
    margin-top: var(--spacing-xl);
  }

  .brand-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: var(--spacing-xs);
  }

  .brand-title {
    font-weight: bold;
    font-size: 1.25rem;
    margin: 0;
    color: var(--text-primary);
  }

  /* ===== PAGE TITLE ===== */
  .page-header {
    text-align: center;
    margin-bottom: var(--spacing-xxl);
  }

  .page-title {
    font-weight: bold;
    font-size: 2.5rem;
    color: var(--text-primary);
    margin: 0;
  }

  /* ===== FORM COMPONENTS ===== */
  .auth-form {
    max-width: 532px;
    margin: 0 auto;
  }

  .form-field {
    margin-bottom: var(--spacing-md);
  }

  .form-label {
    font-weight: 600;
    font-size: 1.25rem;
    color: var(--text-primary);
    margin-bottom: var(--spacing-xs);
    display: block;
  }

  .form-input {
    width: 100%;
    height: var(--input-height);
    padding: var(--spacing-sm);
    background-color: var(--background-light);
    border: 1px solid var(--border-color);
    border-radius: var(--border-radius);
    font-size: 1rem;
    transition: border-color var(--transition);
  }

  .form-input:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.1);
  }

  .form-input--error {
    border-color: var(--error-color);
  }

  .form-input--valid {
    border-color: var(--success-color);
  }

  .input-wrapper {
    position: relative;
  }

  .input-toggle {
    position: absolute;
    right: 15px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: var(--text-secondary);
    width: 20px;
    height: 20px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .input-toggle svg {
    width: 20px;
    height: 20px;
  }

  /* ===== VALIDATION MESSAGES ===== */
  .validation-message {
    font-size: 0.875rem;
    margin-top: 4px;
    display: none;
  }

  .validation-message--error {
    color: var(--error-color);
  }

  .validation-message--success {
    color: var(--success-color);
  }

  .validation-message--show {
    display: block;
  }

  /* ===== BUTTONS ===== */
  .btn-primary {
    width: 100%;
    height: var(--input-height);
    background-color: var(--primary-color);
    border: none;
    border-radius: var(--border-radius);
    color: white;
    font-size: 1.25rem;
    font-weight: 600;
    cursor: pointer;
    transition: background-color var(--transition);
    margin-bottom: var(--spacing-md);
  }

  .btn-primary:hover:not(:disabled) {
    background-color: var(--primary-hover);
  }

  .btn-primary:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    background-color: var(--text-secondary);
  }

  /* ===== UTILITY COMPONENTS ===== */
  .footer-text {
    text-align: center;
    color: var(--text-secondary);
    font-size: 0.9rem;
    margin-top: var(--spacing-lg);
  }
</style>

<div class="auth-container">
  <!-- Sidebar with Background Images -->
  <div class="auth-sidebar">
    <div class="carousel-container">
      <img src="${url.resourcesPath}/img/car4.png" class="carousel-slide carousel-slide--active"/>
      <img src="${url.resourcesPath}/img/car5.png" class="carousel-slide"/>
      <img src="${url.resourcesPath}/img/car6.png" class="carousel-slide"/>
    </div>
  </div>

  <!-- Main Content -->
  <main class="auth-main">
    <!-- Brand Header -->
    <header class="brand-header">
      <div class="brand-logo">
        <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
        <h1 class="brand-title">NASD ZAM</h1>
      </div>
    </header>

    <!-- Page Title -->
    <div class="page-header">
      <h2 class="page-title">Create your account</h2>
    </div>

    <!-- Registration Form -->
    <form id="kc-register-form" action="${url.registrationAction}" method="post" class="auth-form">
      <div class="row g-4 mb-4">
        <div class="col-md-6">
          <div class="form-field">
            <label for="firstName" class="form-label">First Name</label>
            <input type="text" id="firstName" name="firstName"
                   value="${(register.formData.firstName!'')}"
                   class="form-input" required/>
            <div class="validation-message validation-message--error" id="firstName-error">
              First name is required
            </div>
            <#if messagesPerField.existsError('firstName')>
              <div class="validation-message validation-message--error validation-message--show">
                ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
              </div>
            </#if>
          </div>
        </div>
        <div class="col-md-6">
          <div class="form-field">
            <label for="lastName" class="form-label">Last Name</label>
            <input type="text" id="lastName" name="lastName"
                   value="${(register.formData.lastName!'')}"
                   class="form-input" required/>
            <div class="validation-message validation-message--error" id="lastName-error">
              Last name is required
            </div>
            <#if messagesPerField.existsError('lastName')>
              <div class="validation-message validation-message--error validation-message--show">
                ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
              </div>
            </#if>
          </div>
        </div>
      </div>

      <div class="form-field">
        <label for="email" class="form-label">Email</label>
        <input type="email" id="email" name="email"
               value="${(register.formData.email!'')}"
               class="form-input" required/>
        <div class="validation-message validation-message--error" id="email-error">
          Please enter a valid email address
        </div>
        <div class="validation-message validation-message--success" id="email-success">
          Valid email address
        </div>
        <#if messagesPerField.existsError('email')>
          <div class="validation-message validation-message--error validation-message--show">
            ${kcSanitize(messagesPerField.get('email'))?no_esc}
          </div>
        </#if>
      </div>

      <div class="form-field">
        <label for="password" class="form-label">Password</label>
        <div class="input-wrapper">
          <input type="password" id="password" name="password"
                 class="form-input" style="padding-right: 50px;" required/>
          <span class="input-toggle" id="password-toggle">
            <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
            </svg>
          </span>
        </div>
        <div class="validation-message validation-message--error" id="password-error">
          Password must be at least 8 characters with uppercase, lowercase, and special character
        </div>
        <div class="validation-message validation-message--success" id="password-success">
          Password meets requirements
        </div>
        <#if messagesPerField.existsError('password')>
          <div class="validation-message validation-message--error validation-message--show">
            ${kcSanitize(messagesPerField.get('password'))?no_esc}
          </div>
        </#if>
      </div>

      <div class="form-field">
        <label for="password-confirm" class="form-label">Confirm Password</label>
        <div class="input-wrapper">
          <input type="password" id="password-confirm" name="password-confirm"
                 class="form-input" style="padding-right: 50px;" required/>
          <span class="input-toggle" id="password-confirm-toggle">
            <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
            </svg>
          </span>
        </div>
        <div class="validation-message validation-message--error" id="password-confirm-error">
          Passwords do not match
        </div>
        <div class="validation-message validation-message--success" id="password-confirm-success">
          Passwords match
        </div>
        <#if messagesPerField.existsError('password-confirm')>
          <div class="validation-message validation-message--error validation-message--show">
            ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
          </div>
        </#if>
      </div>

      <button type="submit" id="submit-btn" class="btn-primary" disabled>
        Create account
      </button>
    </form>

    <!-- Footer -->
    <footer class="footer-text">
      © 2024 NASD Plc. All rights reserved
    </footer>
  </main>
</div>

<script>
  // ===== VALIDATION SYSTEM =====
  const ValidationSystem = {
    state: {
      firstName: false,
      lastName: false,
      email: false,
      password: false,
      passwordConfirm: false
    },

    elements: {},

    init() {
      this.cacheElements();
      this.bindEvents();
      this.updateSubmitButton();
    },

    cacheElements() {
      this.elements = {
        form: document.getElementById('kc-register-form'),
        submitBtn: document.getElementById('submit-btn'),
        firstName: document.getElementById('firstName'),
        lastName: document.getElementById('lastName'),
        email: document.getElementById('email'),
        password: document.getElementById('password'),
        passwordConfirm: document.getElementById('password-confirm')
      };
    },

    bindEvents() {
      const validators = {
        firstName: this.validateRequired.bind(this),
        lastName: this.validateRequired.bind(this),
        email: this.validateEmail.bind(this),
        password: this.validatePassword.bind(this),
        passwordConfirm: this.validatePasswordConfirm.bind(this)
      };

      Object.keys(validators).forEach(field => {
        const element = this.elements[field];
        if (element) {
          element.addEventListener('input', () => {
            validators[field](field, element.value);
            this.updateSubmitButton();
          });
        }
      });
    },

    validateRequired(field, value) {
      const isValid = value.trim().length > 0;
      this.state[field] = isValid;
      this.updateFieldUI(field, isValid, value.length > 0);
      return isValid;
    },

    validateEmail(field, value) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      const isValid = emailRegex.test(value);
      this.state[field] = isValid;
      this.updateFieldUI(field, isValid, value.length > 0, true);
      return isValid;
    },

    validatePassword(field, value) {
      const requirements = {
        minLength: value.length >= 8,
        hasUppercase: /[A-Z]/.test(value),
        hasLowercase: /[a-z]/.test(value),
        hasSpecialChar: /[!@#$%^&*(),.?":{}|<>]/.test(value)
      };

      const isValid = Object.values(requirements).every(req => req);
      this.state[field] = isValid;
      this.updateFieldUI(field, isValid, value.length > 0, true);

      // Re-validate password confirmation if it has a value
      if (this.elements.passwordConfirm.value.length > 0) {
        this.validatePasswordConfirm('passwordConfirm', this.elements.passwordConfirm.value);
      }

      return isValid;
    },

    validatePasswordConfirm(field, value) {
      const passwordValue = this.elements.password.value;
      const isValid = value === passwordValue && value.length > 0;
      this.state[field] = isValid;
      this.updateFieldUI(field, isValid, value.length > 0, true);
      return isValid;
    },

    updateFieldUI(field, isValid, hasValue, hasSuccessState = false) {
      const input = this.elements[field];
      const errorElement = document.getElementById(`${field}-error`);
      const successElement = document.getElementById(`${field}-success`);

      if (!input || !errorElement) return;

      // Update input classes
      input.classList.remove('form-input--error', 'form-input--valid');

      if (hasValue) {
        input.classList.add(isValid ? 'form-input--valid' : 'form-input--error');
      }

      // Update error message
      errorElement.classList.toggle('validation-message--show', hasValue && !isValid);

      // Update success message (if exists)
      if (successElement && hasSuccessState) {
        successElement.classList.toggle('validation-message--show', hasValue && isValid);
      }
    },

    updateSubmitButton() {
      const allValid = Object.values(this.state).every(state => state);
      this.elements.submitBtn.disabled = !allValid;
    }
  };

  // ===== PASSWORD TOGGLE SYSTEM =====
  const PasswordToggleSystem = {
    init() {
      this.setupToggle('password', 'password-toggle');
      this.setupToggle('password-confirm', 'password-confirm-toggle');
    },

    setupToggle(inputId, toggleId) {
      const input = document.getElementById(inputId);
      const toggle = document.getElementById(toggleId);

      if (input && toggle) {
        toggle.addEventListener('click', () => {
          this.toggleVisibility(input, toggle);
        });
      }
    },

    toggleVisibility(input, toggle) {
      const isPassword = input.type === 'password';
      input.type = isPassword ? 'text' : 'password';
      toggle.innerHTML = this.getToggleIcon(isPassword);
    },

    getToggleIcon(showPassword) {
      const basePath = 'M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z';
      const hiddenPath = showPassword ? '<path d="M3 3l18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>' : '';

      return `
        <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
          <path d="${basePath}" fill="currentColor"/>
          ${hiddenPath}
        </svg>
      `;
    }
  };

  // ===== APPLICATION INITIALIZATION =====
  document.addEventListener('DOMContentLoaded', () => {
    ValidationSystem.init();
    PasswordToggleSystem.init();
  });
</script>
    </#if>
</@layout.registrationLayout>
