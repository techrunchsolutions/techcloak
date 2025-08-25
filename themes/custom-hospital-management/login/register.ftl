<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${msg("registerTitle")}
        </#if>
    <#elseif section = "form">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System - Signup</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        /* Override Keycloak default styling */
        #kc-info-wrapper {
            display: none;
        }
        
        .login-pf-page .card-pf {
            padding: 0px; 
            margin-bottom: 0;
            max-width: 15000px !important;
            border-top: 0px solid transparent;
        }
        
        .login-pf-header, .login-pf-page-header {
            display: none !important;
        }
        
        .login-pf-page {
            padding-top: 0px;
        }
        
        @media (min-width: 768px) {
            .login-pf-page .card-pf {
                padding: 0px;
            }
        }
        
        #kc-content-wrapper {
            margin-top: 0px;
        }
        
        #kc-info {
            margin: 0px;
        }
        
        html, body {
            overflow-x: hidden;
        }
        
        /* Custom error message styling */
        .error-message {
            color: #dc2626;
            font-size: 0.875rem;
            margin-top: 0.5rem;
            display: block;
        }
        
        /* Password toggle button styling */
        .password-toggle-btn {
            position: absolute;
            right: 12px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #6b7280;
            font-size: 1rem;
            padding: 4px;
            border-radius: 4px;
            transition: color 0.2s;
            z-index: 10;
        }
        
        .password-toggle-btn:hover {
            color: #374151;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-wrapper input[type="password"] {
            padding-right: 2.5rem;
        }
    </style>

    <div class="container">
        <!-- Left Side -->
        <div class="image-section">
            <div class="image-overlay">
                <div class="glass-card">
                    <div class="logo">
                        <i class="fas fa-heartbeat logo-icon"></i>
                        <h1>MediCare</h1>
                    </div>
                    <h2>Join the Healthcare Revolution</h2>
                    <p>
                        Create your account and start managing healthcare operations with
                        cutting-edge technology and intuitive design.
                    </p>
                    <div class="features">
                        <div class="feature">
                            <i class="fas fa-rocket feature-icon"></i>
                            <span>Easy Setup</span>
                        </div>
                        <div class="feature">
                            <i class="fas fa-headset feature-icon"></i>
                            <span>24/7 Support</span>
                        </div>
                        <div class="feature">
                            <i class="fas fa-bolt feature-icon"></i>
                            <span>Instant Access</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side - Signup -->
        <div class="form-section">
            <div class="form-container">
                <div class="form-content">
                    <div class="form-header">
                        <h2>Create Account</h2>
                        <p>Join thousands of healthcare professionals</p>
                        <#if messagesPerField.exists('global')>
                            <div class="error-message">
                                ${kcSanitize(messagesPerField.get('global'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <form class="auth-form" id="kc-register-form" action="${url.registrationAction}" method="post">
                        <div class="form-row">
                            <div class="form-group">
                                <label for="firstName">First Name</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="firstName" name="firstName" placeholder="Enter first name" 
                                           value="${(register.formData.firstName!'')}" required>
                                </div>
                                <#if messagesPerField.existsError('firstName')>
                                    <span class="error-message">
                                        ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <div class="form-group">
                                <label for="lastName">Last Name</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="lastName" name="lastName" placeholder="Enter last name" 
                                           value="${(register.formData.lastName!'')}" required>
                                </div>
                                <#if messagesPerField.existsError('lastName')>
                                    <span class="error-message">
                                        ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="email">Email Address</label>
                            <div class="input-wrapper">
                                <i class="fas fa-envelope input-icon"></i>
                                <input type="email" id="email" name="email" placeholder="Enter your email" 
                                       value="${(register.formData.email!'')}" required>
                            </div>
                            <#if messagesPerField.existsError('email')>
                                <span class="error-message">
                                    ${kcSanitize(messagesPerField.get('email'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <#if !realm.registrationEmailAsUsername>
                            <div class="form-group">
                                <label for="username">Username</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-user input-icon"></i>
                                    <input type="text" id="username" name="username" placeholder="Enter username" 
                                           value="${(register.formData.username!'')}" required>
                                </div>
                                <#if messagesPerField.existsError('username')>
                                    <span class="error-message">
                                        ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <!-- Custom role field if needed -->
                        <div class="form-group">
                            <label for="user.attributes.role">Role</label>
                            <div class="input-wrapper">
                                <i class="fas fa-briefcase input-icon"></i>
                                <select id="user.attributes.role" name="user.attributes.role" required>
                                    <option value="">Select your role</option>
                                    <option value="doctor" <#if (register.formData['user.attributes.role']!'') == 'doctor'>selected</#if>>Doctor</option>
                                    <option value="nurse" <#if (register.formData['user.attributes.role']!'') == 'nurse'>selected</#if>>Nurse</option>
                                    <option value="admin" <#if (register.formData['user.attributes.role']!'') == 'admin'>selected</#if>>Administrator</option>
                                    <option value="pharmacist" <#if (register.formData['user.attributes.role']!'') == 'pharmacist'>selected</#if>>Pharmacist</option>
                                    <option value="technician" <#if (register.formData['user.attributes.role']!'') == 'technician'>selected</#if>>Medical Technician</option>
                                </select>
                            </div>
                            <#if messagesPerField.existsError('user.attributes.role')>
                                <span class="error-message">
                                    ${kcSanitize(messagesPerField.get('user.attributes.role'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <#if passwordRequired??>
                            <div class="form-group">
                                <label for="password">Password</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password" name="password" placeholder="Create a password" 
                                           autocomplete="new-password" required>
                                    <button class="password-toggle-btn" type="button" aria-label="${msg('showPassword')}"
                                            onclick="togglePassword('password')">
                                        <i class="fas fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <#if messagesPerField.existsError('password')>
                                    <span class="error-message">
                                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <div class="form-group">
                                <label for="password-confirm">Confirm Password</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password-confirm" name="password-confirm" 
                                           placeholder="Confirm your password" autocomplete="new-password" required>
                                    <button class="password-toggle-btn" type="button" aria-label="${msg('showPassword')}"
                                            onclick="togglePassword('password-confirm')">
                                        <i class="fas fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                                <#if messagesPerField.existsError('password-confirm')>
                                    <span class="error-message">
                                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                    </span>
                                </#if>
                            </div>
                        </#if>

                        <@registerCommons.termsAcceptance/>

                        <#if recaptchaRequired?? && (recaptchaVisible!false)>
                            <div class="form-group">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                            </div>
                        </#if>

                        <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                            <button class="submit-btn g-recaptcha" data-sitekey="${recaptchaSiteKey}" 
                                    data-callback='onSubmitRecaptcha' data-action='${recaptchaAction}' type="submit">
                                <span>${msg("doRegister")}</span>
                                <i class="fas fa-arrow-right arrow-icon"></i>
                            </button>
                            <script>
                                function onSubmitRecaptcha(token) {
                                    document.getElementById("kc-register-form").requestSubmit();
                                }
                            </script>
                        <#else>
                            <button type="submit" class="submit-btn">
                                <span>${msg("doRegister")}</span>
                                <i class="fas fa-arrow-right arrow-icon"></i>
                            </button>
                        </#if>
                    </form>

                    <#if realm.password && social?? && social.providers?has_content>
                        <div class="divider"><span>or</span></div>

                        <div class="social-login">
                            <#list social.providers as p>
                                <button class="social-btn google" type="button" onclick="window.location.href='${p.loginUrl}'">
                                    <#if p.iconClasses?has_content>
                                        <i class="${p.iconClasses!} social-icon" aria-hidden="true"></i>
                                    <#else>
                                        <i class="fab fa-google social-icon"></i>
                                    </#if>
                                    Continue with ${p.displayName!}
                                </button>
                            </#list>
                        </div>
                    </#if>

                    <div class="form-switch">
                        <p>Already have an account? <a href="${url.loginUrl}">Sign in</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function togglePassword(fieldId) {
            const passwordField = document.getElementById(fieldId);
            const toggleBtn = passwordField.parentNode.querySelector('.password-toggle-btn');
            const icon = toggleBtn.querySelector('i');
            
            if (passwordField.type === 'password') {
                passwordField.type = 'text';
                icon.className = 'fas fa-eye-slash';
                toggleBtn.setAttribute('aria-label', '${msg("hidePassword")}');
            } else {
                passwordField.type = 'password';
                icon.className = 'fas fa-eye';
                toggleBtn.setAttribute('aria-label', '${msg("showPassword")}');
            }
        }
    </script>
    <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>
