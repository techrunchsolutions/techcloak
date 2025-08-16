<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        ${msg("registerTitle")}
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

            .button_primary:hover:not(:disabled) {
                background-color: #2563eb;
            }

            .button_primary:disabled {
                background-color: #9ca3af;
                cursor: not-allowed;
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

            .input-success {
                border-color: #10b981;
            }

            .error-message {
                color: #ef4444;
                font-size: 0.875rem;
                margin-top: 0.25rem;
            }

            .success-message {
                color: #10b981;
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

            .requirements-list {
                margin-top: 0.5rem;
                font-size: 0.875rem;
            }

            .requirement-item {
                display: flex;
                align-items: center;
                gap: 0.5rem;
                margin-bottom: 0.25rem;
            }

            .requirement-icon {
                width: 1rem;
                height: 1rem;
                display: inline-block;
            }

            .requirement-text {
                color: #6b7280;
            }

            .requirement-met .requirement-icon {
                color: #10b981;
            }

            .requirement-met .requirement-text {
                color: #10b981;
            }

            .requirement-failed .requirement-icon {
                color: #ef4444;
            }

            .requirement-failed .requirement-text {
                color: #ef4444;
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
        </style>

        <div class="text-center mb-4">
            <a href="${url.loginUrl}">
                <svg width="40" height="40" viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg" style="color: var(--primary-color);">
                    <path d="M8 8h6v6H8V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zm8 0h6v6h-6V8zM8 16h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 24h6v6H8v-6zm8 0h6v6h-6v-6zm16 0h6v6h-6v-6zM8 32h6v6H8v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zm8 0h6v6h-6v-6zM8 40h6v6H8v-6zm16 0h6v6h-6v-6zm8 0h6v6h-6v-6z" fill="currentColor"/>
                    <path d="M20 20h8v8h-8v-8z" fill="currentColor" opacity="0.6"/>
                </svg>
            </a>
            <h1 style="font-size: 1.875rem; font-weight: bold; color: var(--text-primary); margin: 1rem 0 0.5rem 0;">${msg("registerTitle")}</h1>
            <p style="color: var(--text-secondary);">Join our platform to manage your software development projects.</p>
        </div>

        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div style="padding: 1rem; border-radius: 0.375rem; margin-bottom: 1rem; <#if message.type = 'error'>background-color: #fef2f2; color: #dc2626; border: 1px solid #fecaca;<#elseif message.type = 'success'>background-color: #f0fdf4; color: #16a34a; border: 1px solid #bbf7d0;<#else>background-color: #eff6ff; color: #2563eb; border: 1px solid #bfdbfe;</#if>">
                ${kcSanitize(message.summary)?no_esc}
            </div>
        </#if>

        <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-6">
            <div class="form-group">
                <label class="form-label" for="firstName">${msg("firstName")}</label>
                <input
                    type="text"
                    id="firstName"
                    name="firstName"
                    value="${(register.formData.firstName!'')}"
                    class="input <#if messagesPerField.existsError('firstName')>input-error</#if>"
                    placeholder="John"
                    autocomplete="given-name"
                    required
                />
                <#if messagesPerField.existsError('firstName')>
                    <div class="error-message">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label class="form-label" for="lastName">${msg("lastName")}</label>
                <input
                    type="text"
                    id="lastName"
                    name="lastName"
                    value="${(register.formData.lastName!'')}"
                    class="input <#if messagesPerField.existsError('lastName')>input-error</#if>"
                    placeholder="Doe"
                    autocomplete="family-name"
                    required
                />
                <#if messagesPerField.existsError('lastName')>
                    <div class="error-message">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label class="form-label" for="email">${msg("email")}</label>
                <input
                    type="text"
                    id="email"
                    name="email"
                    value="${(register.formData.email!'')}"
                    class="input <#if messagesPerField.existsError('email')>input-error</#if>"
                    placeholder="you@example.com"
                    autocomplete="email"
                    required
                />
                <#if messagesPerField.existsError('email')>
                    <div class="error-message">${kcSanitize(messagesPerField.get('email'))?no_esc}</div>
                </#if>
            </div>

            <#if !realm.registrationEmailAsUsername>
                <div class="form-group">
                    <label class="form-label" for="username">${msg("username")}</label>
                    <input
                        type="text"
                        id="username"
                        name="username"
                        value="${(register.formData.username!'')}"
                        class="input <#if messagesPerField.existsError('username')>input-error</#if>"
                        placeholder="username"
                        autocomplete="username"
                        required
                    />
                    <#if messagesPerField.existsError('username')>
                        <div class="error-message">${kcSanitize(messagesPerField.get('username'))?no_esc}</div>
                    </#if>
                </div>
            </#if>

            <div class="form-group">
                <label class="form-label" for="password">${msg("password")}</label>
                <div class="password-input-container">
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="input"
                        style="padding-right: 2.5rem;"
                        placeholder="••••••••"
                        autocomplete="new-password"
                        required
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
                <div id="password-requirements" class="requirements-list">
                    <div id="password-length" class="requirement-item">
                        <span class="requirement-icon">○</span>
                        <span class="requirement-text">At least 8 characters</span>
                    </div>
                    <div id="password-mix" class="requirement-item">
                        <span class="requirement-icon">○</span>
                        <span class="requirement-text">Mix of letters and numbers</span>
                    </div>
                </div>
                <#if messagesPerField.existsError('password')>
                    <div class="error-message">${kcSanitize(messagesPerField.get('password'))?no_esc}</div>
                </#if>
            </div>

            <div class="form-group">
                <label class="form-label" for="password-confirm">${msg("passwordConfirm")}</label>
                <div class="password-input-container">
                    <input
                        type="password"
                        id="password-confirm"
                        name="password-confirm"
                        class="input"
                        style="padding-right: 2.5rem;"
                        placeholder="••••••••"
                        autocomplete="new-password"
                        required
                    />
                    <button type="button" class="password-toggle" onclick="togglePasswordVisibility('password-confirm')" aria-label="Toggle password confirmation visibility">
                        <svg id="password-confirm-eye-open" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                        </svg>
                        <svg id="password-confirm-eye-closed" class="hidden" width="20" height="20" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21" />
                        </svg>
                    </button>
                </div>
                <div id="password-match-message" class="error-message hidden">Passwords do not match</div>
                <div id="password-match-success" class="success-message hidden">Passwords match</div>
                <#if messagesPerField.existsError('password-confirm')>
                    <div class="error-message">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</div>
                </#if>
            </div>

            <#if recaptchaRequired??>
                <div class="form-group">
                    <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                </div>
            </#if>

            <button id="register-button" class="button_primary" type="submit" disabled>
                <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                    <path fill-rule="evenodd" d="M10 18a8 8 0 100-16 8 8 0 000 16zm1-11a1 1 0 10-2 0v2H7a1 1 0 100 2h2v2a1 1 0 102 0v-2h2a1 1 0 100-2h-2V7z" clip-rule="evenodd" />
                </svg>
                ${msg("doRegister")}
            </button>
        </form>

        <div class="divider">
            <span class="divider-text">Already have an account?</span>
        </div>

        <a href="${url.loginUrl}" class="button_secondary">
            <svg width="20" height="20" viewBox="0 0 20 20" fill="currentColor">
                <path fill-rule="evenodd" d="M5 9V7a5 5 0 0110 0v2a2 2 0 012 2v5a2 2 0 01-2 2H5a2 2 0 01-2-2v-5a2 2 0 012-2zm8-2v2H7V7a3 3 0 016 0z" clip-rule="evenodd" />
            </svg>
            ${msg("backToLogin")}
        </a>
    </#if>
</@layout.registrationLayout>
