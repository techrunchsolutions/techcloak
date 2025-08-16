<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Attorney AI - Sign Up</title>
    <link href="data:image/x-icon;base64," rel="icon" type="image/x-icon" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link crossorigin="" href="https://fonts.gstatic.com/" rel="preconnect" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Playfair+Display:wght@600&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />
    <style type="text/tailwindcss">
      /* Hide all default Keycloak elements */
      .login-pf body {
        background: none !important;
        font-family: inherit !important;
      }

      .login-pf .container {
        background: none !important;
        box-shadow: none !important;
        padding: 0 !important;
        margin: 0 !important;
        max-width: none !important;
        width: 100% !important;
      }

      .login-pf-page .login-pf-brand,
      .login-pf-page .login-pf-header,
      .login-pf-page .card-pf,
      .login-pf-page .login-pf-social-section,
      .login-pf-page .login-pf-signup,
      .login-pf-page .login-pf-footer,
      #kc-header,
      #kc-header-wrapper,
      #kc-info,
      #kc-info-wrapper,
      .kc-logo-text,
      .alert,
      .alert-error,
      .alert-warning,
      .alert-success,
      .alert-info {
        display: none !important;
      }

      .login-pf-page {
        background: none !important;
        padding: 0 !important;
        margin: 0 !important;
      }

      #kc-container,
      #kc-container-wrapper {
        background: none !important;
        padding: 0 !important;
        margin: 0 !important;
        box-shadow: none !important;
        border: none !important;
      }

      #kc-content,
      #kc-content-wrapper {
        background: none !important;
        padding: 0 !important;
        margin: 0 !important;
        box-shadow: none !important;
        border: none !important;
      }

      :root {
        --primary-color: #2563eb;
        --secondary-color: #1e40af;
        --background-color: #f8fafc;
        --card-background: #ffffff;
        --text-primary: #1e293b;
        --text-secondary: #64748b;
        --input-border: #e2e8f0;
        --input-focus: #2563eb;
        --button-hover: #1d4ed8;
        --accent-color: #f59e0b;
        --error-color: #dc2626;
        --success-color: #16a34a;
      }

      * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
      }

      html, body {
        height: 100%;
        overflow: hidden;
      }

      body {
        @apply font-sans bg-[var(--background-color)] text-[var(--text-primary)] antialiased;
      }

      .card {
        @apply bg-[var(--card-background)] rounded-xl shadow-xl p-8 border border-gray-100;
        box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1),
          0 10px 10px -5px rgba(0, 0, 0, 0.04);
      }

      .button_primary {
        @apply bg-gradient-to-r from-[var(--primary-color)] to-[var(--secondary-color)] text-white rounded-lg px-4 py-3 text-base font-semibold hover:opacity-90 transition-all duration-300 w-full shadow-md hover:shadow-lg;
      }

      .button_primary:disabled {
        @apply opacity-50 cursor-not-allowed;
      }

      .input {
        @apply border border-[var(--input-border)] rounded-lg px-4 py-3 focus:outline-none focus:ring-2 focus:ring-[var(--input-focus)] w-full transition-all duration-300 bg-white hover:border-[var(--primary-color)];
      }

      .input-container {
        @apply relative;
      }

      .input-icon {
        @apply absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 h-5 w-5;
      }

      .input-with-icon {
        @apply pl-10;
      }

      .form_label {
        @apply block text-[var(--text-secondary)] text-sm font-medium mb-2;
      }

      .logo-text {
        font-family: "Playfair Display", serif;
      }

      .transition-slow {
        transition: all 0.5s ease;
      }

      .legal-icon {
        filter: drop-shadow(0 4px 6px rgba(37, 99, 235, 0.2));
      }

      .side-image {
        background-image: url("https://images.unsplash.com/photo-1589829545856-d10d557cf95f?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80");
        background-size: cover;
        background-position: center;
        border-radius: 1rem 0 0 1rem;
      }

      .side-image-overlay {
        @apply h-full w-full bg-gradient-to-b from-blue-900/70 to-blue-900/30 flex items-center justify-center p-12;
      }

      .error-message {
        @apply text-sm text-[var(--error-color)] mt-1;
      }

      .success-message {
        @apply text-sm text-[var(--success-color)] mt-1;
      }

      .password-toggle {
        @apply absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 cursor-pointer hover:text-[var(--primary-color)] h-5 w-5;
      }

      .validation-text {
        @apply text-xs text-[var(--text-secondary)] mt-1;
      }

      .validation-text.error {
        @apply text-[var(--error-color)];
      }

      .validation-text.success {
        @apply text-[var(--success-color)];
      }

      .main-container {
        height: 100vh;
        overflow: hidden;
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        z-index: 9999;
      }

      .form-container {
        max-height: calc(100vh - 2rem);
        overflow-y: auto;
      }

      @media (max-width: 1023px) {
        .side-image {
          display: none;
        }
      }
    </style>

    <div class="main-container flex items-center justify-center p-4 sm:p-6">
      <div
        class="flex w-full max-w-6xl bg-white rounded-xl shadow-2xl overflow-hidden animate__animated animate__fadeIn"
      >
        <!-- Side Image -->
        <div class="hidden lg:block w-1/2 side-image">
          <div class="side-image-overlay">
            <div class="text-white text-center">
              <div class="relative inline-block mb-6">
                <div
                  class="absolute -inset-4 bg-blue-100/20 rounded-full opacity-60 animate-pulse"
                ></div>
                <div
                  class="relative flex items-center justify-center w-24 h-24 bg-white/10 backdrop-blur-sm rounded-2xl shadow-md legal-icon border border-white/20"
                >
                  <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="h-12 w-12 text-white"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
                    stroke-width="1.5"
                  >
                    <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"
                    />
                  </svg>
                </div>
              </div>
              <h2 class="text-4xl font-bold mb-4 logo-text">AttorneyAI</h2>
              <p class="text-xl mb-6 max-w-md mx-auto leading-relaxed">
                Your AI-powered legal assistant for smarter case management and
                research
              </p>
              <div class="flex justify-center space-x-2 mt-8">
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0s"
                ></div>
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0.2s"
                ></div>
                <div
                  class="w-3 h-3 bg-white rounded-full opacity-60 animate-bounce"
                  style="animation-delay: 0.4s"
                ></div>
              </div>
            </div>
          </div>
        </div>

        <!-- Registration Form -->
        <div class="w-full lg:w-1/2 form-container">
          <div class="p-8 sm:p-12">
            <div class="text-center mb-8 lg:hidden">
              <div class="flex justify-center mb-6">
                <div class="relative">
                  <div
                    class="absolute -inset-4 bg-blue-100 rounded-full opacity-60 animate-pulse"
                  ></div>
                  <div
                    class="relative flex items-center justify-center w-24 h-24 bg-white rounded-2xl shadow-md legal-icon"
                  >
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="h-12 w-12 text-blue-600"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                      stroke-width="1.5"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M9 12l2 2 4-4m5.618-4.016A11.955 11.955 0 0112 2.944a11.955 11.955 0 01-8.618 3.04A12.02 12.02 0 003 9c0 5.591 3.824 10.29 9 11.622 5.176-1.332 9-6.03 9-11.622 0-1.042-.133-2.052-.382-3.016z"
                      />
                    </svg>
                  </div>
                </div>
              </div>
              <h1
                class="text-3xl font-bold text-[var(--text-primary)] logo-text mb-2"
              >
                AttorneyAI
              </h1>
              <p class="text-[var(--text-secondary)]">
                AI-powered legal intelligence
              </p>
            </div>

            <h2 class="text-2xl font-bold text-[var(--text-primary)] mb-1">
              Create your account
            </h2>
            <p class="text-[var(--text-secondary)] mb-8">
              Join AttorneyAI and revolutionize your legal practice
            </p>

            <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
              <div class="mb-4 p-4 rounded-lg <#if message.type = 'error'>bg-red-50 border border-red-200<#elseif message.type = 'success'>bg-green-50 border border-green-200<#else>bg-blue-50 border border-blue-200</#if>">
                <span class="text-sm <#if message.type = 'error'>text-red-600<#elseif message.type = 'success'>text-green-600<#else>text-blue-600</#if>">${kcSanitize(message.summary)?no_esc}</span>
              </div>
            </#if>

            <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-6">
              <div class="space-y-5">
                <!-- First Name and Last Name -->
                <div class="grid grid-cols-1 sm:grid-cols-2 gap-4">
                  <div>
                    <label class="form_label" for="firstName">${msg("firstName")}</label>
                    <div class="input-container">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="input-icon"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        stroke-width="1.5"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                        />
                      </svg>
                      <input
                        class="input input-with-icon <#if messagesPerField.existsError('firstName')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                        id="firstName"
                        name="firstName"
                        value="${(register.formData.firstName!'')}"
                        placeholder="John"
                        type="text"
                        autofocus
                        aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                      />
                    </div>
                    <#if messagesPerField.existsError('firstName')>
                      <div class="error-message">
                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                      </div>
                    </#if>
                  </div>

                  <div>
                    <label class="form_label" for="lastName">${msg("lastName")}</label>
                    <div class="input-container">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="input-icon"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        stroke-width="1.5"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                        />
                      </svg>
                      <input
                        class="input input-with-icon <#if messagesPerField.existsError('lastName')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                        id="lastName"
                        name="lastName"
                        value="${(register.formData.lastName!'')}"
                        placeholder="Doe"
                        type="text"
                        aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                      />
                    </div>
                    <#if messagesPerField.existsError('lastName')>
                      <div class="error-message">
                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                      </div>
                    </#if>
                  </div>
                </div>

                <!-- Email -->
                <div>
                  <label class="form_label" for="email">${msg("email")}</label>
                  <div class="input-container">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="input-icon"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                      stroke-width="1.5"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"
                      />
                    </svg>
                    <input
                      class="input input-with-icon <#if messagesPerField.existsError('email')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                      id="email"
                      name="email"
                      value="${(register.formData.email!'')}"
                      placeholder="your@email.com"
                      type="email"
                      aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                    />
                  </div>
                  <#if messagesPerField.existsError('email')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </div>
                  </#if>
                  <div id="email-validation" class="validation-text hidden"></div>
                </div>

                <!-- Username (if required) -->
                <#if !realm.registrationEmailAsUsername>
                  <div>
                    <label class="form_label" for="username">${msg("username")}</label>
                    <div class="input-container">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        class="input-icon"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        stroke-width="1.5"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"
                        />
                      </svg>
                      <input
                        class="input input-with-icon <#if messagesPerField.existsError('username')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                        id="username"
                        name="username"
                        value="${(register.formData.username!'')}"
                        type="text"
                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                      />
                    </div>
                    <#if messagesPerField.existsError('username')>
                      <div class="error-message">
                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                      </div>
                    </#if>
                  </div>
                </#if>

                <!-- Password -->
                <div>
                  <label class="form_label" for="password">${msg("password")}</label>
                  <div class="input-container">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="input-icon"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                      stroke-width="1.5"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                      />
                    </svg>
                    <input
                      class="input input-with-icon <#if messagesPerField.existsError('password')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                      id="password"
                      name="password"
                      placeholder="••••••••"
                      type="password"
                      aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                    />
                    <span class="password-toggle" id="togglePassword">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                        />
                      </svg>
                    </span>
                  </div>
                  <#if messagesPerField.existsError('password')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </div>
                  </#if>
                  <div id="password-validation" class="validation-text">
                    Password must be at least 8 characters with uppercase, lowercase and numbers
                  </div>
                </div>

                <!-- Confirm Password -->
                <div>
                  <label class="form_label" for="password-confirm">${msg("passwordConfirm")}</label>
                  <div class="input-container">
                    <svg
                      xmlns="http://www.w3.org/2000/svg"
                      class="input-icon"
                      id="confirm-password-icon"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                      stroke-width="1.5"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"
                      />
                    </svg>
                    <input
                      class="input input-with-icon <#if messagesPerField.existsError('password-confirm')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                      id="password-confirm"
                      name="password-confirm"
                      placeholder="••••••••"
                      type="password"
                      aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                    />
                    <span class="password-toggle" id="togglePasswordConfirm">
                      <svg
                        xmlns="http://www.w3.org/2000/svg"
                        fill="none"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                      >
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
                        />
                        <path
                          stroke-linecap="round"
                          stroke-linejoin="round"
                          d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"
                        />
                      </svg>
                    </span>
                  </div>
                  <#if messagesPerField.existsError('password-confirm')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </div>
                  </#if>
                  <div id="confirm-password-validation" class="validation-text hidden"></div>
                </div>

                <!-- Terms and Conditions -->
                <div class="flex items-start space-x-3">
                  <input
                    class="h-4 w-4 text-[var(--primary-color)] focus:ring-[var(--primary-color)] border-gray-300 rounded mt-1"
                    id="terms"
                    name="terms"
                    type="checkbox"
                    required
                  />
                  <label class="text-sm text-[var(--text-secondary)]" for="terms">
                    I agree to the
                    <a href="#" class="text-[var(--primary-color)] hover:underline">Terms of Service</a>
                    and
                    <a href="#" class="text-[var(--primary-color)] hover:underline">Privacy Policy</a>
                  </label>
                </div>
                <div id="terms-validation" class="error-message hidden">
                  You must agree to the Terms of Service and Privacy Policy
                </div>
              </div>

              <button
                class="button_primary mt-2 flex items-center justify-center gap-2 hover:gap-3 transition-all"
                name="register"
                id="kc-register"
                type="submit"
                disabled
              >
                <span>Create Account</span>
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  class="h-5 w-5"
                  viewBox="0 0 20 20"
                  fill="currentColor"
                >
                  <path
                    fill-rule="evenodd"
                    d="M10.293 5.293a1 1 0 011.414 0l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414-1.414L12.586 11H5a1 1 0 110-2h7.586l-2.293-2.293a1 1 0 010-1.414z"
                    clip-rule="evenodd"
                  />
                </svg>
              </button>
            </form>

            <p
              class="text-center text-xs sm:text-sm text-[var(--text-secondary)] mt-6 sm:mt-8"
            >
              Already have an account?
              <a
                class="font-medium text-[var(--primary-color)] hover:underline transition-slow"
                href="${url.loginUrl}"
                >Sign in</a
              >
            </p>
          </div>
        </div>
      </div>
    </div>

    <script>
      // Password visibility toggles
      const togglePassword = document.querySelector('#togglePassword');
      const password = document.querySelector('#password');
      const togglePasswordConfirm = document.querySelector('#togglePasswordConfirm');
      const passwordConfirm = document.querySelector('#password-confirm');

      function setupPasswordToggle(toggleBtn, passwordField) {
        if (toggleBtn && passwordField) {
          toggleBtn.addEventListener('click', function() {
            const type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
            passwordField.setAttribute('type', type);

            this.innerHTML = type === 'password' ?
              '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" /><path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" /></svg>' :
              '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" /></svg>';
          });
        }
      }

      setupPasswordToggle(togglePassword, password);
      setupPasswordToggle(togglePasswordConfirm, passwordConfirm);

      // Form validation
      const form = document.querySelector('#kc-register-form');
      const firstName = document.querySelector('#firstName');
      const lastName = document.querySelector('#lastName');
      const email = document.querySelector('#email');
      const terms = document.querySelector('#terms');
      const submitBtn = document.querySelector('#kc-register');

      const emailValidation = document.querySelector('#email-validation');
      const passwordValidation = document.querySelector('#password-validation');
      const confirmPasswordValidation = document.querySelector('#confirm-password-validation');
      const termsValidation = document.querySelector('#terms-validation');
      const confirmPasswordIcon = document.querySelector('#confirm-password-icon');

      let validationState = {
        firstName: false,
        lastName: false,
        email: false,
        password: false,
        passwordConfirm: false,
        terms: false
      };

      function updateSubmitButton() {
        const allValid = Object.values(validationState).every(valid => valid);
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
        element.classList.remove('hidden');
        element.classList.toggle('error', isError);
        element.classList.toggle('success', !isError);
      }

      function hideValidationMessage(element) {
        element.classList.add('hidden');
      }

      // First Name validation
      firstName.addEventListener('input', function() {
        validationState.firstName = this.value.trim().length > 0;
        updateSubmitButton();
      });

      // Last Name validation
      lastName.addEventListener('input', function() {
        validationState.lastName = this.value.trim().length > 0;
        updateSubmitButton();
      });

      // Email validation
      email.addEventListener('input', function() {
        const isValid = validateEmail(this.value);
        validationState.email = isValid;

        if (this.value.length > 0) {
          if (isValid) {
            showValidationMessage(emailValidation, 'Valid email address', false);
            this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          } else {
            showValidationMessage(emailValidation, 'Please enter a valid email address');
            this.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          }
        } else {
          hideValidationMessage(emailValidation);
          this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
        }

        updateSubmitButton();
      });

      // Password validation
      password.addEventListener('input', function() {
        const isValid = validatePassword(this.value);
        validationState.password = isValid;

        if (this.value.length > 0) {
          if (isValid) {
            showValidationMessage(passwordValidation, 'Strong password!', false);
            this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          } else {
            showValidationMessage(passwordValidation, 'Password must be at least 8 characters with uppercase, lowercase and numbers');
            this.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          }
        } else {
          passwordValidation.textContent = 'Password must be at least 8 characters with uppercase, lowercase and numbers';
          passwordValidation.classList.remove('hidden', 'success');
          passwordValidation.classList.add('error');
          this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
        }

        // Re-validate confirm password when password changes
        if (passwordConfirm.value.length > 0) {
          passwordConfirm.dispatchEvent(new Event('input'));
        }

        updateSubmitButton();
      });

      // Confirm Password validation
      passwordConfirm.addEventListener('input', function() {
        const passwordsMatch = this.value === password.value && this.value.length > 0;
        validationState.passwordConfirm = passwordsMatch;

        if (this.value.length > 0) {
          if (passwordsMatch) {
            showValidationMessage(confirmPasswordValidation, 'Passwords match!', false);
            this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');

            // Change icon to green check
            confirmPasswordIcon.innerHTML = `
              <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 text-green-500" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                <path stroke-linecap="round" stroke-linejoin="round" d="M5 13l4 4L19 7" />
              </svg>
            `;
          } else {
            showValidationMessage(confirmPasswordValidation, 'Passwords do not match');
            this.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');

            // Reset icon to lock
            confirmPasswordIcon.innerHTML = `
              <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5">
                <path stroke-linecap="round" stroke-linejoin="round" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z" />
              </svg>
            `;
          }
        } else {
          hideValidationMessage(confirmPasswordValidation);
          this.classList.remove('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');

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
      terms.addEventListener('change', function() {
        validationState.terms = this.checked;

        if (this.checked) {
          hideValidationMessage(termsValidation);
        } else {
          showValidationMessage(termsValidation, 'You must agree to the Terms of Service and Privacy Policy');
        }

        updateSubmitButton();
      });

      // Form submission validation
      form.addEventListener('submit', function(e) {
        let hasErrors = false;

        // Validate all fields
        if (!validationState.firstName) {
          firstName.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          hasErrors = true;
        }

        if (!validationState.lastName) {
          lastName.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          hasErrors = true;
        }

        if (!validationState.email) {
          email.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          showValidationMessage(emailValidation, 'Please enter a valid email address');
          hasErrors = true;
        }

        if (!validationState.password) {
          password.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          showValidationMessage(passwordValidation, 'Password must be at least 8 characters with uppercase, lowercase and numbers');
          hasErrors = true;
        }

        if (!validationState.passwordConfirm) {
          passwordConfirm.classList.add('border-[var(--error-color)]', 'focus:ring-[var(--error-color)]');
          showValidationMessage(confirmPasswordValidation, 'Passwords do not match');
          hasErrors = true;
        }

        if (!validationState.terms) {
          showValidationMessage(termsValidation, 'You must agree to the Terms of Service and Privacy Policy');
          hasErrors = true;
        }

        if (hasErrors) {
          e.preventDefault();
        }
      });

      // Initialize validation state
      updateSubmitButton();
    </script>
    </#if>
</@layout.registrationLayout>
