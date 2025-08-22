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
        <style>
            body {
                font-family: 'Spline Sans', 'Noto Sans', sans-serif;
            }
            .register-container {<#import "template.ftl" as layout>
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
        <style>
            body {
                font-family: 'Spline Sans', 'Noto Sans', sans-serif;
            }
            .register-container {
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
                padding: 32px 16px;
                overflow-y: auto;
            }
            .form-title {
                color: #0369a1;
                font-size: 28px;
                font-weight: bold;
                line-height: 1.2;
                padding-bottom: 12px;
                margin-bottom: 24px;
                text-align: center;
            }
            .form-wrapper {
                width: 75%;
                max-width: 400px;
            }
            .form-group {
                margin-bottom: 16px;
            }
            .form-label {
                display: block;
                color: #475569;
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 6px;
            }
            .required-asterisk {
                color: #dc2626;
                margin-left: 4px;
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
                box-sizing: border-box;
            }
            .form-input:focus {
                border-color: #0ea5e9;
                box-shadow: 0 0 0 2px rgba(14, 165, 233, 0.2);
            }
            .form-input::placeholder {
                color: #94a3b8;
            }
            .form-input[aria-invalid="true"] {
                border-color: #dc2626;
                box-shadow: 0 0 0 2px rgba(220, 38, 38, 0.1);
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
                padding: 4px;
            }
            .password-toggle:hover {
                color: #475569;
            }
            .error-message {
                color: #dc2626;
                font-size: 14px;
                margin-top: 6px;
                display: block;
                line-height: 1.4;
            }
            .register-button {
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
                margin-top: 8px;
            }
            .register-button:hover:not(:disabled) {
                background-color: #bae6fd;
            }
            .register-button:disabled {
                opacity: 0.6;
                cursor: not-allowed;
            }
            .back-to-login {
                margin-top: 20px;
                text-align: center;
            }
            .back-to-login a {
                color: #0369a1;
                text-decoration: underline;
                font-size: 14px;
            }
            .back-to-login a:hover {
                color: #1e40af;
            }
            .terms-checkbox {
                display: flex;
                align-items: flex-start;
                margin: 20px 0;
                font-size: 14px;
                color: #475569;
                line-height: 1.4;
            }
            .terms-checkbox input {
                margin-right: 10px;
                margin-top: 2px;
                width: auto;
                height: auto;
                min-width: 16px;
                min-height: 16px;
            }
            .terms-checkbox a {
                color: #0369a1;
                text-decoration: underline;
            }
            .terms-checkbox a:hover {
                color: #1e40af;
            }
            .recaptcha-container {
                margin: 16px 0;
                display: flex;
                justify-content: center;
            }
            .form-help-text {
                font-size: 12px;
                color: #64748b;
                margin-top: 4px;
                line-height: 1.3;
            }
            
            @media (max-width: 768px) {
                .register-container {
                    flex-direction: column;
                }
                .left-panel {
                    width: 100%;
                    height: 200px;
                    min-height: 200px;
                }
                .right-panel {
                    width: 100%;
                    height: auto;
                    min-height: calc(100vh - 200px);
                    padding: 24px 16px;
                }
                .form-wrapper {
                    width: 90%;
                }
                .form-title {
                    font-size: 24px;
                    margin-bottom: 16px;
                }
            }
        </style>

        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?display=swap&family=Noto+Sans:wght@400;500;700;900&family=Spline+Sans:wght@400;500;700"
        />

        <div class="register-container">
            <!-- Left: Tech training/coaching community photo -->
            <div class="left-panel"></div>

            <!-- Right: Registration Form -->
            <div class="right-panel">
                <h2 class="form-title">Sign Up</h2>

                <div class="form-wrapper">
                    <form id="kc-register-form" action="${url.registrationAction}" method="post">
                        
                        <@userProfileCommons.userProfileFormFields; callback, attribute>
                            <#if callback = "beforeField">
                                <div class="form-group">
                                    <#if attribute.required>
                                        <label for="${attribute.name}" class="form-label">
                                            ${attribute.displayName!''}
                                            <span class="required-asterisk">*</span>
                                        </label>
                                    <#else>
                                        <label for="${attribute.name}" class="form-label">
                                            ${attribute.displayName!''}
                                        </label>
                                    </#if>
                            </#if>
                            
                            <#if callback = "afterField">
                                    <#if messagesPerField.existsError(attribute.name)>
                                        <span class="error-message" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get(attribute.name))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                                
                                <#-- render password fields just under the username or email (if used as username) -->
                                <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                    <div class="form-group">
                                        <label for="password" class="form-label">
                                            ${msg("password")} <span class="required-asterisk">*</span>
                                        </label>
                                        <div class="password-group">
                                            <input 
                                                type="password" 
                                                id="password" 
                                                class="form-input" 
                                                name="password"
                                                placeholder="${msg("password")}"
                                                autocomplete="new-password"
                                                aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                            />
                                            <button 
                                                class="password-toggle" 
                                                type="button" 
                                                aria-label="${msg('showPassword')}"
                                                aria-controls="password"  
                                                data-password-toggle
                                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!'👁'}" 
                                                data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!'👁'}"
                                                data-label-show="${msg('showPassword')}" 
                                                data-label-hide="${msg('hidePassword')}">
                                                <span aria-hidden="true">👁</span>
                                            </button>
                                        </div>
                                        <#if messagesPerField.existsError('password')>
                                            <span class="error-message" aria-live="polite">
                                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm" class="form-label">
                                            ${msg("passwordConfirm")} <span class="required-asterisk">*</span>
                                        </label>
                                        <div class="password-group">
                                            <input 
                                                type="password" 
                                                id="password-confirm" 
                                                class="form-input"
                                                name="password-confirm" 
                                                placeholder="${msg("passwordConfirm")}"
                                                autocomplete="new-password"
                                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                            />
                                            <button 
                                                class="password-toggle" 
                                                type="button" 
                                                aria-label="${msg('showPassword')}"
                                                aria-controls="password-confirm"  
                                                data-password-toggle
                                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!'👁'}" 
                                                data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!'👁'}"
                                                data-label-show="${msg('showPassword')}" 
                                                data-label-hide="${msg('hidePassword')}">
                                                <span aria-hidden="true">👁</span>
                                            </button>
                                        </div>
                                        <#if messagesPerField.existsError('password-confirm')>
                                            <span class="error-message" aria-live="polite">
                                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                </#if>
                            </#if>
                        </@userProfileCommons.userProfileFormFields>

                        <@registerCommons.termsAcceptance/>

                        <#if recaptchaRequired?? && (recaptchaVisible!false)>
                            <div class="recaptcha-container">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                            </div>
                        </#if>

                        <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                            <script>
                                function onSubmitRecaptcha(token) {
                                    document.getElementById("kc-register-form").requestSubmit();
                                }
                            </script>
                            <button 
                                class="register-button g-recaptcha" 
                                data-sitekey="${recaptchaSiteKey}" 
                                data-callback='onSubmitRecaptcha' 
                                data-action='${recaptchaAction}' 
                                type="submit">
                                ${msg("doRegister")}
                            </button>
                        <#else>
                            <button class="register-button" type="submit">
                                ${msg("doRegister")}
                            </button>
                        </#if>

                        <div class="back-to-login">
                            <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>
        <script>
            // Override default input styling for user profile fields
            document.addEventListener('DOMContentLoaded', function() {
                // Apply custom styling to dynamically generated user profile inputs
                const inputs = document.querySelectorAll('#kc-register-form input[type="text"], #kc-register-form input[type="email"], #kc-register-form textarea, #kc-register-form select');
                inputs.forEach(function(input) {
                    if (!input.classList.contains('form-input')) {
                        input.classList.add('form-input');
                    }
                });

                // Style checkboxes for terms acceptance
                const checkboxes = document.querySelectorAll('#kc-register-form input[type="checkbox"]');
                checkboxes.forEach(function(checkbox) {
                    const parent = checkbox.parentElement;
                    if (parent && !parent.classList.contains('terms-checkbox')) {
                        parent.classList.add('terms-checkbox');
                    }
                });
            });
        </script>
    </#if>
