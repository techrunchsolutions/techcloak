<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=social.displayInfo displayWide=(realm.password && social.providers??); section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>
            :root {
                --primary-color: #0d7ff2;
                --secondary-color: #f2f7ff;
                --background-color: #ffffff;
                --text-primary: #1e293b;
                --text-secondary: #64748b;
                --accent-color: #e0f2fe;
            }

            .button_primary {
                background-color: var(--primary-color);
                color: white;
                border-radius: 0.375rem;
                padding: 0.75rem 1rem;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
            }

            .button_primary:hover {
                background-color: #2563eb;
            }

            .button_secondary {
                background-color: var(--secondary-color);
                color: var(--primary-color);
                border-radius: 0.375rem;
                padding: 0.75rem 1rem;
                border: none;
                cursor: pointer;
                transition: all 0.3s ease;
                width: 100%;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 0.5rem;
                text-decoration: none;
            }

            .button_secondary:hover {
                background-color: #dbeafe;
            }

            .input {
                background-color: white;
                border: 1px solid #d1d5db;
                border-radius: 0.375rem;
                padding: 0.5rem 0.75rem;
                width: 100%;
                transition: all 0.2s ease;
            }

            .input:focus {
                outline: none;
                border-color: var(--primary-color);
                box-shadow: 0 0 0 3px rgba(13, 127, 242, 0.1);
            }

            .input-error {
                border-color: #ef4444;
            }

            .error-message {
                color: #ef4444;
                font-size: 0.875rem;
                margin-top: 0.25rem;
            }

            .password-input-container {
                position: relative;
            }

            .password-toggle {
                position: absolute;
                right: 0.75rem;
                top: 50%;
                transform: translateY(-50%);
                background: none;
                border: none;
                cursor: pointer;
                color: #6b7280;
                padding: 0;
                width: 1.25rem;
                height: 1.25rem;
            }

            .password-toggle:hover {
                color: #374151;
            }

            .form-group {
                margin-bottom: 1.5rem;
            }

            .form-label {
                display: block;
                font-size: 0.875rem;
                font-weight: 500;
                color: var(--text-primary);
                margin-bottom: 0.25rem;
            }

            .checkbox-group {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            .checkbox {
                width: 1rem;
                height: 1rem;
                accent-color: var(--primary-color);
            }

            .forgot-password {
                color: var(--primary-color);
                text-decoration: none;
                font-size: 0.875rem;
            }

            .forgot-password:hover {
                text-decoration: underline;
            }

            .flex-between {
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .divider {
                position: relative;
                margin: 1.5rem 0;
            }

            .divider::before {
                content: '';
                position: absolute;
                top: 50%;
                left: 0;
                right: 0;
                height: 1px;
                background-color: #d1d5db;
            }

            .divider-text {
                background-color: white;
                padding: 0 0.5rem;
                color: #6b7280;
                font-size: 0.875rem;
                position: relative;
                display: inline-block;
                left: 50%;
                transform: translateX(-50%);
            }

            .hidden {
                display: none;
            }

            .text-center {
                text-align: center;
            }

            .mb-4 {
                margin-bottom: 1rem;
            }

            .mt-2 {
                margin-top: 0.5rem;
            }

            .space-y-6 > * + * {
                margin-top: 1.5rem;
            }

            .social-providers {
                display: flex;
                flex-direction: column;
                gap: 0.75rem;
            }
        </style>

        <div class="text-center mb-4">
            <a href="#">
                <svg width="40" height="40" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" style="color: var(--primary-color);">
                    <path d="M8 8h6v6H8V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zM8 16h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 24h6v6H8v-6zm8 0h6v6h-6v-6zm16 0h6v6h-6v-6zM8 32h6v6H8v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 40h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6z" fill="currentColor"/>
                    <path d="M20 20h8v8h-8v-8z" fill="currentColor" opacity="0.6"/>
                </svg>
            </a>
            <h1 style="font-size: 1.875rem; font-weight: bold; color: var(--text-primary); margin: 1rem 0 0.5rem 0;">${msg("loginAccountTitle")}</h1>
            <p style="color: var(--text-secondary);">Welcome back! Sign in to your account to continue.</p>
        </div>

        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div style="padding: 1rem; border-radius: 0.375rem; margin-bottom: 1rem; <#if message.type = 'error'>background-color: #fef2f2; color: #dc2626; border: 1px solid #fecaca;<#elseif message.type = 'success'>background-color: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0;<#else>background-color: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe;</#if>">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="space-y-6">
                <div class="form-group">
                    <label class="form-label" for="username">
                        <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                    </label>
                    <input
                        tabindex="1"
                        id="username"
                        name="username"
                        value="${(login.username!'')}"
                        type="text"
                        autofocus
                        autocomplete="<#if realm.loginWithEmailAllowed>email<#else>username</#if>"
                        class="input <#if messagesPerField.existsError('username','password')>input-error</#if>"
                        placeholder="<#if !realm.loginWithEmailAllowed>username<#elseif !realm.registrationEmailAsUsername>username or email<#else>you@example.com</#if>"
                    />
                    <#if messagesPerField.existsError('username','password')>
                        <div class="error-message">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</div>
                    </#if>
                </div>

                <div class="form-group">
                    <label class="form-label" for="password">${msg("password")}</label>
                    <div class="password-input-container">
                        <input
                            tabindex="2"
                            id="password"
                            name="password"
                            type="password"
                            autocomplete="current-password"
                            class="input <#if messagesPerField.existsError('username','password')>input-error</#if>"
                            style="padding-right: 2.5rem;"
                            placeholder="••••••••"
                        />
                        <button type="button" class="password-toggle" onclick="togglePasswordVisibility('password')" aria-label="Toggle password visibility">
                            <svg id="password-eye-open" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                            </svg>
                            <svg id="password-eye-closed" class="hidden" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21" />
                            </svg>
                        </button>
                    </div>
                </div>

                <div class="flex-between">
                    <#if realm.rememberMe && !usernameHidden??>
                        <div class="checkbox-group">
                            <input
                                tabindex="3"
                                id="rememberMe"
                                name="rememberMe"
                                type="checkbox"
                                <#if login.rememberMe??>checked</#if>
                                class="checkbox"
                            />
                            <label for="rememberMe" style="font-size: 0.875rem; color: #374151;">
                                ${msg("rememberMe")}
                            </label>
                        </div>
                    </#if>
                    <#if realm.resetPasswordAllowed>
                        <a href="${url.loginResetCredentialsUrl}" class="forgot-password">
                            ${msg("doForgotPassword")}
                        </a>
                    </#if>
                </div>

                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>

                <button tabindex="4" class="button_primary" name="login" id="kc-login" type="submit">
                    <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                        <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
                    </svg>
                    ${msg("doLogIn")}
                </button>
            </form>
        </#if>

        <#if realm.password && social.providers??>
            <div class="divider">
                <span class="divider-text">Or continue with</span>
            </div>

            <div class="social-providers">
                <#list social.providers as p>
                    <a id="social-${p.alias}" class="button_secondary" href="${p.loginUrl}">
                        <#if p.iconClasses?has_content>
                            <i class="${p.iconClasses}" aria-hidden="true"></i>
                        </#if>
                        <span>${p.displayName!}</span>
                    </a>
                </#list>
            </div>
        </#if>

        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div class="divider">
                <span class="divider-text">Don't have an account?</span>
            </div>

            <a tabindex="6" href="${url.registrationUrl}" class="button_secondary">
                <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
                </svg>
                ${msg("doRegister")}
            </a>
        </#if>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
