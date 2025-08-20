<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <!DOCTYPE html>
        <html lang="en">
          <head>
            <meta charset="UTF-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1.0" />
            <link
              href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
              rel="stylesheet"
            />
            <link
              href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
              rel="stylesheet"
            />
            <style>
              /* Custom CSS for the login page */
              .bg-white { background-color: white !important; }
              .position-relative { position: relative !important; }
              .min-vh-100 { min-height: 100vh !important; }
              
              .left-content {
                position: fixed;
                left: 0;
                top: 0;
                width: 50%;
                height: 100vh;
                display: none;
              }
              
              @media (min-width: 992px) {
                .left-content { display: block; }
                .main-content { margin-left: 50%; width: 50%; }
              }
              
              .background-container {
                position: relative;
                width: 100%;
                height: 100%;
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
              }
              
              .bg-overlay {
                background: rgba(0, 0, 0, 0.4);
              }
              
              .carousel-indicator {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.5);
                transition: all 0.3s ease;
              }
              
              .carousel-indicator-active {
                width: 24px;
                height: 8px;
                border-radius: 4px;
                background-color: white;
                transition: all 0.3s ease;
              }
              
              .main-content {
                padding: 20px;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
              }
              
              .brand-font {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
              }
              
              .bg-light-custom {
                background-color: #f8f9fa !important;
              }
              
              .border-custom {
                border: 1px solid #dee2e6 !important;
              }
              
              .text-primary-custom {
                color: #0066cc !important;
              }
              
              .bg-primary-custom {
                background-color: #0066cc !important;
              }
              
              .text-muted-custom {
                color: #6c757d !important;
              }
              
              .btn-disabled {
                opacity: 0.6;
                cursor: not-allowed;
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
              }
              
              .social-icon:hover {
                background-color: #f8f9fa;
              }
              
              .social-icon img {
                width: 24px;
                height: 24px;
              }
              
              /* Keycloak error styling */
              .kc-input-error {
                border-color: #dc3545 !important;
              }
              
              .error-message {
                color: #dc3545;
                font-size: 0.875rem;
                margin-top: 0.25rem;
              }
            </style>
          </head>
          <body class="bg-white">
            <main class="position-relative min-vh-100">
              <!-- Left Content (Hidden on smaller screens) -->
              <div class="left-content">
                <div class="background-container">
                  <!-- Background Images - You'll need to add your images to the theme resources -->
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
                  <section class="promotional-section bg-overlay text-white rounded-3 p-4">
                    <header class="text-center mb-3">
                      <h3 class="fw-semibold fs-5 lh-base">
                        Discover your communication potential
                      </h3>
                    </header>
                    <p class="text-center mb-4 lh-sm small">
                      Tired of using non-privacy communication system? Customize your
                      organization chat and branding the way its suit you and your
                      business. We have all the parameters and functionalities you need
                      to push your business communication to the next level.
                    </p>
                    <div class="d-flex justify-content-center align-items-center gap-3">
                      <button
                        class="btn btn-link p-0 text-white"
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
                      <div class="d-flex align-items-center gap-2">
                        <div class="carousel-indicator-active" id="indicator-1"></div>
                        <div class="carousel-indicator" id="indicator-2"></div>
                        <div class="carousel-indicator" id="indicator-3"></div>
                      </div>
                      <button class="btn btn-link p-0 text-white" id="carousel-next" type="button">
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
                  </section>
                </div>
              </div>

              <!-- Main Content Area -->
              <section class="main-content">
                <div class="container-fluid h-100">
                  <!-- Header with Logo -->
                  <header
                    class="d-flex justify-content-center align-items-center mb-4"
                    style="margin-top: 100px"
                  >
                    <div class="d-flex align-items-center gap-2">
                      <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="logooo" />
                      <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">
                        NASD-Communication System
                      </h1>
                    </div>
                  </header>

                  <!-- Page Title -->
                  <div class="text-center mb-5">
                    <h2 class="fw-bold fs-1 text-dark">Login to your account</h2>
                  </div>

                  <!-- Login Form -->
                  <div id="kc-form">
                    <div id="kc-form-wrapper">
                      <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="mx-auto" style="max-width: 532px">
                          
                          <#if !usernameHidden??>
                            <div class="mb-4">
                              <label for="username" class="form-label fw-semibold fs-5">
                                <#if !realm.loginWithEmailAllowed>
                                  ${msg("username")}
                                <#elseif !realm.registrationEmailAsUsername>
                                  ${msg("usernameOrEmail")}
                                <#else>
                                  ${msg("email")}
                                </#if>
                              </label>
                              <input 
                                tabindex="2" 
                                id="username" 
                                class="form-control form-control-lg bg-light-custom border-custom <#if messagesPerField.existsError('username','password')>kc-input-error</#if>" 
                                name="username" 
                                value="${(login.username!'')}" 
                                type="text"
                                autofocus 
                                autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                dir="ltr"
                                placeholder="Enter your email"
                                style="height: 60px"
                                required
                              />
                              <#if messagesPerField.existsError('username','password')>
                                <div class="error-message">
                                  ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </div>
                              </#if>
                            </div>
                          </#if>

                          <div class="mb-4">
                            <label for="password" class="form-label fw-semibold fs-5">${msg("password")}</label>
                            <div class="input-container">
                              <input 
                                tabindex="3" 
                                id="password" 
                                class="form-control form-control-lg bg-light-custom border-custom <#if messagesPerField.existsError('username','password')>kc-input-error</#if>" 
                                name="password" 
                                type="password" 
                                autocomplete="current-password"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                placeholder="Enter your password"
                                style="height: 60px; padding-right: 50px"
                                required
                              />
                              <i class="bi bi-eye password-toggle" id="password-toggle"></i>
                            </div>
                            <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                              <div class="error-message">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                              </div>
                            </#if>
                          </div>

                          <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                            <#if realm.resetPasswordAllowed>
                              <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                                ${msg("doForgotPassword")}
                              </a>
                            <#else>
                              <span></span>
                            </#if>
                            
                            <#if realm.registrationAllowed && !registrationDisabled??>
                              <a tabindex="8" href="${url.registrationUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                                Create account
                              </a>
                            </#if>
                          </div>

                          <#if realm.rememberMe && !usernameHidden??>
                            <div class="mb-3">
                              <div class="form-check">
                                <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" class="form-check-input" <#if login.rememberMe??>checked</#if>>
                                <label class="form-check-label" for="rememberMe">
                                  ${msg("rememberMe")}
                                </label>
                              </div>
                            </div>
                          </#if>

                          <div class="text-center mb-4">
                            <small class="text-muted-custom">
                              By registering, you agree to ZAM's
                              <button type="button" class="btn btn-link text-primary-custom text-decoration-underline p-0 small">
                                Terms of Service
                              </button>
                              and
                              <button type="button" class="btn btn-link text-primary-custom text-decoration-underline p-0 small">
                                Privacy Policy
                              </button>
                            </small>
                          </div>

                          <div class="d-grid mb-4">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input 
                              tabindex="7" 
                              class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold" 
                              name="login" 
                              id="kc-login" 
                              type="submit" 
                              value="${msg("doLogIn")}"
                            />
                          </div>
                        </form>
                      </#if>
                    </div>
                  </div>

                  <!-- Social Media Icons -->
                  <#if realm.password && social?? && social.providers?has_content>
                    <div class="social-icons">
                      <#list social.providers as p>
                        <a href="${p.loginUrl}" class="social-icon" data-once-link data-disabled-class="disabled">
                          <#if p.iconClasses?has_content>
                            <i class="${p.iconClasses!}" aria-hidden="true"></i>
                          <#else>
                            <span>${p.displayName!}</span>
                          </#if>
                        </a>
                      </#list>
                    </div>
                  <#else>
                    <!-- Default social icons if no social providers configured -->
                    <div class="social-icons">
                      <div class="social-icon">
                        <img src="${url.resourcesPath}/img/google.png" alt="google logo" />
                      </div>
                      <div class="social-icon">
                        <img src="${url.resourcesPath}/img/facebook.png" alt="facebook logo" />
                      </div>
                      <div class="social-icon">
                        <img src="${url.resourcesPath}/img/apple.png" alt="apple logo" />
                      </div>
                    </div>
                  </#if>

                  <!-- Footer -->
                  <footer class="text-center">
                    <small class="text-muted-custom">© 2024 NASD Plc. All rights reserved</small>
                  </footer>
                </div>
              </section>
            </main>

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
            <script>
              // Carousel functionality
              let currentSlide = 1;
              const totalSlides = 3;
              let autoSlideInterval;

              function showSlide(slideNumber) {
                // Hide all images
                for (let i = 1; i <= totalSlides; i++) {
                  const img = document.getElementById(`carousel-img-${i}`);
                  const indicator = document.getElementById(`indicator-${i}`);
                  if (img) img.classList.remove("active");
                  if (indicator) indicator.className = "carousel-indicator";
                }

                // Show current image
                const currentImg = document.getElementById(`carousel-img-${slideNumber}`);
                const currentIndicator = document.getElementById(`indicator-${slideNumber}`);
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
                autoSlideInterval = setInterval(() => {
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

              // Event listeners for carousel
              document.addEventListener('DOMContentLoaded', function() {
                const nextBtn = document.getElementById("carousel-next");
                const prevBtn = document.getElementById("carousel-prev");
                
                if (nextBtn) {
                  nextBtn.addEventListener("click", () => {
                    stopAutoSlide();
                    nextSlide();
                    startAutoSlide();
                  });
                }

                if (prevBtn) {
                  prevBtn.addEventListener("click", () => {
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
                  passwordToggle.addEventListener("click", () => {
                    if (passwordInput.type === "password") {
                      passwordInput.type = "text";
                      passwordToggle.classList.remove("bi-eye");
                      passwordToggle.classList.add("bi-eye-slash");
                    } else {
                      passwordInput.type = "password";
                      passwordToggle.classList.remove("bi-eye-slash");
                      passwordToggle.classList.add("bi-eye");
                    }
                  });
                }
              });
            </script>
            
            <@passkeys.conditionalUIData />
          </body>
        </html>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
