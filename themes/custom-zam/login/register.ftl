<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">
        <style>
            /* Custom Styles for NASD ZAM */
            :root {
                --primary-red: #ec232a;
                --light-gray: #f8f9fa;
                --border-gray: #dee2e6;
                --text-muted: #6c757d;
            }

            .kc-content {
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
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
                border-radius: 8px;
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

            .kc-form-group {
                margin-bottom: 1.5rem;
            }

            .kc-header-wrapper {
                text-align: center;
                margin-bottom: 2rem;
            }

            .kc-form-options-wrapper {
                margin-bottom: 1.5rem;
            }

            /* Custom layout adjustments */
            .kc-logo-wrapper {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-bottom: 1.5rem;
            }

            .kc-page-container {
                padding: 2rem;
            }

            @media (max-width: 768px) {
                .kc-page-container {
                    padding: 1rem;
                }
            }
        </style>

        <!-- Custom Header -->
        <div class="kc-header-wrapper">
            <div class="kc-logo-wrapper">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" style="height: 40px; margin-right: 10px;" />
                <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">NASD ZAM</h1>
            </div>
            <h2 class="fw-bold fs-1 text-dark">${msg("registerTitle")}</h2>
        </div>

        <!-- Display global messages -->
        <#if message?has_content>
            <#if message.type = 'error'>
                <div class="alert alert-${message.type}">
                    <span>${kcSanitize(message.summary)?no_esc}</span>
                </div>
            </#if>
        </#if>

        <form id="kc-register-form" class="kc-form-class" action="${url.registrationAction}" method="post">
            <@userProfileCommons.userProfileFormFields; callback, attribute>
                <#if callback = "beforeField">
                    <#if attribute.name == 'username' && !realm.registrationEmailAsUsername>
                        <div class="kc-form-group">
                            <label for="username" class="form-label fw-semibold">${msg("username")}</label>
                            <input type="text" 
                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                   id="username" 
                                   name="username"
                                   placeholder="${msg('enterUsername')}"
                                   value="${(register.formData.username!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                   required />
                            <#if messagesPerField.existsError('username')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </#if>

                    <#if attribute.name == 'email'>
                        <div class="kc-form-group">
                            <label for="email" class="form-label fw-semibold">${msg("email")}</label>
                            <input type="email" 
                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                   id="email" 
                                   name="email"
                                   placeholder="${msg('enterEmail')}"
                                   value="${(register.formData.email!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                                   required />
                            <#if messagesPerField.existsError('email')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </#if>

                    <#if attribute.name == 'firstName'>
                        <div class="kc-form-group">
                            <label for="firstName" class="form-label fw-semibold">${msg("firstName")}</label>
                            <input type="text" 
                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                   id="firstName" 
                                   name="firstName"
                                   placeholder="${msg('enterFirstName')}"
                                   value="${(register.formData.firstName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                   <#if attribute.required??>required</#if> />
                            <#if messagesPerField.existsError('firstName')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </#if>

                    <#if attribute.name == 'lastName'>
                        <div class="kc-form-group">
                            <label for="lastName" class="form-label fw-semibold">${msg("lastName")}</label>
                            <input type="text" 
                                   class="form-control form-control-lg bg-light-custom border-custom" 
                                   id="lastName" 
                                   name="lastName"
                                   placeholder="${msg('enterLastName')}"
                                   value="${(register.formData.lastName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                   <#if attribute.required??>required</#if> />
                            <#if messagesPerField.existsError('lastName')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </#if>
                </#if>

                <#if callback = "afterField">
                    <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                        <!-- Password Field -->
                        <div class="kc-form-group">
                            <label for="password" class="form-label fw-semibold">${msg("password")}</label>
                            <div class="input-container">
                                <input type="password" 
                                       class="form-control form-control-lg bg-light-custom border-custom" 
                                       id="password" 
                                       name="password"
                                       placeholder="${msg('enterPassword')}"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                       required />
                                <i class="bi bi-eye password-toggle" id="password-toggle"></i>
                            </div>
                            <#if messagesPerField.existsError('password')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </div>
                            </#if>
                        </div>

                        <!-- Confirm Password Field -->
                        <div class="kc-form-group">
                            <label for="password-confirm" class="form-label fw-semibold">${msg("passwordConfirm")}</label>
                            <div class="input-container">
                                <input type="password" 
                                       class="form-control form-control-lg bg-light-custom border-custom" 
                                       id="password-confirm" 
                                       name="password-confirm"
                                       placeholder="${msg('confirmPassword')}"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                       required />
                                <i class="bi bi-eye password-toggle" id="confirm-password-toggle"></i>
                            </div>
                            <#if messagesPerField.existsError('password-confirm')>
                                <div class="text-danger small mt-1">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </#if>
                </#if>
            </@userProfileCommons.userProfileFormFields>

            <@registerCommons.termsAcceptance/>

            <#if recaptchaRequired?? && (recaptchaVisible!false)>
                <div class="form-group">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                </div>
            </#if>

            <div class="kc-form-options-wrapper">
                <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
            </div>

            <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                <script>
                    function onSubmitRecaptcha(token) {
                        document.getElementById("kc-register-form").requestSubmit();
                    }
                </script>
                <div class="kc-form-buttons">
                    <button class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold g-recaptcha" 
                        data-sitekey="${recaptchaSiteKey}" data-callback='onSubmitRecaptcha' data-action='${recaptchaAction}' type="submit">
                        ${msg("doRegister")}
                    </button>
                </div>
            <#else>
                <div class="kc-form-buttons">
                    <button type="submit" class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold">
                        ${msg("doRegister")}
                    </button>
                </div>
            </#if>

            <!-- Social Media Icons -->
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

            <!-- Footer -->
            <footer class="text-center mt-4">
                <small class="text-muted-custom">© 2024 NASD Plc. All rights reserved</small>
            </footer>
        </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Password toggle functionality
            document.addEventListener('DOMContentLoaded', function() {
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
        </script>
    </#if>
</@layout.registrationLayout>
