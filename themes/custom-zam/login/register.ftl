<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section == "header">
        <title>Sign Up - NASD ZAM</title>
    <#elseif section == "form">
<style>
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

* {
  box-sizing: border-box;
}

/* Hide default Keycloak elements */
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
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
    font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    margin: 0;
    padding: 0;
}

.register-container {
    min-height: 100vh;
    display: flex;
    position: relative;
    overflow: hidden;
}

/* Left Content - Enhanced Carousel */
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
    transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
    transform: scale(1.1);
}

.carousel-image.active {
    opacity: 1;
    transform: scale(1);
}

/* Enhanced decorative elements */
.decorative-overlay {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
    z-index: 1;
}

.floating-shapes {
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    z-index: 2;
    pointer-events: none;
}

.shape {
    position: absolute;
    border-radius: 50%;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.05));
    backdrop-filter: blur(10px);
    animation: float 6s ease-in-out infinite;
}

.shape-1 {
    width: 200px;
    height: 200px;
    top: 10%;
    left: 10%;
    animation-delay: 0s;
}

.shape-2 {
    width: 120px;
    height: 120px;
    top: 60%;
    right: 15%;
    animation-delay: 2s;
}

.shape-3 {
    width: 80px;
    height: 80px;
    bottom: 20%;
    left: 30%;
    animation-delay: 4s;
}

@keyframes float {
    0%, 100% { transform: translateY(0px) rotate(0deg); }
    33% { transform: translateY(-20px) rotate(5deg); }
    66% { transform: translateY(10px) rotate(-3deg); }
}

/* Main Content - Enhanced */
.main-content {
    padding: 40px;
    display: flex;
    flex-direction: column;
    justify-content: flex-start;
    min-height: 100vh;
    overflow-y: auto;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(248, 250, 252, 0.95));
    backdrop-filter: blur(20px);
    position: relative;
}

.main-content::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="%23000" opacity="0.02"/><circle cx="75" cy="75" r="1" fill="%23000" opacity="0.02"/><circle cx="50" cy="10" r="1" fill="%23000" opacity="0.02"/><circle cx="10" cy="90" r="1" fill="%23000" opacity="0.02"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
    pointer-events: none;
    z-index: 1;
}

.main-content > * {
    position: relative;
    z-index: 2;
}

/* Enhanced brand header */
.brand-header {
    text-align: center;
    margin-bottom: 40px;
    margin-top: 20px;
    animation: fadeInDown 1s ease-out;
}

@keyframes fadeInDown {
    from { opacity: 0; transform: translateY(-30px); }
    to { opacity: 1; transform: translateY(0); }
}

.brand-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 12px;
    padding: 20px;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.4));
    border-radius: 20px;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(255, 255, 255, 0.3);
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
    max-width: 350px;
    margin: 0 auto;
    transition: transform 0.3s ease;
}

.brand-logo:hover {
    transform: translateY(-2px);
}

.brand-logo img {
    transition: transform 0.3s ease;
}

.brand-logo:hover img {
    transform: scale(1.05);
}

