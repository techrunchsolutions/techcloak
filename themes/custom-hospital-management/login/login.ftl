<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hospital Management System - Authentication</title>
    <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
.hos-text {
color: white !important;
}

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

        .login-pf .container {
     padding-top: 0; 
     padding-bottom: 0; 
     padding-top: 0; 
}

        @media (min-width: 768px) {
    .login-pf .container {
        bottom: auto;
        padding-left: 0;
        position: unset;
        width: 100%;
        padding-right: 0;
    }
}

html, body {
    overflow-x: unset;
}

.container {
     padding-right: 0; 
     padding-left: 0; 
}

@media (max-width: 767px) {
    .login-pf .container {
         padding-top: 0; 
         padding-bottom: 0; 
    }
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
        .input-wrapper input[type="text"] {
            padding-right: 2.5rem;
        }
    </style>

    <div class="container">
        <!-- Left Side - Healthcare Image with Glass Morphism -->
        <div class="image-section">
            <div class="image-overlay">
                <div class="glass-card">
                    <div class="logo">
                        <i class="fas fa-heartbeat logo-icon"></i>
                        <h1>MediCare</h1>
                    </div>
                    <h2 id="hero-title">Welcome to the Future of Healthcare</h2>
                    <p class="hos-text" id="hero-description">Streamlined hospital management system designed to enhance patient care and operational efficiency.</p>
                    <div class="features">
                        <div class="feature">
                            <i class="fas fa-users feature-icon"></i>
                            <span>Patient Management</span>
                        </div>
                        <div class="feature">
                            <i class="fas fa-shield-alt feature-icon"></i>
                            <span>Secure Records</span>
                        </div>
                        <div class="feature">
                            <i class="fas fa-bolt feature-icon"></i>
                            <span>Real-time Updates</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Right Side - Authentication Forms -->
        <div class="form-section">
            <div class="form-container">
                <!-- Login Form -->
                <div class="form-content" id="loginForm">
                    <div class="form-header">
                        <h2>Welcome Back</h2>
                        <p>Sign in to your account to continue</p>
                        <#if messagesPerField.existsError('username','password')>
                            <div class="error-message">
                                ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </div>
                        </#if>
                    </div>

                    <#if realm.password>
                        <form class="auth-form" id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <#if !usernameHidden??>
                                <div class="form-group">
                                    <label for="username">
                                        <#if !realm.loginWithEmailAllowed>${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                        <#else>${msg("email")}</#if>
                                    </label>
                                    <div class="input-wrapper">
                                        <i class="fas fa-envelope input-icon"></i>
                                        <input tabindex="2" id="username" name="username" value="${(login.username!'')}" type="text"
                                               placeholder="<#if !realm.loginWithEmailAllowed>Enter your username<#elseif !realm.registrationEmailAsUsername>Enter your username or email<#else>Enter your email</#if>"
                                               autofocus autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                               dir="ltr" required>
                                    </div>
                                </div>
                            </#if>

                            <div class="form-group">
                                <label for="password">${msg("password")}</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input tabindex="3" id="password" name="password" type="password" 
                                           placeholder="Enter your password" autocomplete="current-password"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" required>
                                    <button class="password-toggle-btn" type="button" aria-label="${msg("showPassword")}"
                                            aria-controls="password" data-password-toggle tabindex="4">
                                        <i class="fas fa-eye" aria-hidden="true"></i>
                                    </button>
                                </div>
                            </div>

                            <div class="form-options">
                                <#if realm.rememberMe && !usernameHidden??>
                                    <label class="checkbox-wrapper">
                                        <#if login.rememberMe??>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" checked>
                                        <#else>
                                            <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox">
                                        </#if>
                                        <span class="checkmark"></span>
                                        ${msg("rememberMe")}
                                    </label>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                    <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>

                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button tabindex="7" type="submit" name="login" id="kc-login" class="submit-btn">
                                <span>${msg("doLogIn")}</span>
                                <i class="fas fa-arrow-right arrow-icon"></i>
                            </button>
                        </form>
                    </#if>

                    <#if realm.password && social?? && social.providers?has_content>
                        <div class="divider">
                            <span>or</span>
                        </div>

                        <div class="social-login">
                            <#list social.providers as p>
                                <button class="social-btn google" type="button" onclick="window.location.href='${p.loginUrl}'"
                                        data-once-link data-disabled-class="disabled">
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

                    <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                        <div class="form-switch">
                            <p>Don't have an account? <a tabindex="8" href="${url.registrationUrl}">Sign up</a></p>
                        </div>
                    </#if>
                </div>
            </div>
        </div>
    </div>

    <@passkeys.conditionalUIData />
    
    <script>
        // Custom password visibility toggle
        document.addEventListener('DOMContentLoaded', function() {
            const toggleBtn = document.querySelector('[data-password-toggle]');
            const passwordInput = document.getElementById('password');
            
            if (toggleBtn && passwordInput) {
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
    </script>
    <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
    <#elseif section = "info">
        <#-- This section is handled within the form section above -->
    <#elseif section = "socialProviders">
        <#-- This section is handled within the form section above -->
    </#if>
</@layout.registrationLayout>
