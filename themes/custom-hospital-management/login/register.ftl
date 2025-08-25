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
        }
        
        .password-toggle-btn:hover {
            color: #374151;
        }
        
        .input-wrapper {
            position: relative;
        }
        
        .input-wrapper input[type="password"],
        .input-wrapper input[type="text"],
        .input-wrapper input[type="email"] {
            padding-right: 2.5rem;
        }
        
        /* Hide original Keycloak password visibility buttons */
        .kc-form-password-visibility-button {
            display: none;
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
                        <@userProfileCommons.userProfileFormFields; callback, attribute>
                            <#if callback = "beforeField">
                                <#-- Handle first name field -->
                                <#if attribute.name == 'firstName'>
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="${attribute.name}">
                                                ${advancedMsg(attribute.displayName!'')}<#if attribute.required> *</#if>
                                            </label>
                                            <div class="input-wrapper">
                                                <i class="fas fa-user input-icon"></i>
                                                <@userProfileCommons.inputFieldByType attribute=attribute/>
                                            </div>
                                            <#if messagesPerField.existsError('${attribute.name}')>
                                                <span class="error-message">
                                                    ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>
                                        
                                <#-- Handle last name field within the same row -->
                                <#elseif attribute.name == 'lastName'>
                                        <div class="form-group">
                                            <label for="${attribute.name}">
                                                ${advancedMsg(attribute.displayName!'')}<#if attribute.required> *</#if>
                                            </label>
                                            <div class="input-wrapper">
                                                <i class="fas fa-user input-icon"></i>
                                                <@userProfileCommons.inputFieldByType attribute=attribute/>
                                            </div>
                                            <#if messagesPerField.existsError('${attribute.name}')>
                                                <span class="error-message">
                                                    ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                                </span>
                                            </#if>
                                        </div>
                                    </div>
                                    
                                <#-- Handle email field -->
                                <#elseif attribute.name == 'email'>
                                    <div class="form-group">
                                        <label for="${attribute.name}">
                                            ${advancedMsg(attribute.displayName!'')}<#if attribute.required> *</#if>
                                        </label>
                                        <div class="input-wrapper">
                                            <i class="fas fa-envelope input-icon"></i>
                                            <@userProfileCommons.inputFieldByType attribute=attribute/>
                                        </div>
                                        <#if messagesPerField.existsError('${attribute.name}')>
                                            <span class="error-message">
                                                ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                    
                                <#-- Handle username field -->
                                <#elseif attribute.name == 'username'>
                                    <div class="form-group">
                                        <label for="${attribute.name}">
                                            ${advancedMsg(attribute.displayName!'')}<#if attribute.required> *</#if>
                                        </label>
                                        <div class="input-wrapper">
                                            <i class="fas fa-user input-icon"></i>
                                            <@userProfileCommons.inputFieldByType attribute=attribute/>
                                        </div>
                                        <#if messagesPerField.existsError('${attribute.name}')>
                                            <span class="error-message">
                                                ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                    
                                <#-- Handle other fields with generic styling -->
                                <#else>
                                    <div class="form-group">
                                        <label for="${attribute.name}">
                                            ${advancedMsg(attribute.displayName!'')}<#if attribute.required> *</#if>
                                        </label>
                                        <div class="input-wrapper">
                                            <i class="fas fa-briefcase input-icon"></i>
                                            <@userProfileCommons.inputFieldByType attribute=attribute/>
                                        </div>
                                        <#if messagesPerField.existsError('${attribute.name}')>
                                            <span class="error-message">
                                                ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                </#if>
                            </#if>
                            
                            <#if callback = "afterField">
                                <#-- Render password fields after username or email -->
                                <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                    <div class="form-group">
                                        <label for="password">${msg("password")} *</label>
                                        <div class="input-wrapper">
                                            <i class="fas fa-lock input-icon"></i>
                                            <input type="password" id="password" name="password" placeholder="Create a password" 
                                                   autocomplete="new-password"
                                                   aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" required>
                                            <button class="password-toggle-btn" type="button" aria-label="${msg('showPassword')}"
                                                    aria-controls="password" data-password-toggle="password">
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
                                        <label for="password-confirm">${msg("passwordConfirm")} *</label>
                                        <div class="input-wrapper">
                                            <i class="fas fa-lock input-icon"></i>
                                            <input type="password" id="password-confirm" name="password-confirm" 
                                                   placeholder="Confirm your password" autocomplete="new-password"
                                                   aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" required>
                                            <button class="password-toggle-btn" type="button" aria-label="${msg('showPassword')}"
                                                    aria-controls="password-confirm" data-password-toggle="password-confirm">
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
                            </#if>
                        </@userProfileCommons.userProfileFormFields>

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
        // Custom password visibility toggle
        document.addEventListener('DOMContentLoaded', function() {
            const toggleBtns = document.querySelectorAll('[data-password-toggle]');
            
            toggleBtns.forEach(function(toggleBtn) {
                const targetId = toggleBtn.getAttribute('data-password-toggle');
                const passwordInput = document.getElementById(targetId);
                
                if (passwordInput) {
                    toggleBtn.addEventListener('click', function() {
                        const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                        passwordInput.setAttribute('type', type);
                        
                        const icon = toggleBtn.querySelector('i');
                        if (type === 'text') {
                            icon.className = 'fas fa-eye-slash';
                            toggleBtn.setAttribute('aria-label', '${msg("hidePassword")}');
                        } else {
                            icon.className = 'fas fa-eye';
                            toggleBtn.setAttribute('aria-label', '${msg("showPassword")}');
                        }
                    });
                }
            });
        });
    </script>
    <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    </#if>
</@layout.registrationLayout>
