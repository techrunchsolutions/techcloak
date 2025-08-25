<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>Hospital Management System - Authentication</title>
        <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <#elseif section = "form">
        <div class="container">
            <!-- Left Side -->
            <div class="image-section">
                <div class="image-overlay">
                    <div class="glass-card">
                        <div class="logo">
                            <i class="fas fa-heartbeat logo-icon"></i>
                            <h1>MediCare</h1>
                        </div>
                        <h2 id="hero-title">Welcome to the Future of Healthcare</h2>
                        <p id="hero-description">Streamlined hospital management system designed to enhance patient care and operational efficiency.</p>
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

            <!-- Right Side -->
            <div class="form-section">
                <div class="form-container">
                    <div class="form-content" id="loginForm">
                        <div class="form-header">
                            <h2>Welcome Back</h2>
                            <p>Sign in to your account to continue</p>
                        </div>

                        <#if realm.password>
                        <form id="kc-form-login" class="auth-form" action="${url.loginAction}" method="post" onsubmit="login.disabled=true;return true;">
                            <#if !usernameHidden??>
                            <div class="form-group">
                                <label for="username"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                                <div class="input-wrapper">
                                    <i class="fas fa-envelope input-icon"></i>
                                    <input type="text" id="username" name="username" value="${(login.username!'')}" placeholder="Enter your email" autocomplete="username" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" required>
                                </div>
                                <#if messagesPerField.existsError('username','password')>
                                    <span class="error-message">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</span>
                                </#if>
                            </div>
                            </#if>

                            <div class="form-group">
                                <label for="password">${msg("password")}</label>
                                <div class="input-wrapper">
                                    <i class="fas fa-lock input-icon"></i>
                                    <input type="password" id="password" name="password" placeholder="Enter your password" autocomplete="current-password" aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>" required>
                                </div>
                            </div>

                            <div class="form-options">
                                <#if realm.rememberMe && !usernameHidden??>
                                    <label class="checkbox-wrapper">
                                        <input type="checkbox" id="rememberMe" name="rememberMe" <#if login.rememberMe??>checked</#if>>
                                        <span class="checkmark"></span>${msg("rememberMe")}
                                    </label>
                                </#if>
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="forgot-password">${msg("doForgotPassword")}</a>
                                </#if>
                            </div>

                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button type="submit" id="kc-login" name="login" class="submit-btn">
                                <span>${msg("doLogIn")}</span>
                                <i class="fas fa-arrow-right arrow-icon"></i>
                            </button>
                        </form>
                        </#if>

                        <@passkeys.conditionalUIData />

                        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                            <div class="form-switch">
                                <p>Don't have an account? <a href="${url.registrationUrl}">${msg("doRegister")}</a></p>
                            </div>
                        </#if>
                    </div>
                </div>
            </div>
        </div>
    <#elseif section = "socialProviders">
        <#if social?? && social.providers?has_content>
            <div class="social-login">
                <#list social.providers as p>
                    <button id="social-${p.alias}" class="social-btn google" type="button" onclick="location.href='${p.loginUrl}'">
                        <#if p.iconClasses?has_content><i class="${p.iconClasses!} social-icon"></i></#if>
                        ${p.displayName!}
                    </button>
                </#list>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
