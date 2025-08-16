<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>The Software Engineer - Login</title>
    <link href="data:image/x-icon;base64," rel="icon" type="image/x-icon" />
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <link crossorigin="" href="https://fonts.gstatic.com/" rel="preconnect" />
    <link
      href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"
    />

    <style type="text/tailwindcss">
      :root {
        --primary-color: #0d7ff2;
        --secondary-color: #f2f7ff;
        --background-color: #ffffff;
        --text-primary: #1e293b;
        --text-secondary: #64748b;
        --input-border: #e2e8f0;
        --input-focus: #0d7ff2;
        --button-hover: #0b6ee6;
        --accent-color: #e0f2fe;
        --error-color: #dc2626;
      }

      .login-pf-header, .login-pf-page-header {
        display: none !important;
      }

      .login-pf-page {
        padding-top: 0px;
      }

      html, body {
        @apply font-sans bg-[var(--background-color)] text-[var(--text-primary)] antialiased;
        overflow-x: hidden;
        overflow-y: hidden;
      }

      .button_primary {
        @apply bg-[var(--primary-color)] text-white rounded-lg px-4 py-3 text-base font-semibold hover:bg-[var(--button-hover)] transition-all duration-300 w-full shadow-md hover:shadow-lg;
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

      .transition-slow {
        transition: all 0.5s ease;
      }

      .tech-icon {
        filter: drop-shadow(0 4px 6px rgba(13, 127, 242, 0.2));
      }

      .side-image {
        background-image: url("https://images.unsplash.com/photo-1622675363311-3e1904dc1885?ixlib=rb-4.0.3&auto=format&fit=crop&w=2070&q=80");
        background-size: cover;
        background-position: center;
        border-radius: 1rem 0 0 1rem;
      }

      .side-image-overlay {
        @apply h-full w-full bg-gradient-to-b from-blue-600/70 to-blue-800/30 flex items-center justify-center p-12;
      }

      .error-message {
        @apply text-sm text-[var(--error-color)] mt-1;
      }

      .password-toggle {
        @apply absolute right-3 top-1/2 transform -translate-y-1/2 text-gray-400 cursor-pointer hover:text-[var(--primary-color)] h-5 w-5;
      }

      .process-container {
        @apply w-full max-w-4xl mx-auto relative h-48;
      }

      .process-step {
        @apply absolute top-1/2 flex flex-col items-center w-24 transform -translate-y-1/2 opacity-0;
        animation: flyIn 1.2s forwards cubic-bezier(0.175, 0.885, 0.32, 1.275);
      }
      .step-1 {
        left: 10%;
        animation-delay: 0.6s;
      }
      .step-2 {
        left: 30%;
        animation-delay: 1.2s;
      }
      .step-3 {
        left: 50%;
        animation-delay: 1.8s;
      }
      .step-4 {
        left: 70%;
        animation-delay: 2.4s;
      }
      .step-5 {
        left: 90%;
        animation-delay: 3s;
      }

      @keyframes flyIn {
        0% {
          opacity: 0;
          transform: translate(-50%, -50%) scale(0.5);
        }
        70% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1.1);
        }
        100% {
          opacity: 1;
          transform: translate(-50%, -50%) scale(1);
        }
      }

      .process-icon {
        @apply relative w-16 h-16 mb-2;
      }
      .process-icon-outer {
        @apply absolute inset-0 rounded-full bg-white bg-opacity-10 border-2 border-white border-opacity-50;
        animation: pulse 2s infinite;
      }
      .process-icon-inner {
        @apply absolute inset-0 m-2 rounded-full bg-white bg-opacity-20 border border-white flex items-center justify-center z-10;
        transition: all 0.3s ease;
      }
      .process-step:hover .process-icon-inner {
        @apply bg-opacity-30 transform scale-110;
      }

      @keyframes pulse {
        0%, 100% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.05);
        }
      }

      .process-label {
        @apply text-white font-medium text-sm mt-2 whitespace-nowrap;
      }

      @media (max-width: 1023px) {
        .side-image {
          display: none;
        }
      }
    </style>

    <div class="flex min-h-screen items-center justify-center p-4 sm:p-6">
      <div
        class="flex w-full max-w-6xl bg-white rounded-xl shadow-2xl overflow-hidden animate__animated animate__fadeIn"
      >
        <!-- Side Image -->
        <div class="lg:block w-1/2 side-image">
          <div class="side-image-overlay">
            <div class="text-white text-center">
              <div class="w-full max-w-md mb-12 z-10 text-white text-center">
                <h1 class="text-4xl font-bold mb-2">The Software Engineer</h1>
                <p class="text-lg opacity-90">Streamline your development workflow</p>
              </div>

              <!-- Process animation -->
              <div class="process-container z-10">
                <!-- Process steps -->
                <div class="process-step step-1">
                  <div class="process-icon">
                    <div class="process-icon-outer"></div>
                    <div class="process-icon-inner">
                      <span class="text-xl">📋</span>
                    </div>
                  </div>
                  <span class="process-label">Requirement</span>
                </div>

                <div class="process-step step-2">
                  <div class="process-icon">
                    <div class="process-icon-outer"></div>
                    <div class="process-icon-inner">
                      <span class="text-xl">📝</span>
                    </div>
                  </div>
                  <span class="process-label">Planning</span>
                </div>

                <div class="process-step step-3">
                  <div class="process-icon">
                    <div class="process-icon-outer"></div>
                    <div class="process-icon-inner">
                      <span class="text-xl">💻</span>
                    </div>
                  </div>
                  <span class="process-label">Develop</span>
                </div>

                <div class="process-step step-4">
                  <div class="process-icon">
                    <div class="process-icon-outer"></div>
                    <div class="process-icon-inner">
                      <span class="text-xl">🔍</span>
                    </div>
                  </div>
                  <span class="process-label">Testing</span>
                </div>

                <div class="process-step step-5">
                  <div class="process-icon">
                    <div class="process-icon-outer"></div>
                    <div class="process-icon-inner">
                      <span class="text-xl">🚀</span>
                    </div>
                  </div>
                  <span class="process-label">Deliver</span>
                </div>
              </div>

              <div class="mt-12 text-white opacity-80 text-sm text-center max-w-md z-10">
                <p>
                  From concept to deployment - manage your entire software development
                  lifecycle in one place
                </p>
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
                  class="relative flex items-center justify-center w-24 h-24 bg-white rounded-2xl shadow-md tech-icon"
                >
                  <svg
                    width="48"
                    height="48"
                    viewBox="0 0 48 48"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                    style="color: #0d7ff2;"
                  >
                    <path
                      d="M8 8h6v6H8V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zM8 16h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 24h6v6H8v-6zm8 0h6v6h-6v-6zm16 0h6v6h-6v-6zM8 32h6v6H8v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 40h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6z"
                      fill="currentColor"
                    />
                    <path
                      d="M20 20h8v8h-8v-8z"
                      fill="currentColor"
                      opacity="0.6"
                    />
                  </svg>
                </div>
              </div>
            </div>
            <h1
              class="text-3xl font-bold text-[var(--text-primary)] mb-2"
            >
              The Software Engineer
            </h1>
            <p class="text-[var(--text-secondary)]">
              Streamline your development workflow
            </p>
          </div>

          <h2 class="text-2xl font-bold text-[var(--text-primary)] mb-1">
            Welcome back
          </h2>
          <p class="text-[var(--text-secondary)] mb-8">
            Please enter your credentials to access your account
          </p>

          <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="alert alert-${message.type} p-4 rounded-lg mb-6 <#if message.type = 'error'>bg-red-50 text-red-800 border border-red-200<#elseif message.type = 'success'>bg-green-50 text-green-800 border border-green-200<#else>bg-blue-50 text-blue-800 border border-blue-200</#if>">
              <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
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
                    style="padding-right: 2.5rem;"
                    aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"
                  />
                  <span class="password-toggle" id="togglePassword">
                    <svg
                      id="eyeOpen"
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
                    <svg
                      id="eyeClosed"
                      xmlns="http://www.w3.org/2000/svg"
                      fill="none"
                      viewBox="0 0 24 24"
                      stroke="currentColor"
                      style="display: none;"
                    >
                      <path
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"
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
    </#if>
</@layout.registrationLayout>