.brand-title {
    font-weight: 700;
    font-size: 1.3rem;
    margin: 0;
    background: linear-gradient(135deg, #667eea, #764ba2);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
}

/* Enhanced page title */
.page-title {
    text-align: center;
    margin-bottom: 40px;
    animation: fadeInUp 1s ease-out 0.2s both;
}

@keyframes fadeInUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.page-title h2 {
    font-weight: 700;
    font-size: 2.8rem;
    background: linear-gradient(135deg, #1e293b, #475569);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    margin: 0;
    position: relative;
}

.page-title h2::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 4px;
    background: linear-gradient(135deg, #667eea, #764ba2);
    border-radius: 2px;
}

/* Enhanced form styling */
.register-form {
    max-width: 520px;
    margin: 0 auto;
    animation: fadeInUp 1s ease-out 0.4s both;
}

.form-group {
    margin-bottom: 28px;
    position: relative;
}

.form-label {
    font-weight: 600;
    font-size: 1.1rem;
    color: #374151;
    margin-bottom: 12px;
    display: block;
    transition: all 0.3s ease;
}

.form-control-custom {
    width: 100%;
    height: 64px;
    padding: 20px 24px;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
    border: 2px solid rgba(203, 213, 225, 0.5);
    border-radius: 16px;
    font-size: 1.1rem;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    backdrop-filter: blur(10px);
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
}

.form-control-custom:focus {
    outline: none;
    border-color: #667eea;
    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1), 0 8px 30px rgba(102, 126, 234, 0.15);
    transform: translateY(-2px);
    background: rgba(255, 255, 255, 0.95);
}

.form-control-custom.error {
    border-color: #ef4444;
    box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
    animation: shake 0.5s ease-in-out;
}

.form-control-custom.valid {
    border-color: #10b981;
    box-shadow: 0 0 0 4px rgba(16, 185, 129, 0.1);
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    75% { transform: translateX(5px); }
}

.form-control-custom::placeholder {
    color: #9ca3af;
    transition: opacity 0.3s ease;
}

.form-control-custom:focus::placeholder {
    opacity: 0.7;
}

/* Enhanced input container */
.input-container {
    position: relative;
}

.password-toggle {
    position: absolute;
    right: 20px;
    top: 50%;
    transform: translateY(-50%);
    cursor: pointer;
    color: #6b7280;
    width: 24px;
    height: 24px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 50%;
    transition: all 0.3s ease;
    background: rgba(255, 255, 255, 0.8);
    backdrop-filter: blur(10px);
}

.password-toggle:hover {
    color: #667eea;
    background: rgba(102, 126, 234, 0.1);
    transform: translateY(-50%) scale(1.1);
}

.password-toggle svg {
    width: 20px;
    height: 20px;
}

/* Enhanced primary button */
.btn-primary-custom {
    width: 100%;
    height: 64px;
    background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
    border: none;
    border-radius: 16px;
    color: white;
    font-size: 1.2rem;
    font-weight: 600;
    cursor: pointer;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    margin-bottom: 32px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 8px 30px rgba(102, 126, 234, 0.3);
}

.btn-primary-custom::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.6s ease;
}

.btn-primary-custom:hover:not(:disabled) {
    background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
    transform: translateY(-3px);
    box-shadow: 0 12px 40px rgba(102, 126, 234, 0.4);
}

.btn-primary-custom:hover:not(:disabled)::before {
    left: 100%;
}

.btn-primary-custom:active {
    transform: translateY(-1px);
}

.btn-primary-custom:disabled {
    opacity: 0.6;
    cursor: not-allowed;
    background: linear-gradient(135deg, #9ca3af 0%, #6b7280 100%);
    transform: none;
    box-shadow: 0 4px 15px rgba(156, 163, 175, 0.3);
}

/* Enhanced validation messages */
.error-message {
    color: #ef4444;
    font-size: 0.9rem;
    margin-top: 8px;
    padding: 8px 12px;
    background: rgba(239, 68, 68, 0.1);
    border-radius: 8px;
    border-left: 4px solid #ef4444;
    display: none;
    animation: slideInLeft 0.3s ease-out;
}

.error-message.show {
    display: block;
}

.success-message {
    color: #10b981;
    font-size: 0.9rem;
    margin-top: 8px;
    padding: 8px 12px;
    background: rgba(16, 185, 129, 0.1);
    border-radius: 8px;
    border-left: 4px solid #10b981;
    display: none;
    animation: slideInLeft 0.3s ease-out;
}

.success-message.show {
    display: block;
}

@keyframes slideInLeft {
    from { opacity: 0; transform: translateX(-10px); }
    to { opacity: 1; transform: translateX(0); }
}

/* Enhanced footer */
.footer-text {
    text-align: center;
    color: #6b7280;
    font-size: 0.9rem;
    margin-top: 40px;
    padding: 20px;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.4), rgba(248, 250, 252, 0.4));
    border-radius: 12px;
    backdrop-filter: blur(10px);
    border: 1px solid rgba(203, 213, 225, 0.2);
}

/* Enhanced row styling */
.row {
    display: flex;
    flex-wrap: wrap;
    margin: 0 -12px;
}

.col-md-6 {
    flex: 0 0 50%;
    max-width: 50%;
    padding: 0 12px;
}

