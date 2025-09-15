<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
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

          /* ===== RESET & BASE STYLES ===== */
          body {
            background-color: white !important;
            font-family: var(--font-family);
          }

          html, body {
            overflow-x: hidden;
          }

          /* ===== KEYCLOAK OVERRIDES ===== */
          .login-pf-page-header,
          .login-pf-header,
          h1#kc-page-title,
          .login-pf-signup,
          #kc-info-wrapper,
          #kc-header,
          #kc-page-title,
          .login-pf-header {
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

          .card-pf {
            max-width: 15000px;
            border-top: none;
          }

          .kc-login #kc-form,
          .kc-login #kc-form-wrapper {
            width: 100% !important;
          }

          @media (min-width: 768px) {
            .login-pf-page .card-pf {
              padding: 0;
            }
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

          .carousel-overlay {
            position: absolute;
            bottom: var(--spacing-xl);
            left: var(--spacing-xl);
            right: var(--spacing-xl);
            z-index: 3;
            backdrop-filter: blur(10px);
            background: rgba(0, 0, 0, 0.4);
            border-radius: 12px;
            padding: var(--spacing-md);
            color: white;
          }

          .carousel-content {
            text-align: center;
            margin-bottom: var(--spacing-md);
          }

          .carousel-title {
            font-weight: 600;
            font-size: 1.25rem;
            margin-bottom: var(--spacing-sm);
          }

          .carousel-description {
            font-size: 0.9rem;
            line-height: 1.4;
          }

          .carousel-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: var(--spacing-sm);
          }

          .carousel-button {
            background: none;
            border: none;
            color: white;
            cursor: pointer;
            padding: 4px;
            display: flex;
            align-items: center;
            justify-content: center;
          }

          .carousel-indicators {
            display: flex;
            align-items: center;
            gap: var(--spacing-xs);
          }

          .carousel-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            transition: all var(--transition);
            display: inline-block;
          }

          .carousel-indicator--active {
            width: 24px;
            height: 8px;
            border-radius: 4px;
            background-color: white;
          }

          /* ===== DECORATIVE ELEMENTS ===== */
          .decorative-element {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
          }

          .decorative-element--red {
            top: 20%;
            right: 10%;
            z-index: 2;
          }

          .decorative-element--large {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 10%;
          }

          .decorative-element--medium {
            width: 100px;
            height: 100px;
            bottom: 30%;
            right: 20%;
          }

          .decorative-element--small {
            width: 60px;
            height: 60px;
            bottom: 10%;
            left: 30%;
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

          /* ===== FORM ACTIONS ===== */
          .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: var(--spacing-md);
            flex-wrap: wrap;
            gap: var(--spacing-sm);
          }

          .link-button {
            background: none;
            border: none;
            color: var(--primary-color);
            text-decoration: underline;
            cursor: pointer;
            padding: 0;
            font-size: 1rem;
          }

          .checkbox-field {
            margin-bottom: var(--spacing-sm);
          }

          .checkbox-field input {
            margin-right: var(--spacing-xs);
          }

          .terms-text {
            text-align: center;
            margin-bottom: var(--spacing-md);
            color: var(--text-secondary);
            font-size: 0.9rem;
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
          }

          /* ===== UTILITY COMPONENTS ===== */
          .error-message {
            color: var(--error-color);
            font-size: 0.875rem;
            margin-top: 4px;
          }

          .footer-text {
            text-align: center;
            color: var(--text-secondary);
            font-size: 0.9rem;
          }
        </style>

        <div class="auth-container">
          <!-- Sidebar with Carousel -->
          <div class="auth-sidebar">
            <div class="carousel-container">
              <!-- Carousel Images -->
              <img src="${url.resourcesPath}/img/car1.png" alt="" class="carousel-slide carousel-slide--active" id="slide-1" />
              <img src="${url.resourcesPath}/img/car2.png" alt="" class="carousel-slide" id="slide-2" />
              <img src="${url.resourcesPath}/img/car3.png" alt="" class="carousel-slide" id="slide-3" />

              <!-- Decorative Elements -->
              <svg class="decorative-element decorative-element--red" width="120" height="120" viewBox="0 0 179 95" fill="none" xmlns="http://www.w3.org/2000/svg">
                <ellipse cx="89.5" cy="86" rx="89.5" ry="86" fill="#EC232A"></ellipse>
              </svg>
              <div class="decorative-element decorative-element--large"></div>
              <div class="decorative-element decorative-element--medium"></div>
              <div class="decorative-element decorative-element--small"></div>

              <!-- Carousel Overlay -->
              <div class="carousel-overlay">
                <div class="carousel-content">
                  <h3 class="carousel-title">Discover your communication potential</h3>
                  <p class="carousel-description">
                    Tired of using non-privacy communication system? Customize your
                    organization chat and branding the way its suit you and your
                    business. We have all the parameters and functionalities you need
                    to push your business communication to the next level.
                  </p>
                </div>
                <div class="carousel-controls">
                  <button class="carousel-button" id="prev-btn" style="display: none" type="button">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(90deg)">
                      <path d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z" fill="white"></path>
                    </svg>
                  </button>
                  <div class="carousel-indicators">
                    <div class="carousel-indicator carousel-indicator--active" id="indicator-1"></div>
                    <div class="carousel-indicator" id="indicator-2"></div>
                    <div class="carousel-indicator" id="indicator-3"></div>
                  </div>
                  <button class="carousel-button" id="next-btn" type="button">
                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(-90deg)">
                      <path d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z" fill="white"></path>
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Main Content -->
          <main class="auth-main">
            <!-- Brand Header -->
            <header class="brand-header">
              <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD-Communication System</h1>
              </div>
            </header>

            <!-- Page Title -->
            <div class="page-header">
              <h2 class="page-title">Login to your account</h2>
            </div>

            <!-- Login Form -->
            <div id="kc-form">
              <div id="kc-form-wrapper">
                <#if realm.password>
                  <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="auth-form">

                    <#if !usernameHidden??>
                      <div class="form-field">
                        <label for="username" class="form-label">
                          <#if !realm.loginWithEmailAllowed>
                            ${msg("username")}
                          <#elseif !realm.registrationEmailAsUsername>
                            ${msg("usernameOrEmail")}
                          <#else>
                            Email
                          </#if>
                        </label>
                        <input
                          tabindex="2"
                          id="username"
                          class="form-input <#if messagesPerField.existsError('username','password')>form-input--error</#if>"
                          name="username"
                          value="${(login.username!'')}"
                          type="text"
                          autofocus
                          autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          dir="ltr"
                          placeholder="Enter your email"
                          required
                        />
                        <#if messagesPerField.existsError('username','password')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                          </div>
                        </#if>
                      </div>
                    </#if>

                    <div class="form-field">
                      <label for="password" class="form-label">Password</label>
                      <div class="input-wrapper">
                        <input
                          tabindex="3"
                          id="password"
                          class="form-input <#if messagesPerField.existsError('username','password')>form-input--error</#if>"
                          name="password"
                          type="password"
                          autocomplete="current-password"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          placeholder="Enter your password"
                          style="padding-right: 50px;"
                          required
                        />
                        <span class="input-toggle" id="password-toggle">
                          <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                          </svg>
                        </span>
                      </div>
                      <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <div class="error-message">
                          ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                      </#if>
                    </div>

                    <div class="form-actions">
                      <#if realm.resetPasswordAllowed>
                        <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="link-button">
                          Forgot password?
                        </a>
                      <#else>
                        <span></span>
                      </#if>

                      <#if realm.registrationAllowed && !registrationDisabled??>
                        <a tabindex="8" href="${url.registrationUrl}" class="link-button">
                          Create account
                        </a>
                      </#if>
                    </div>

                    <#if realm.rememberMe && !usernameHidden??>
                      <div class="checkbox-field">
                        <label>
                          <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                          ${msg("rememberMe")}
                        </label>
                      </div>
                    </#if>

                    <div class="terms-text">
                      By registering, you agree to ZAM's
                      <button type="button" class="link-button" style="font-size: 0.9rem;">Terms of Service</button>
                      and
                      <button type="button" class="link-button" style="font-size: 0.9rem;">Privacy Policy</button>
                    </div>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button tabindex="7" class="btn-primary" name="login" id="kc-login" type="submit">
                      Sign in
                    </button>
                  </form>
                </#if>
              </div>
            </div>

            <!-- Footer -->
            <footer class="footer-text">
              © 2024 NASD Plc. All rights reserved
            </footer>
          </main>
        </div>

        <script>
          // ===== CAROUSEL MODULE =====
          const CarouselManager = {
            currentSlide: 1,
            totalSlides: 3,
            autoSlideInterval: null,

            init() {
              this.bindEvents();
              this.startAutoSlide();
            },

            bindEvents() {
              const nextBtn = document.getElementById('next-btn');
              const prevBtn = document.getElementById('prev-btn');

              if (nextBtn) {
                nextBtn.addEventListener('click', () => {
                  this.stopAutoSlide();
                  this.nextSlide();
                  this.startAutoSlide();
                });
              }

              if (prevBtn) {
                prevBtn.addEventListener('click', () => {
                  this.stopAutoSlide();
                  this.prevSlide();
                  this.startAutoSlide();
                });
              }
            },

            showSlide(slideNumber) {
              // Update slides
              for (let i = 1; i <= this.totalSlides; i++) {
                const slide = document.getElementById(`slide-${i}`);
                const indicator = document.getElementById(`indicator-${i}`);

                if (slide) {
                  slide.classList.toggle('carousel-slide--active', i === slideNumber);
                }

                if (indicator) {
                  indicator.classList.toggle('carousel-indicator--active', i === slideNumber);
                }
              }

              // Update navigation buttons
              const prevBtn = document.getElementById('prev-btn');
              const nextBtn = document.getElementById('next-btn');

              if (prevBtn) prevBtn.style.display = slideNumber === 1 ? 'none' : 'block';
              if (nextBtn) nextBtn.style.display = slideNumber === this.totalSlides ? 'none' : 'block';
            },

            nextSlide() {
              if (this.currentSlide < this.totalSlides) {
                this.currentSlide++;
                this.showSlide(this.currentSlide);
              }
            },

            prevSlide() {
              if (this.currentSlide > 1) {
                this.currentSlide--;
                this.showSlide(this.currentSlide);
              }
            },

            startAutoSlide() {
              this.autoSlideInterval = setInterval(() => {
                if (this.currentSlide < this.totalSlides) {
                  this.nextSlide();
                } else {
                  this.currentSlide = 1;
                  this.showSlide(this.currentSlide);
                }
              }, 5000);
            },

            stopAutoSlide() {
              if (this.autoSlideInterval) {
                clearInterval(this.autoSlideInterval);
              }
            }
          };

          // ===== PASSWORD TOGGLE MODULE =====
          const PasswordToggle = {
            init() {
              this.setupToggle('password', 'password-toggle');
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
            CarouselManager.init();
            PasswordToggle.init();
          });
        </script>

        <@passkeys.conditionalUIData />
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a data-once-link data-disabled-class="${properties.kcFormSocialAccountListButtonDisabledClass!}" id="social-${p.alias}"
                                    class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
