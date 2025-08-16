<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Attorney AI - Login</title>
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

      .password-toggle {
        @apply absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 cursor-pointer hover:text-[var(--primary-color)] h-5 w-5;
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

        <!-- Login Form -->
        <div class="w-full lg:w-1/2 p-8 sm:p-12">
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
            Welcome back
          </h2>
          <p class="text-[var(--text-secondary)] mb-8">
            Please enter your credentials to access your account
          </p>

          <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="mb-4 p-4 rounded-lg <#if message.type = 'error'>bg-red-50 border border-red-200<#elseif message.type = 'success'>bg-green-50 border border-green-200<#else>bg-blue-50 border border-blue-200</#if>">
              <span class="text-sm <#if message.type = 'error'>text-red-600<#elseif message.type = 'success'>text-green-600<#else>text-blue-600</#if>">${kcSanitize(message.summary)?no_esc}</span>
            </div>
          </#if>

          <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="space-y-6">
            <div class="space-y-5">
              <div>
                <label class="form_label" for="username">
                  <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
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
                    class="input input-with-icon <#if messagesPerField.existsError('username')>border-[var(--error-color)] focus:ring-[var(--error-color)]</#if>"
                    id="username"
                    name="username"
                    value="${(login.username!'')}"
                    placeholder="your@email.com"
                    type="text"
                    autofocus
                    autocomplete="off"
                    aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                  />
                </div>
                <#if messagesPerField.existsError('username')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                  </div>
                </#if>
              </div>

              <div>
                <div class="flex justify-between items-center">
                  <label class="form_label" for="password">${msg("password")}</label>
                </div>
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
                    autocomplete="off"
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
                <div class="flex justify-between">
                  <#if messagesPerField.existsError('password')>
                    <div class="error-message">
                      ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </div>
                  </#if>
                  <#if realm.resetPasswordAllowed>
                    <a
                      class="text-xs sm:text-sm font-medium text-[var(--primary-color)] hover:underline transition-slow mt-2"
                      href="${url.loginResetCredentialsUrl}"
                      >${msg("doForgotPassword")}</a
                    >
                  </#if>
                </div>
              </div>

              <#if realm.rememberMe && !usernameEditDisabled??>
                <div class="flex items-center">
                  <input
                    class="h-4 w-4 text-[var(--primary-color)] focus:ring-[var(--primary-color)] border-gray-300 rounded"
                    id="rememberMe"
                    name="rememberMe"
                    type="checkbox"
                    <#if login.rememberMe??>checked</#if>
                  />
                  <label class="ml-2 block text-sm text-[var(--text-secondary)]" for="rememberMe">
                    ${msg("rememberMe")}
                  </label>
                </div>
              </#if>
            </div>

            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

            <button
              class="button_primary mt-2 flex items-center justify-center gap-2 hover:gap-3 transition-all"
              name="login"
              id="kc-login"
              type="submit"
            >
              <span>${msg("doLogIn")}</span>
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

          <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <p
              class="text-center text-xs sm:text-sm text-[var(--text-secondary)] mt-6 sm:mt-8"
            >
              ${msg("noAccount")}
              <a
                class="font-medium text-[var(--primary-color)] hover:underline transition-slow"
                href="${url.registrationUrl}"
                >${msg("doRegister")}</a
              >
            </p>
          </#if>
        </div>
      </div>
    </div>

    <script>
      // Toggle password visibility
      const togglePassword = document.querySelector('#togglePassword');
      const password = document.querySelector('#password');

      if (togglePassword && password) {
        togglePassword.addEventListener('click', function() {
          const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
          password.setAttribute('type', type);

          // Toggle eye icon
          this.innerHTML = type === 'password' ?
            '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" /><path stroke-linecap="round" stroke-linejoin="round" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" /></svg>' :
            '<svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor"><path stroke-linecap="round" stroke-linejoin="round" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" /></svg>';
        });
      }
    </script>
    </#if>
</@layout.registrationLayout>
