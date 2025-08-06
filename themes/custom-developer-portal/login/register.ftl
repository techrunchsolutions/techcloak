<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <h1 class="auth-title">Create your account</h1>
        <p class="auth-subtitle">Join thousands of developers building with our APIs</p>
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css">
    <#elseif section = "form">
        <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">
            <!-- Name Fields -->
            <div class="row mb-4">
                <div class="col-md-6 mb-3 mb-md-0">
                    <label for="firstName" class="form-label">${msg("firstName")}</label>
                    <input
                        type="text"
                        id="firstName"
                        class="form-control <#if messagesPerField.existsError('firstName')>is-invalid</#if>"
                        name="firstName"
                        value="${(register.formData.firstName!'')}"
                        placeholder="${msg("firstName")}"
                        aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                    />
                    <#if messagesPerField.existsError('firstName')>
                        <div class="field-error">
                            ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                        </div>
                    </#if>
                </div>
                <div class="col-md-6">
                    <label for="lastName" class="form-label">${msg("lastName")}</label>
                    <input
                        type="text"
                        id="lastName"
                        class="form-control <#if messagesPerField.existsError('lastName')>is-invalid</#if>"
                        name="lastName"
                        value="${(register.formData.lastName!'')}"
                        placeholder="${msg("lastName")}"
                        aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                    />
                    <#if messagesPerField.existsError('lastName')>
                        <div class="field-error">
                            ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                        </div>
                    </#if>
                </div>
            </div>

            <!-- Email Field -->
            <div class="mb-4">
                <label for="email" class="form-label">${msg("email")}</label>
                <input
                    type="text"
                    id="email"
                    class="form-control <#if messagesPerField.existsError('email')>is-invalid</#if>"
                    name="email"
                    value="${(register.formData.email!'')}"
                    autocomplete="email"
                    placeholder="${msg("email")}"
                    aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                />
                <#if messagesPerField.existsError('email')>
                    <div class="field-error">
                        ${kcSanitize(messagesPerField.get('email'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Username Field (if different from email) -->
            <#if !realm.registrationEmailAsUsername>
                <div class="mb-4">
                    <label for="username" class="form-label">${msg("username")}</label>
                    <input
                        type="text"
                        id="username"
                        class="form-control <#if messagesPerField.existsError('username')>is-invalid</#if>"
                        name="username"
                        value="${(register.formData.username!'')}"
                        autocomplete="username"
                        placeholder="${msg("username")}"
                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                    />
                    <#if messagesPerField.existsError('username')>
                        <div class="field-error">
                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                        </div>
                    </#if>
                </div>
            </#if>

            <!-- Password Field -->
            <div class="mb-4">
                <label for="password" class="form-label">${msg("password")}</label>
                <div class="position-relative">
                    <input
                        type="password"
                        id="password"
                        class="form-control <#if messagesPerField.existsError('password','password-confirm')>is-invalid</#if>"
                        name="password"
                        autocomplete="new-password"
                        placeholder="${msg("password")}"
                        aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                    />
                </div>

                <!-- Password Strength Indicator -->
                <div class="password-strength mt-2">
                    <div class="strength-bar">
                        <div id="strength-fill" class="strength-fill"></div>
                    </div>
                    <ul class="requirements-list">
                        <li id="req-length" class="requirement-item">
                            <span class="requirement-icon">○</span>
                            At least 8 characters
                        </li>
                        <li id="req-uppercase" class="requirement-item">
                            <span class="requirement-icon">○</span>
                            One uppercase letter
                        </li>
                        <li id="req-lowercase" class="requirement-item">
                            <span class="requirement-icon">○</span>
                            One lowercase letter
                        </li>
                        <li id="req-number" class="requirement-item">
                            <span class="requirement-icon">○</span>
                            One number
                        </li>
                    </ul>
                </div>

                <#if messagesPerField.existsError('password')>
                    <div class="field-error">
                        ${kcSanitize(messagesPerField.get('password'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- Confirm Password Field -->
            <div class="mb-4">
                <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                <input
                    type="password"
                    id="password-confirm"
                    class="form-control <#if messagesPerField.existsError('password-confirm')>is-invalid</#if>"
                    name="password-confirm"
                    autocomplete="new-password"
                    placeholder="${msg("passwordConfirm")}"
                    aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                />
                <#if messagesPerField.existsError('password-confirm')>
                    <div class="field-error">
                        ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                    </div>
                </#if>
            </div>

            <!-- reCAPTHA -->
            <#if recaptchaRequired??>
                <div class="form-group mb-4">
                    <div class="${properties.kcInputWrapperClass!}">
                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                    </div>
                </div>
            </#if>

            <div class="mt-4">
                <input
                    class="submit-button"
                    type="submit"
                    value="${msg("doRegister")}"
                />
            </div>
        </form>
    <#elseif section = "info" >
        <div id="kc-registration-container">
            <div id="kc-registration">
                <span class="text-white">${msg("alreadyHaveAccount")} <a href="${url.loginUrl}" class="auth-link">${msg("doLogIn")}</a></span>
            </div>
        </div>
    </#if>

   

    

    <#if recaptchaRequired??>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
    </#if>
    <script src="${url.resourcesPath}/js/register.js"></script>
</@layout.registrationLayout>
