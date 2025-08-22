<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>

.card-pf {
    max-width: 15000px; 
}

#kc-info-wrapper {
    display: none;
}

#kc-page-title {
display: none;
}

.login-pf-page-header{
display:none;
}

.login-pf-page {
    padding-top: 0;
}

@media (min-width: 768px) {
    .login-pf-page .card-pf {
        padding: 0;
    }
}

.login-pf-header{
display:none;
}

html, body {
overflow: hidden;
}

            body {
                font-family: 'Spline Sans', 'Noto Sans', sans-serif;
            }
            .login-container {
                min-height: 100vh;
                width: 100%;
                background-color: #e0f2fe;
                display: flex;
            }
            .left-panel {
                width: 50%;
                height: 100vh;
                background-image: url('https://img.freepik.com/premium-vector/business-training-illustration-concept-flat-illustration-isolated-white-background_701961-9696.jpg');
                background-size: cover;
                background-position: center;
                background-repeat: no-repeat;
            }
            .right-panel {
                width: 50%;
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: center;
                align-items: center;
                color: #0f172a;
            }
            .form-title {
                color: #0369a1;
                font-size: 28px;
                font-weight: bold;
                line-height: 1.2;
                padding-bottom: 12px;
                margin-bottom: 24px;
            }
            .form-wrapper {
                width: 75%;
                max-width: 400px;
            }
            .form-group {
                margin-bottom: 16px;
            }
            .form-input {
                width: 100%;
                border-radius: 12px;
                color: #1e293b;
                border: 1px solid #7dd3fc;
                background-color: white;
                height: 56px;
                padding: 16px;
                font-size: 16px;
                outline: none;
                transition: all 0.2s;
            }
            .form-input:focus {
                ring: 2px solid #0ea5e9;
                border-color: #0ea5e9;
                box-shadow: 0 0 0 2px rgba(14, 165, 233, 0.2);
            }
            .form-input::placeholder {
                color: #94a3b8;
            }
            .password-group {
                position: relative;
            }
            .password-toggle {
                position: absolute;
                right: 16px;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                cursor: pointer;
                color: #64748b;
                font-size: 18px;
            }
            .forgot-password {
                color: #0369a1;
                font-size: 14px;
                text-decoration: underline;
                margin-bottom: 16px;
                cursor: pointer;
                display: inline-block;
            }
            .forgot-password:hover {
                color: #1e40af;
            }
            .login-button {
                width: 100%;
                height: 48px;
                background-color: white;
                border: 1px solid #60a5fa;
                color: #0369a1;
                font-weight: bold;
                border-radius: 12px;
                transition: all 0.2s;
                cursor: pointer;
                font-size: 16px;
            }
            .login-button:hover {
                background-color: #bae6fd;
            }
            .login-button:disabled {
                opacity: 0.6;
                cursor: not-allowed;
            }
            .error-message {
                color: #dc2626;
                font-size: 14px;
                margin-top: 8px;
                display: block;
            }
            .remember-me {
                display: flex;
                align-items: center;
                margin-bottom: 16px;
                font-size: 14px;
                color: #475569;
            }
            .remember-me input {
                margin-right: 8px;
                width: auto;
                height: auto;
            }
            .registration-link {
                margin-top: 24px;
                text-align: center;
                color: #64748b;
            }
            .registration-link a {
                color: #0369a1;
                text-decoration: underline;
            }
            .registration-link a:hover {
                color: #1e40af;
            }
            .social-providers {
                margin-top: 32px;
                width: 75%;
                max-width: 400px;
            }
            .social-providers hr {
                margin: 16px 0;
                border: none;
                height: 1px;
                background-color: #cbd5e1;
            }
            .social-providers h2 {
                text-align: center;
                color: #475569;
                font-size: 16px;
                margin-bottom: 16px;
            }
            .social-list {
                list-style: none;
                padding: 0;
                margin: 0;
            }
            .social-list li {
                margin-bottom: 12px;
            }
            .social-button {
                display: block;
                width: 100%;
                padding: 12px 16px;
                background-color: white;
                border: 1px solid #cbd5e1;
                border-radius: 8px;
                text-decoration: none;
                color: #475569;
                text-align: center;
                transition: all 0.2s;
            }
            .social-button:hover {
                background-color: #f1f5f9;
                border-color: #94a3b8;
            }
            
            @media (max-width: 768px) {
                .login-container {
                    flex-direction: column;
                }
                .left-panel, .right-panel {
                    width: 100%;
                    height: auto;
                    min-height: 50vh;
                }
                .right-panel {
                    padding: 32px 16px;
                }
                .form-wrapper, .social-providers {
                    width: 90%;
                }
            }
        </style>

        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?display=swap&family=Noto+Sans:wght@400;500;700;900&family=Spline+Sans:wght@400;500;700"
        />

        <div class="login-container">
            <!-- Left: Tech training/coaching community photo -->
            <div class="left-panel"></div>

            <!-- Right: Login Form -->
            <div class="right-panel">
                <h2 class="form-title">Welcome back</h2>

                <div class="form-wrapper">
                    <#if realm.password>
                        <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                            <#if !usernameHidden??>
                                <div class="form-group">
                                    <input 
                                        tabindex="2" 
                                        id="username" 
                                        class="form-input" 
                                        name="username" 
                                        value="${(login.username!'')}"  
                                        type="text"
                                        placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                                        autofocus 
                                        autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                        dir="ltr"
                                    />
                                    <#if messagesPerField.existsError('username','password')>
                                        <span class="error-message" aria-live="polite">
                                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </#if>

                            <div class="form-group">
                                <div class="password-group">
                                    <input 
                                        tabindex="3" 
                                        id="password" 
                                        class="form-input" 
                                        name="password" 
                                        type="password" 
                                        placeholder="${msg("password")}"
                                        autocomplete="current-password"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                    <button 
                                        class="password-toggle" 
                                        type="button" 
                                        aria-label="${msg("showPassword")}"
                                        aria-controls="password" 
                                        data-password-toggle 
                                        tabindex="4"
                                        data-icon-show="${properties.kcFormPasswordVisibilityIconShow!'👁'}" 
                                        data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!'👁'}"
                                        data-label-show="${msg('showPassword')}" 
                                        data-label-hide="${msg('hidePassword')}">
                                        <span aria-hidden="true">👁</span>
                                    </button>
                                </div>
                                <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                    <span class="error-message" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </span>
                                </#if>
                            </div>

                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="remember-me">
                                    <input 
                                        tabindex="5" 
                                        id="rememberMe" 
                                        name="rememberMe" 
                                        type="checkbox" 
                                        <#if login.rememberMe??>checked</#if>
                                    />
                                    <label for="rememberMe">${msg("rememberMe")}</label>
                                </div>
                            </#if>

                            <#if realm.resetPasswordAllowed>
                                <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="forgot-password">
                                    ${msg("doForgotPassword")}
                                </a>
                            </#if>

                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <button 
                                tabindex="7" 
                                class="login-button" 
                                name="login" 
                                id="kc-login" 
                                type="submit">
                                ${msg("doLogIn")}
                            </button>
                        </form>
                    </#if>
                </div>

                <!-- Registration Link -->
                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                    <div class="registration-link">
                        <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                    </div>
                </#if>

                <!-- Social Providers -->
                <#if realm.password && social?? && social.providers?has_content>
                    <div class="social-providers">
                        <hr/>
                        <h2>${msg("identity-provider-login-label")}</h2>
                        <ul class="social-list">
                            <#list social.providers as p>
                                <li>
                                    <a 
                                        data-once-link 
                                        id="social-${p.alias}"
                                        class="social-button"
                                        href="${p.loginUrl}">
                                        <#if p.iconClasses?has_content>
                                            <i class="${p.iconClasses!}" aria-hidden="true"></i>
                                        </#if>
                                        <span>${p.displayName!}</span>
                                    </a>
                                </li>
                            </#list>
                        </ul>
                    </div>
                </#if>
            </div>
        </div>

        <@passkeys.conditionalUIData />
        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>

    <#elseif section = "info" >
        <!-- Info section handled in main form above -->
    <#elseif section = "socialProviders" >
        <!-- Social providers handled in main form above -->
    </#if>

</@layout.registrationLayout>
