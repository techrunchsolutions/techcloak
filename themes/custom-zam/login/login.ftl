<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>
          body {
            background-color: white !important;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          }

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

          html, body {
            overflow-x: hidden;
          }

          @media (min-width: 768px) {
            .login-pf-page .card-pf {
              padding: 0;
            }
          }

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
            padding: 40px;
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
            transition: opacity 0.5s ease;
          }

          .carousel-slide-active {
            opacity: 1;
          }

          .carousel-overlay {
            position: absolute;
            bottom: 40px;
            left: 40px;
            right: 40px;
            z-index: 3;
            backdrop-filter: blur(10px);
            background: rgba(0, 0, 0, 0.4);
            border-radius: 12px;
            padding: 24px;
            color: white;
          }

          .carousel-content {
            text-align: center;
            margin-bottom: 24px;
          }

          .carousel-title {
            font-weight: 600;
            font-size: 1.25rem;
            margin-bottom: 16px;
          }

          .carousel-description {
            font-size: 0.9rem;
            line-height: 1.4;
          }

          .carousel-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 16px;
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
            gap: 8px;
          }

          .carousel-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.5);
            transition: all 0.3s ease;
            display: inline-block;
          }

          .carousel-indicator-active {
            width: 24px;
            height: 8px;
            border-radius: 4px;
            background-color: white;
          }

          .decorative-element {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
          }

          .decorative-element-red {
            top: 20%;
            right: 10%;
            z-index: 2;
          }

          .decorative-element-large {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 10%;
          }

          .decorative-element-medium {
            width: 100px;
            height: 100px;
            bottom: 30%;
            right: 20%;
          }

          .decorative-element-small {
            width: 60px;
            height: 60px;
            bottom: 10%;
            left: 30%;
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

          .page-header {
            text-align: center;
            margin-bottom: 48px;
          }

          .page-title {
            font-weight: bold;
            font-size: 2.5rem;
            color: #333;
            margin: 0;
          }

          .auth-form {
            max-width: 532px;
            margin: 0 auto;
          }

          .form-field {
            margin-bottom: 24px;
          }

          .form-label {
            font-weight: 600;
            font-size: 1.25rem;
            color: #333;
            margin-bottom: 8px;
            display: block;
          }

          .form-input {
            width: 100%;
            height: 60px;
            padding: 16px;
            background-color: #f8f9fa;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
          }

          .form-input:focus {
            outline: none;
            border-color: #0066cc;
            box-shadow: 0 0 0 3px rgba(0, 102, 204, 0.1);
          }

          .form-input-error {
            border-color: #dc3545;
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
            color: #6c757d;
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

          .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 16px;
          }

          .link-button {
            background: none;
            border: none;
            color: #0066cc;
            text-decoration: underline;
            cursor: pointer;
            padding: 0;
            font-size: 1rem;
          }

          .checkbox-field {
            margin-bottom: 16px;
          }

          .checkbox-field input {
            margin-right: 8px;
          }

          .terms-text {
            text-align: center;
            margin-bottom: 24px;
            color: #6c757d;
            font-size: 0.9rem;
          }

          .btn-primary {
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

          .btn-primary:hover:not(:disabled) {
            background-color: #0052a3;
          }

          .btn-primary:disabled {
            opacity: 0.6;
            cursor: not-allowed;
          }

          .error-message {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 4px;
          }

          .footer-text {
            text-align: center;
            color: #6c757d;
            font-size: 0.9rem;
          }
        </style>

        <div class="auth-container">
          <div class="auth-sidebar">
            <div class="carousel-container">
              <img src="${url.resourcesPath}/img/car1.png" alt="" class="carousel-slide carousel-slide-active" id="slide-1" />
              <img src="${url.resourcesPath}/img/car2.png" alt="" class="carousel-slide" id="slide-2" />
              <img src="${url.resourcesPath}/img/car3.png" alt="" class="carousel-slide" id="slide-3" />

              <svg class="decorative-element decorative-element-red" width="120" height="120" viewBox="0 0 179 95" fill="none" xmlns="http://www.w3.org/2000/svg">
                <ellipse cx="89.5" cy="86" rx="89.5" ry="86" fill="#EC232A"></ellipse>
              </svg>
              <div class="decorative-element decorative-element-large"></div>
              <div class="decorative-element decorative-element-medium"></div>
              <div class="decorative-element decorative-element-small"></div>

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
                    <div class="carousel-indicator carousel-indicator-active" id="indicator-1"></div>
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

          <main class="auth-main">
            <header class="brand-header">
              <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD-Communication System</h1>
              </div>
            </header>

            <div class="page-header">
              <h2 class="page-title">Login to your account</h2>
            </div>

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
                          class="form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
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
                          class="form-input <#if messagesPerField.existsError('username','password')>form-input-error</#if>"
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

            <footer class="footer-text">
              © 2024 NASD Plc. All rights reserved
            </footer>
          </main>
        </div>

        <script>
          var currentSlide = 1;
          var totalSlides = 3;
          var autoSlideInterval;

          function showSlide(slideNumber) {
            for (var i = 1; i <= totalSlides; i++) {
              var slide = document.getElementById('slide-' + i);
              var indicator = document.getElementById('indicator-' + i);

              if (slide) {
                if (i === slideNumber) {
                  slide.classList.add('carousel-slide-active');
                } else {
                  slide.classList.remove('carousel-slide-active');
                }
              }

              if (indicator) {
                if (i === slideNumber) {
                  indicator.classList.add('carousel-indicator-active');
                } else {
                  indicator.classList.remove('carousel-indicator-active');
                }
              }
            }

            var prevBtn = document.getElementById('prev-btn');
            var nextBtn = document.getElementById('next-btn');

            if (prevBtn) prevBtn.style.display = slideNumber === 1 ? 'none' : 'block';
            if (nextBtn) nextBtn.style.display = slideNumber === totalSlides ? 'none' : 'block';
          }

          function nextSlide() {
            if (currentSlide < totalSlides) {
              currentSlide++;
              showSlide(currentSlide);
            }
          }

          function prevSlide() {
            if (currentSlide > 1) {
              currentSlide--;
              showSlide(currentSlide);
            }
          }

          function startAutoSlide() {
            autoSlideInterval = setInterval(function() {
              if (currentSlide < totalSlides) {
                nextSlide();
              } else {
                currentSlide = 1;
                showSlide(currentSlide);
              }
            }, 5000);
          }

          function stopAutoSlide() {
            if (autoSlideInterval) {
              clearInterval(autoSlideInterval);
            }
          }

          function togglePassword() {
            var passwordInput = document.getElementById('password');
            var passwordToggle = document.getElementById('password-toggle');

            if (passwordInput && passwordToggle) {
              if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                passwordToggle.innerHTML = '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/><path d="M3 3l18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/></svg>';
              } else {
                passwordInput.type = 'password';
                passwordToggle.innerHTML = '<svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/></svg>';
              }
            }
          }

          document.addEventListener('DOMContentLoaded', function() {
            var nextBtn = document.getElementById('next-btn');
            var prevBtn = document.getElementById('prev-btn');
            var passwordToggle = document.getElementById('password-toggle');

            if (nextBtn) {
              nextBtn.addEventListener('click', function() {
                stopAutoSlide();
                nextSlide();
                startAutoSlide();
              });
            }

            if (prevBtn) {
              prevBtn.addEventListener('click', function() {
                stopAutoSlide();
                prevSlide();
                startAutoSlide();
              });
            }

            if (passwordToggle) {
              passwordToggle.addEventListener('click', togglePassword);
            }

            startAutoSlide();
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