.g-4 {
    gap: 1.5rem;
}

.mb-4 {
    margin-bottom: 1.5rem;
}

/* Responsive enhancements */
@media (max-width: 768px) {
    .main-content {
        padding: 20px;
    }

    .page-title h2 {
        font-size: 2.2rem;
    }

    .brand-title {
        font-size: 1.1rem;
    }

    .form-control-custom {
        height: 56px;
        padding: 16px 20px;
        font-size: 1rem;
    }

    .btn-primary-custom {
        height: 56px;
        font-size: 1.1rem;
    }

    .col-md-6 {
        flex: 0 0 100%;
        max-width: 100%;
    }

    .row {
        margin: 0;
    }

    .col-md-6 {
        padding: 0;
    }
}

/* Loading animation for buttons */
.btn-loading {
    position: relative;
    color: transparent !important;
}

.btn-loading::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 20px;
    height: 20px;
    border: 2px solid rgba(255, 255, 255, 0.3);
    border-top: 2px solid white;
    border-radius: 50%;
    animation: spin 1s linear infinite;
}

@keyframes spin {
    0% { transform: translate(-50%, -50%) rotate(0deg); }
    100% { transform: translate(-50%, -50%) rotate(360deg); }
}

/* Enhanced focus states */
.form-control-custom:focus + .form-label,
.form-control-custom:not(:placeholder-shown) + .form-label {
    color: #667eea;
    transform: scale(0.9);
}

/* Validation icons */
.validation-icon {
    position: absolute;
    right: 60px;
    top: 50%;
    transform: translateY(-50%);
    width: 20px;
    height: 20px;
    opacity: 0;
    transition: all 0.3s ease;
}

.form-control-custom.valid ~ .validation-icon.success {
    opacity: 1;
    color: #10b981;
}

.form-control-custom.error ~ .validation-icon.error {
    opacity: 1;
    color: #ef4444;
}
</style>

