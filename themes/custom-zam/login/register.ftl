<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <title>Sign Up - NASD ZAM</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet" />
        <style>
            /* Custom Styles for NASD ZAM */
                :root {
                    --primary-red: #ec232a;
                    --light-gray: #f8f9fa;
                    --border-gray: #dee2e6;
                    --text-muted: #6c757d;
                }

                body {
                    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
                    background-color: white;
                }

                .min-vh-100 {
                    min-height: 100vh;
                }

                .position-relative {
                    position: relative;
                }

                /* Left Content Styles */
                .left-content {
                    position: fixed;
                    top: 0;
                    left: 0;
                    width: 50%;
                    height: 100vh;
                    z-index: 1;
                }

                @media (max-width: 991.98px) {
                    .left-content {
                        display: none;
                    }
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
                    background-color: rgba(108, 117, 125, 0.1);
                }

                .decorative-ellipse-gray-large {
                    width: 200px;
                    height: 200px;
                    top: 10%;
                    left: 5%;
                }

                .decorative-ellipse-gray-medium {
                    width: 120px;
                    height: 120px;
                    bottom: 30%;
                    right: 15%;
                }

                .decorative-ellipse-gray-small {
                    width: 80px;
                    height: 80px;
                    bottom: 10%;
                    left: 10%;
                }

                .promotional-section {
                    position: absolute;
                    bottom: 5%;
                    left: 5%;
                    right: 5%;
                    z-index: 3;
                    background: rgba(0, 0, 0, 0.7);
                    backdrop-filter: blur(10px);
                }

                .bg-overlay {
                    background: rgba(0, 0, 0, 0.7) !important;
                }

                .carousel-indicator {
                    width: 8px;
                    height: 8px;
                    border-radius: 50%;
                    background-color: rgba(255, 255, 255, 0.5);
                }

                .carousel-indicator-active {
                    width: 8px;
                    height: 8px;
                    border-radius: 50%;
                    background-color: white;
                }

                /* Main Content Styles */
                .main-content {
                    margin-left: 50%;
                    width: 50%;
                    min-height: 100vh;
                    padding: 0 2rem;
                    display: flex;
                    flex-direction: column;
                    justify-content: center;
                }

                @media (max-width: 991.98px) {
                    .main-content {
                        margin-left: 0;
                        width: 100%;
                        padding: 0 1rem;
                    }
                }

                .brand-font {
                    font-weight: bold;
                }

                .bg-primary-custom {
                    background-color: var(--primary-red) !important;
                }

                .text-primary-custom {
                    color: var(--primary-red) !important;
                }

                .bg-light-custom {
                    background-color: var(--light-gray);
                }

                .border-custom {
                    border: 1px solid var(--border-gray);
                }

                .text-muted-custom {
                    color: var(--text-muted);
                }

                .form-control:focus {
                    border-color: var(--primary-red);
                    box-shadow: 0 0 0 0.25rem rgba(236, 35, 42, 0.25);
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
                    color: var(--text-muted);
                    z-index: 5;
                }

                .social-icons {
                    display: flex;
                    justify-content: center;
                    gap: 1rem;
                    margin: 2rem 0;
                }

                .social-icon {
                    width: 50px;
                    height: 50px;
                    border-radius: 50%;
                    background-color: var(--light-gray);
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                .social-icon:hover {
                    background-color: var(--border-gray);
                }

                .social-icon img {
                    width: 24px;
                    height: 24px;
                }

                .error-message {
                    display: none;
                }

                .error-message.show {
                    display: block;
                }

                /* Keycloak specific styles */
                .kc-form-group {
                    margin-bottom: 1.5rem;
                }

                .alert {
                    margin-bottom: 1rem;
                }
        </style>
    <#elseif section = "form">
        
        <!-- Left-side content -->
        <div class="left-content">
            <div class="background-container">
                        <!-- Background Images -->
                        <img src="${url.resourcesPath}/img/car4.png" alt="" class="carousel-image active" id="carousel-img-1" />
                        <img src="${url.resourcesPath}/img/car5.png" alt="" class="carousel-image" id="carousel-img-2" />
                        <img src="${url.resourcesPath}/img/car6.png" alt="" class="carousel-image" id="carousel-img-3" />

                        <!-- Decorative Elements -->
                        <svg class="decorative-ellipse-red" width="120" height="120" viewBox="0 0 179 95" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <ellipse cx="89.5" cy="86" rx="89.5" ry="86" fill="#EC232A"></ellipse>
                        </svg>

                        <div class="decorative-ellipse decorative-ellipse-gray-large"></div>
                        <div class="decorative-ellipse decorative-ellipse-gray-medium"></div>
                        <div class="decorative-ellipse decorative-ellipse-gray-small"></div>

                        <!-- Promotional Section -->
                        <section class="promotional-section bg-overlay text-white rounded-3 p-4">
                            <header class="text-center mb-3">
                                <h3 class="fw-semibold fs-5 lh-base">Discover your communication potential</h3>
                            </header>
                            <p class="text-center mb-4 lh-sm small">
                                Tired of using non-privacy communication system? Customize your organization chat and branding the way its suit you and your business. We have all the parameters and functionalities you need to push your business communication to the next level.
                            </p>
                            <div class="d-flex justify-content-center align-items-center gap-3">
                                <button class="btn btn-link p-0 text-white" id="carousel-prev" style="display: none">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(90deg)">
                                        <path d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z" fill="white"></path>
                                    </svg>
                                </button>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="carousel-indicator-active" id="indicator-1"></div>
                                    <div class="carousel-indicator" id="indicator-2"></div>
                                    <div class="carousel-indicator" id="indicator-3"></div>
                                </div>
                                <button class="btn btn-link p-0 text-white" id="carousel-next">
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" style="transform: rotate(-90deg)">
                                        <path d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z" fill="white"></path>
                                    </svg>
                                </button>
                            </div>
                        </section>
                    </div>
        </div>

        <!-- Registration form content -->
        <section class="main-content">
            <div class="container-fluid h-100">
                
                <!-- Header -->
                <header class="d-flex justify-content-center align-items-center mb-4">
                    <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                    <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">NASD ZAM</h1>
                </header>

                <!-- Title -->
                <div class="text-center mb-5">
                    <h2 class="fw-bold fs-1 text-dark">Create your account</h2>
                </div>

                <!-- Display global messages -->
                <#if messagesPerField.exists('global')>
                    <div class="alert alert-danger" role="alert">
                        <#list messagesPerField.get('global') as error>
                            <span>${kcSanitize(error)?no_esc}</span>
                        </#list>
                    </div>
                </#if>

                <!-- Registration Form -->
                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <@userProfileCommons.userProfileFormFields; callback, attribute>
                         <#if callback = "beforeField">
                                    <!-- Email Field -->
                                    <#if attribute.name == 'email'>
                                        <div class="mb-4 kc-form-group">
                                            <label for="email" class="form-label fw-semibold fs-5">Email</label>
                                            <input type="email" 
                                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                                   id="email" 
                                                   name="email"
                                                   placeholder="enter your email"
                                                   style="height: 60px"
                                                   value="${(register.formData.email!'')}"
                                                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                                   required />
                                            <#if messagesPerField.existsError('email')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>
                                    </#if>

                                    <!-- Username Field (if not using email as username) -->
                                    <#if attribute.name == 'username' && !realm.registrationEmailAsUsername>
                                        <div class="mb-4 kc-form-group">
                                            <label for="username" class="form-label fw-semibold fs-5">Username</label>
                                            <input type="text" 
                                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                                   id="username" 
                                                   name="username"
                                                   placeholder="enter your username"
                                                   style="height: 60px"
                                                   value="${(register.formData.username!'')}"
                                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                                   required />
                                            <#if messagesPerField.existsError('username')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>
                                    </#if>

                                    <!-- First Name Field -->
                                    <#if attribute.name == 'firstName'>
                                        <div class="mb-4 kc-form-group">
                                            <label for="firstName" class="form-label fw-semibold fs-5">First Name</label>
                                            <input type="text" 
                                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                                   id="firstName" 
                                                   name="firstName"
                                                   placeholder="enter your first name"
                                                   style="height: 60px"
                                                   value="${(register.formData.firstName!'')}"
                                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                                   <#if attribute.required??>required</#if> />
                                            <#if messagesPerField.existsError('firstName')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>
                                    </#if>

                                    <!-- Last Name Field -->
                                    <#if attribute.name == 'lastName'>
                                        <div class="mb-4 kc-form-group">
                                            <label for="lastName" class="form-label fw-semibold fs-5">Last Name</label>
                                            <input type="text" 
                                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                                   id="lastName" 
                                                   name="lastName"
                                                   placeholder="enter your last name"
                                                   style="height: 60px"
                                                   value="${(register.formData.lastName!'')}"
                                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                                   <#if attribute.required??>required</#if> />
                                            <#if messagesPerField.existsError('lastName')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>
                                    </#if>
                                </#if>

                                <#if callback = "afterField">
                                    <!-- Password fields after username/email -->
                                    <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                        <!-- Password Field -->
                                        <div class="mb-4 kc-form-group">
                                            <label for="password" class="form-label fw-semibold fs-5">Password</label>
                                            <div class="input-container">
                                                <input type="password" 
                                                       class="form-control form-control-lg bg-light-custom border-custom" 
                                                       id="password" 
                                                       name="password"
                                                       placeholder="insert your password here"
                                                       style="height: 60px; padding-right: 50px"
                                                       autocomplete="new-password"
                                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                                       required />
                                                <i class="bi bi-eye password-toggle" id="password-toggle"></i>
                                            </div>
                                            <#if messagesPerField.existsError('password')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>

                                        <!-- Confirm Password Field -->
                                        <div class="mb-4 kc-form-group">
                                            <label for="password-confirm" class="form-label fw-semibold fs-5">Confirm Password</label>
                                            <div class="input-container">
                                                <input type="password" 
                                                       class="form-control form-control-lg bg-light-custom border-custom" 
                                                       id="password-confirm" 
                                                       name="password-confirm"
                                                       placeholder="confirm password here"
                                                       style="height: 60px; padding-right: 50px"
                                                       autocomplete="new-password"
                                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                                       required />
                                                <i class="bi bi-eye password-toggle" id="confirm-password-toggle"></i>
                                            </div>
                                            <#if messagesPerField.existsError('password-confirm')>
                                                <div class="text-danger small mt-1 error-message show">
                                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                                </div>
                                            </#if>
                                        </div>
                                    </#if>
                                </#if>
                    </@userProfileCommons.userProfileFormFields>

                    <@registerCommons.termsAcceptance/>

                    <div class="d-grid mb-4">
                        <button type="submit" class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold">
                            Create account
                        </button>
                    </div>
                </form>

            </div>
        </section>

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
                    clearInterval(autoSlideInterval);
                }

                // Initialize carousel
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
                    const confirmPasswordToggle = document.getElementById("confirm-password-toggle");

                    if (passwordToggle) {
                        passwordToggle.addEventListener("click", () => {
                            const passwordInput = document.getElementById("password");
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

                    if (confirmPasswordToggle) {
                        confirmPasswordToggle.addEventListener("click", () => {
                            const confirmPasswordInput = document.getElementById("password-confirm");
                            if (confirmPasswordInput.type === "password") {
                                confirmPasswordInput.type = "text";
                                confirmPasswordToggle.classList.remove("bi-eye");
                                confirmPasswordToggle.classList.add("bi-eye-slash");
                            } else {
                                confirmPasswordInput.type = "password";
                                confirmPasswordToggle.classList.remove("bi-eye-slash");
                                confirmPasswordToggle.classList.add("bi-eye");
                            }
                        });
                    }
                });

                // reCAPTCHA callback (if invisible reCAPTCHA is used)
                <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                function onSubmitRecaptcha(token) {
                    document.getElementById("kc-register-form").requestSubmit();
                }
                </#if>
            </script>

    </#if>
</@layout.registrationLayout>