</@layout.registrationLayout>
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
                overflow-y: auto;
                padding: 20px 0;
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
                box-sizing: border-box;
            }
            .form-input:focus {
                border-color: #0ea5e9;
                box-shadow: 0 0 0 2px rgba(14, 165, 233, 0.2);
            }
            .form-input::placeholder {
                color: #94a3b8;
            }
            .form-label {
                display: block;
                color: #475569;
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 8px;
            }
            .required {
                color: #dc2626;
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
            .register-button {
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
            .register-button:hover {
                background-color: #bae6fd;
            }
            .register-button:disabled {
                opacity: 0.6;
                cursor: not-allowed;
            }
            .error-message {
                color: #dc2626;
                font-size: 14px;
                margin-top: 8px;
                display: block;
            }
            .back-to-login {
                margin-top: 24px;
                text-align: center;
                color: #64748b;
            }
            .back-to-login a {
                color: #0369a1;
                text-decoration: underline;
            }
            .back-to-login a:hover {
                color: #1e40af;
            }
            .terms-checkbox {
                display: flex;
                align-items: flex-start;
                margin-bottom: 16px;
                font-size: 14px;
                color: #475569;
            }
            .terms-checkbox input {
                margin-right: 12px;
                margin-top: 4px;
                width: auto;
                height: auto;
                flex-shrink: 0;
            }
            .terms-checkbox label {
                line-height: 1.4;
                margin: 0;
            }
            .terms-checkbox a {
                color: #0369a1;
                text-decoration: underline;
            }
            .recaptcha-container {
                margin-bottom: 16px;
                display: flex;
                justify-content: center;
            }
            
            @media (max-width: 768px) {
                .register-container {
                    flex-direction: column;
                }
                .left-panel {
                    width: 100%;
                    height: 30vh;
                    min-height: 200px;
                }
                .right-panel {
                    width: 100%;
                    height: auto;
                    min-height: 70vh;
                    padding: 32px 16px;
                }
                .form-wrapper {
                    width: 90%;
                }
            }
        </style>

        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?display=swap&family=Noto+Sans:wght@400;500;700;900&family=Spline+Sans:wght@400;500;700"
        />

        <div class="register-container">
            <!-- Left: Tech training/coaching community photo -->
            <div class="left-panel"></div>

            <!-- Right: Registration Form -->
            <div class="right-panel">
                <h2 class="form-title">Sign Up</h2>

                <div class="form-wrapper">
                    <form id="kc-register-form" action="${url.registrationAction}" method="post">

                        <@userProfileCommons.userProfileFormFields; callback, attribute>
                            <#if callback = "beforeField">
                                <div class="form-group">
                                    <#if attribute.required>
                                        <label for="${attribute.name}" class="form-label">
                                            ${msg(attribute.displayName!'')} <span class="required">*</span>
                                        </label>
                                    <#else>
                                        <label for="${attribute.name}" class="form-label">
                                            ${msg(attribute.displayName!'')}
                                        </label>
                                    </#if>
                                    <input 
                                        type="${(attribute.autocomplete!'')=='new-password'?then('password', (attribute.name == 'email')?then('email', 'text'))}"
                                        id="${attribute.name}" 
                                        class="form-input" 
                                        name="${attribute.name}" 
                                        value="${(attribute.value!'')}"
                                        <#if attribute.autocomplete?has_content>autocomplete="${attribute.autocomplete}"</#if>
                                        <#if attribute.required>required</#if>
                                        aria-invalid="<#if messagesPerField.existsError('${attribute.name}')>true</#if>"
                                        placeholder="${msg(attribute.displayName!'')}"
                                    />
                                    <#if messagesPerField.existsError('${attribute.name}')>
                                        <span class="error-message" aria-live="polite">
                                            ${kcSanitize(messagesPerField.get('${attribute.name}'))?no_esc}
                                        </span>
                                    </#if>
                                </div>
                            </#if>

                            <#if callback = "afterField">
                                <#-- render password fields just under the username or email (if used as username) -->
                                <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                    <div class="form-group">
                                        <label for="password" class="form-label">
                                            ${msg("password")} <span class="required">*</span>
                                        </label>
                                        <div class="password-group">
                                            <input 
                                                type="password" 
                                                id="password" 
                                                class="form-input" 
                                                name="password"
                                                placeholder="${msg("password")}"
                                                autocomplete="new-password"
                                                aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                            />
                                            <button 
                                                class="password-toggle" 
                                                type="button" 
                                                aria-label="${msg('showPassword')}"
                                                aria-controls="password" 
                                                data-password-toggle
                                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!'👁'}" 
                                                data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!'👁'}"
                                                data-label-show="${msg('showPassword')}" 
                                                data-label-hide="${msg('hidePassword')}">
                                                <span aria-hidden="true">👁</span>
                                            </button>
                                        </div>
                                        <#if messagesPerField.existsError('password')>
                                            <span class="error-message" aria-live="polite">
                                                ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>

                                    <div class="form-group">
                                        <label for="password-confirm" class="form-label">
                                            ${msg("passwordConfirm")} <span class="required">*</span>
                                        </label>
                                        <div class="password-group">
                                            <input 
                                                type="password" 
                                                id="password-confirm" 
                                                class="form-input"
                                                name="password-confirm" 
                                                placeholder="${msg("passwordConfirm")}"
                                                autocomplete="new-password"
                                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                            />
                                            <button 
                                                class="password-toggle" 
                                                type="button" 
                                                aria-label="${msg('showPassword')}"
                                                aria-controls="password-confirm" 
                                                data-password-toggle
                                                data-icon-show="${properties.kcFormPasswordVisibilityIconShow!'👁'}" 
                                                data-icon-hide="${properties.kcFormPasswordVisibilityIconHide!'👁'}"
                                                data-label-show="${msg('showPassword')}" 
                                                data-label-hide="${msg('hidePassword')}">
                                                <span aria-hidden="true">👁</span>
                                            </button>
                                        </div>
                                        <#if messagesPerField.existsError('password-confirm')>
                                            <span class="error-message" aria-live="polite">
                                                ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                            </span>
                                        </#if>
                                    </div>
                                </#if>
                            </#if>
                        </@userProfileCommons.userProfileFormFields>

                        <@registerCommons.termsAcceptance/>

                        <#if recaptchaRequired?? && (recaptchaVisible!false)>
                            <div class="recaptcha-container">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                            </div>
                        </#if>

                        <#if recaptchaRequired?? && !(recaptchaVisible!false)>
                            <script>
                                function onSubmitRecaptcha(token) {
                                    document.getElementById("kc-register-form").requestSubmit();
                                }
                            </script>
                            <button 
                                class="register-button g-recaptcha" 
                                data-sitekey="${recaptchaSiteKey}" 
                                data-callback='onSubmitRecaptcha' 
                                data-action='${recaptchaAction}' 
                                type="submit">
                                Create Account
                            </button>
                        <#else>
                            <button class="register-button" type="submit">
                                Create Account
                            </button>
                        </#if>

                        <div class="back-to-login">
                            <span>Already have an account? <a href="${url.loginUrl}">Sign in</a></span>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script type="module" src="${url.resourcesPath}/js/passwordVisibility.js"></script>

    </#if>
</@layout.registrationLayout>