<div class="register-container">
    <!-- Left Content (Hidden on smaller screens) -->
    <div class="left-content">
        <div class="background-container">
            <img src="${url.resourcesPath}/img/car4.png" class="carousel-image active"/>
            <img src="${url.resourcesPath}/img/car5.png" class="carousel-image"/>
            <img src="${url.resourcesPath}/img/car6.png" class="carousel-image"/>

            <div class="decorative-overlay"></div>
            <div class="floating-shapes">
                <div class="shape shape-1"></div>
                <div class="shape shape-2"></div>
                <div class="shape shape-3"></div>
            </div>
        </div>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <!-- Header with Logo -->
        <header class="brand-header">
            <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD ZAM</h1>
            </div>
        </header>

        <!-- Page Title -->
        <section class="page-title">
            <h2>Create your account</h2>
        </section>

        <!-- Registration Form -->
        <main>
            <form id="kc-register-form" action="${url.registrationAction}" method="post" class="register-form">
                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" id="firstName" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   class="form-control-custom"
                                   placeholder="Enter your first name"
                                   required/>
                            <div class="validation-icon success">✓</div>
                            <div class="validation-icon error">✗</div>
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
                                   class="form-control-custom"
                                   placeholder="Enter your last name"
                                   required/>
                            <div class="validation-icon success">✓</div>
                            <div class="validation-icon error">✗</div>
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
                           class="form-control-custom"
                           placeholder="Enter your email address"
                           required/>
                    <div class="validation-icon success">✓</div>
                    <div class="validation-icon error">✗</div>
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
                               class="form-control-custom"
                               style="padding-right: 100px;"
                               placeholder="Create a strong password"
                               required/>
                        <div class="validation-icon success">✓</div>
                        <div class="validation-icon error">✗</div>
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
                               class="form-control-custom"
                               style="padding-right: 100px;"
                               placeholder="Confirm your password"
                               required/>
                        <div class="validation-icon success">✓</div>
                        <div class="validation-icon error">✗</div>
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
        </main>

        <!-- Footer -->
        <footer class="footer-text">
            © 2024 NASD Plc. All rights reserved
        </footer>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Enhanced carousel functionality
    let currentSlide = 0;
    const totalSlides = 3;
    let autoSlideInterval;

    function showSlide(slideNumber) {
        const images = document.querySelectorAll('.carousel-image');
        images.forEach((img, index) => {
            img.classList.toggle('active', index === slideNumber);
        });
    }

    function nextSlide() {
        currentSlide = (currentSlide + 1) % totalSlides;
        showSlide(currentSlide);
    }

    function startAutoSlide() {
        autoSlideInterval = setInterval(nextSlide, 5000);
    }

    startAutoSlide();

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

    // Enhanced password toggle functionality
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

    // Enhanced validation functions
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
            if (errorElement) errorElement.classList.remove('show');
            if (successElement) successElement.classList.add('show');
        } else {
            inputElement.classList.add('error');
            inputElement.classList.remove('valid');
            if (errorElement) errorElement.classList.add('show');
            if (successElement) successElement.classList.remove('show');
        }
    }

    function updateSubmitButton() {
        const allValid = Object.values(validationState).every(state => state);
        submitBtn.disabled = !allValid;

        if (allValid) {
            submitBtn.style.background = 'linear-gradient(135deg, #667eea 0%, #764ba2 100%)';
            submitBtn.style.cursor = 'pointer';
        } else {
            submitBtn.style.background = 'linear-gradient(135deg, #9ca3af 0%, #6b7280 100%)';
            submitBtn.style.cursor = 'not-allowed';
        }
    }

    // Enhanced input validation with real-time feedback
    function setupInputValidation(input, validationKey, validationFn, errorId, successId) {
        if (!input) return;

        input.addEventListener('input', function() {
            const value = this.value.trim();
            const isValid = validationFn ? validationFn(value) : value.length > 0;
            validationState[validationKey] = isValid;

            const errorElement = document.getElementById(errorId);
            const successElement = successId ? document.getElementById(successId) : null;

            if (value.length > 0) {
                updateValidationUI(this, isValid, errorElement, successElement);
            } else {
                this.classList.remove('error', 'valid');
                if (errorElement) errorElement.classList.remove('show');
                if (successElement) successElement.classList.remove('show');
                validationState[validationKey] = false;
            }
            updateSubmitButton();
        });

        // Enhanced focus effects
        input.addEventListener('focus', function() {
            this.parentElement.style.transform = 'translateY(-2px)';
            const label = this.parentElement.querySelector('.form-label');
            if (label) {
                label.style.color = '#667eea';
            }
        });

        input.addEventListener('blur', function() {
            this.parentElement.style.transform = 'translateY(0)';
            const label = this.parentElement.querySelector('.form-label');
            if (label && this.value.length === 0) {
                label.style.color = '#374151';
            }
        });
    }

    // Setup validation for all inputs
    setupInputValidation(firstNameInput, 'firstName', null, 'firstName-error');
    setupInputValidation(lastNameInput, 'lastName', null, 'lastName-error');
    setupInputValidation(emailInput, 'email', validateEmail, 'email-error', 'email-success');
    setupInputValidation(passwordInput, 'password', validatePassword, 'password-error', 'password-success');

    // Special handling for password confirmation
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
                validationState.passwordConfirm = false;
            }
            updateSubmitButton();
        });

        // Re-validate password confirmation when password changes
        if (passwordInput) {
            passwordInput.addEventListener('input', function() {
                if (passwordConfirmInput.value.length > 0) {
                    passwordConfirmInput.dispatchEvent(new Event('input'));
                }
            });
        }
    }

    // Enhanced form submission
    if (form && submitBtn) {
        form.addEventListener('submit', function(e) {
            const allValid = Object.values(validationState).every(state => state);
            if (!allValid) {
                e.preventDefault();
                return false;
            }

            submitBtn.classList.add('btn-loading');
            submitBtn.disabled = true;

            // Add a slight delay to show the loading state
            setTimeout(() => {
                // Form will submit naturally
            }, 500);
        });
    }

    // Initial validation state
    updateSubmitButton();

    // Add smooth scroll behavior for better UX
    document.documentElement.style.scrollBehavior = 'smooth';
});
</script>
    </#if>
</@layout.registrationLayout>
