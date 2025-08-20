<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>
          /* Custom CSS for the login page */
          body { 
            background-color: white !important; 
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
          }
          
          .login-container {
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
          
          .decorative-ellipse-red {
            position: absolute;
            top: 20%;
            right: 10%;
            z-index: 2;
          }
          
          .decorative-ellipse {
            position: absolute;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.1);
          }
          
          .decorative-ellipse-gray-large {
            width: 200px;
            height: 200px;
            top: 10%;
            left: 10%;
          }
          
          .decorative-ellipse-gray-medium {
            width: 100px;
            height: 100px;
            bottom: 30%;
            right: 20%;
          }
          
          .decorative-ellipse-gray-small {
            width: 60px;
            height: 60px;
            bottom: 10%;
            left: 30%;
          }
          
          .promotional-section {
            position: absolute;
            bottom: 40px;
            left: 40px;
            right: 40px;
            z-index: 3;
            backdrop-filter: blur(10px);
            background: rgba(0, 0, 0, 0.4) !important;
            border-radius: 12px;
            padding: 24px;
            color: white;
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
            transition: all 0.3s ease;
            display: inline-block;
          }
          
          .main-content {
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 100vh;
          }
          
          .brand-header {
            text-align: center;
            margin-bottom: 32px;
            margin-top: 100px;
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
          
          .login-form {
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
            font-size: 1.2rem;
          }
          
          .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 24px;
            flex-wrap: wrap;
            gap: 16px;
          }
          
          .btn-link-custom {
            background: none;
            border: none;
            color: #0066cc;
            text-decoration: underline;
            cursor: pointer;
            padding: 0;
            font-size: 1rem;
          }
          
          .remember-me {
            margin-bottom: 16px;
          }
          
          .remember-me input {
            margin-right: 8px;
          }
          
          .terms-text {
            text-align: center;
            margin-bottom: 24px;
            color: #6c757d;
            font-size: 0.9rem;
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
          }
          
          .social-icons {
            display: flex;
            justify-content: center;
            gap: 16px;
            margin: 32px 0;
          }
          
          .social-icon {
            width: 48px;
            height: 48px;
            border: 1px solid #dee2e6;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
          }
          
          .social-icon:hover {
            background-color: #f8f9fa;
          }
          
          .social-icon img {
            width: 24px;
            height: 24px;
          }
          
          .footer-text {
            text-align: center;
            color: #6c757d;
            font-size: 0.9rem;
          }
          
          .error-message {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 4px;
          }
          
          .carousel-nav {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
          }
          
          .carousel-btn {
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
          
          /* Bootstrap integration */
          .kc-login #kc-form {
            width: 100% !important;
          }
          
          .kc-login #kc-form-wrapper {
            width: 100% !important;
          }
        </style>

        <div class="login-container">
          <!-- Left Content (Hidden on smaller screens) -->
          <div class="left-content">
            <div class="background-container">
              <!-- Background Images -->
              <img
                src="${url.resourcesPath}/img/car1.png"
                alt=""
                class="carousel-image active"
                id="carousel-img-1"
              />
              <img
                src="${url.resourcesPath}/img/car2.png"
                alt=""
                class="carousel-image"
                id="carousel-img-2"
              />
              <img
                src="${url.resourcesPath}/img/car3.png"
                alt=""
                class="carousel-image"
                id="carousel-img-3"
              />

              <!-- Decorative Elements -->
              <svg
                class="decorative-ellipse-red"
                width="120"
                height="120"
                viewBox="0 0 179 95"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <ellipse
                  cx="89.5"
                  cy="86"
                  rx="89.5"
                  ry="86"
                  fill="#EC232A"
                ></ellipse>
              </svg>

              <div class="decorative-ellipse decorative-ellipse-gray-large"></div>
              <div class="decorative-ellipse decorative-ellipse-gray-medium"></div>
              <div class="decorative-ellipse decorative-ellipse-gray-small"></div>

              <!-- Promotional Section -->
              <div class="promotional-section">
                <h3 style="font-weight: 600; font-size: 1.25rem; text-align: center; margin-bottom: 16px;">
                  Discover your communication potential
                </h3>
                <p style="text-align: center; margin-bottom: 24px; font-size: 0.9rem; line-height: 1.4;">
                  Tired of using non-privacy communication system? Customize your
                  organization chat and branding the way its suit you and your
                  business. We have all the parameters and functionalities you need
                  to push your business communication to the next level.
                </p>
                <div class="carousel-nav">
                  <button
                    class="carousel-btn"
                    id="carousel-prev"
                    style="display: none"
                    type="button"
                  >
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                      style="transform: rotate(90deg)"
                    >
                      <path
                        d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z"
                        fill="white"
                      ></path>
                    </svg>
                  </button>
                  <div class="carousel-indicators">
                    <div class="carousel-indicator-active" id="indicator-1"></div>
                    <div class="carousel-indicator" id="indicator-2"></div>
                    <div class="carousel-indicator" id="indicator-3"></div>
                  </div>
                  <button class="carousel-btn" id="carousel-next" type="button">
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                      style="transform: rotate(-90deg)"
                    >
                      <path
                        d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z"
                        fill="white"
                      ></path>
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Main Content Area -->
          <div class="main-content">
            <!-- Header with Logo -->
            <div class="brand-header">
              <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD-Communication System</h1>
              </div>
            </div>

            <!-- Page Title -->
            <div class="page-title">
              <h2>Login to your account</h2>
            </div>

            <!-- Keycloak Login Form -->
            <div id="kc-form">
              <div id="kc-form-wrapper">
                <#if realm.password>
                  <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="login-form">
                    
                    <#if !usernameHidden??>
                      <div class="form-group">
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
                          class="form-control-custom <#if messagesPerField.existsError('username','password')>error</#if>" 
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

                    <div class="form-group">
                      <label for="password" class="form-label">Password</label>
                      <div class="input-container">
                        <input 
                          tabindex="3" 
                          id="password" 
                          class="form-control-custom <#if messagesPerField.existsError('username','password')>error</#if>" 
                          name="password" 
                          type="password" 
                          autocomplete="current-password"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          placeholder="Enter your password"
                          style="padding-right: 50px;"
                          required
                        />
                        <span class="password-toggle" id="password-toggle">👁</span>
                      </div>
                      <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <div class="error-message">
                          ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                      </#if>
                    </div>

                    <div class="form-actions">
                      <#if realm.resetPasswordAllowed>
                        <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="btn-link-custom">
                          Forgot password?
                        </a>
                      <#else>
                        <span></span>
                      </#if>
                      
                      <#if realm.registrationAllowed && !registrationDisabled??>
                        <a tabindex="8" href="${url.registrationUrl}" class="btn-link-custom">
                          Create account
                        </a>
                      </#if>
                    </div>

                    <#if realm.rememberMe && !usernameHidden??>
                      <div class="remember-me">
                        <label>
                          <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                          ${msg("rememberMe")}
                        </label>
                      </div>
                    </#if>

                    <div class="terms-text">
                      By registering, you agree to ZAM's
                      <button type="button" class="btn-link-custom" style="font-size: 0.9rem;">Terms of Service</button>
                      and
                      <button type="button" class="btn-link-custom" style="font-size: 0.9rem;">Privacy Policy</button>
                    </div>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button 
                      tabindex="7" 
                      class="btn-primary-custom" 
                      name="login" 
                      id="kc-login" 
                      type="submit"
                    >
                      Sign in
                    </button>
                  </form>
                </#if>
              </div>
            </div>

            <!-- Social Media Icons -->
            <#if realm.password && social?? && social.providers?has_content>
              <div class="social-icons">
                <#list social.providers as p>
                  <a href="${p.loginUrl}" class="social-icon" data-once-link>
                    <#if p.iconClasses?has_content>
                      <i class="${p.iconClasses!}" aria-hidden="true"></i>
                    <#else>
                      <span style="font-size: 12px;">${p.displayName!}</span>
                    </#if>
                  </a>
                </#list>
              </div>
            <#else>
              <!-- Default social icons if no social providers configured -->
              <div class="social-icons">
                <div class="social-icon">
                  <img src="${url.resourcesPath}/img/google.png" alt="Google" />
                </div>
                <div class="social-icon">
                  <img src="${url.resourcesPath}/img/facebook.png" alt="Facebook" />
                </div>
                <div class="social-icon">
                  <img src="${url.resourcesPath}/img/apple.png" alt="Apple" />
                </div>
              </div>
            </#if>

            <!-- Footer -->
            <div class="footer-text">
              © 2024 NASD Plc. All rights reserved
            </div>
          </div>
        </div>

        <script>
          // Carousel functionality
          let currentSlide = 1;
          const totalSlides = 3;
          let autoSlideInterval;

          function showSlide(slideNumber) {
            // Hide all images
            for (let i = 1; i <= totalSlides; i++) {
              const img = document.getElementById('carousel-img-' + i);
              const indicator = document.getElementById('indicator-' + i);
              if (img) img.classList.remove("active");
              if (indicator) indicator.className = "carousel-indicator";
            }

            // Show current image
            const currentImg = document.getElementById('carousel-img-' + slideNumber);
            const currentIndicator = document.getElementById('indicator-' + slideNumber);
            if (currentImg) currentImg.classList.add("active");
            if (currentIndicator) currentIndicator.className = "carousel-indicator-active";

            // Update navigation buttons
            const prevBtn = document.getElementById("carousel-prev");
            const nextBtn = document.getElementById("carousel-next");
            if (prevBtn) prevBtn.style.display = slideNumber === 1 ? "none" : "block";
            if (nextBtn) nextBtn.style.display = slideNumber === totalSlides ? "none" : "block";
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

          // Initialize when DOM is ready
          document.addEventListener('DOMContentLoaded', function() {
            // Event listeners for carousel
            const nextBtn = document.getElementById("carousel-next");
            const prevBtn = document.getElementById("carousel-prev");
            
            if (nextBtn) {
              nextBtn.addEventListener("click", function() {
                stopAutoSlide();
                nextSlide();
                startAutoSlide();
              });
            }

            if (prevBtn) {
              prevBtn.addEventListener("click", function() {
                stopAutoSlide();
                prevSlide();
                startAutoSlide();
              });
            }

            // Start auto-slide
            startAutoSlide();

            // Password toggle functionality
            const passwordToggle = document.getElementById("password-toggle");
            const passwordInput = document.getElementById("password");
            
            if (passwordToggle && passwordInput) {
              passwordToggle.addEventListener("click", function() {
                if (passwordInput.type === "password") {
                  passwordInput.type = "text";
                  passwordToggle.textContent = "🙈";
                } else {
                  passwordInput.type = "password";
                  passwordToggle.textContent = "👁";
                }
              });
            }
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
