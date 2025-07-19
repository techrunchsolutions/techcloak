<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('firstName','lastName','email','username','password','password-confirm'); section>
    <#if section = "header">
        <div class="text-center mb-4">
            <h1 class="auth-title">${msg("registerTitle")}</h1>
            <p class="auth-subtitle">${msg("registerSubtitle")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <div class="row mb-3">
                        <div class="col-md-6 mb-3 mb-md-0">
                            <label for="firstName" class="form-label">${msg("firstName")}</label>
                            <input type="text" id="firstName" class="form-control" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('firstName')>true</#if>"
                                   placeholder="${msg("firstName")}"
                            />
                            <#if messagesPerField.existsError('firstName')>
                                <span id="input-error-firstname" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('firstName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="col-md-6">
                            <label for="lastName" class="form-label">${msg("lastName")}</label>
                            <input type="text" id="lastName" class="form-control" name="lastName"
                                   value="${(register.formData.lastName!'')}"
                                   aria-invalid="<#if messagesPerField.existsError('lastName')>true</#if>"
                                   placeholder="${msg("lastName")}"
                            />
                            <#if messagesPerField.existsError('lastName')>
                                <span id="input-error-lastname" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('lastName'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">${msg("email")}</label>
                        <input type="text" id="email" class="form-control" name="email"
                               value="${(register.formData.email!'')}" autocomplete="email"
                               aria-invalid="<#if messagesPerField.existsError('email')>true</#if>"
                               placeholder="${msg("email")}"
                        />
                        <#if messagesPerField.existsError('email')>
                            <span id="input-error-email" class="field-error" aria-live="polite">
                                ${kcSanitize(messagesPerField.get('email'))?no_esc}
                            </span>
                        </#if>
                    </div>

                    <#if !realm.registrationEmailAsUsername>
                        <div class="mb-3">
                            <label for="username" class="form-label">${msg("username")}</label>
                            <input type="text" id="username" class="form-control" name="username"
                                   value="${(register.formData.username!'')}" autocomplete="username"
                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                   placeholder="${msg("username")}"
                            />
                            <#if messagesPerField.existsError('username')>
                                <span id="input-error-username" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if passwordRequired??>
                        <div class="mb-3">
                            <label for="password" class="form-label">${msg("password")}</label>
                            <div class="input-group">
                                <input type="password" id="password" class="form-control" name="password"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>"
                                       placeholder="${msg("password")}" />
                                <span class="input-group-text toggle-password" data-target="password" style="cursor: pointer; background-color:#ffffff0d; border: 1px solid #3b82f64d;">
                                    <i class="bi bi-eye-slash" style="color:white;"></i>
                                </span>
                            </div>
                            <#if messagesPerField.existsError('password')>
                                <span id="input-error-password" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="mb-4">
                            <label for="password-confirm" class="form-label">${msg("passwordConfirm")}</label>
                            <div class="input-group">
                                <input type="password" id="password-confirm" class="form-control" name="password-confirm"
                                       autocomplete="new-password"
                                       aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"
                                       placeholder="${msg("passwordConfirm")}" />
                                <span class="input-group-text toggle-password" data-target="password-confirm" style="cursor: pointer; background-color:#ffffff0d; background-color:#ffffff0d; border: 1px solid #3b82f64d;">
                                    <i class="bi bi-eye-slash" style="color:white;"></i>
                                </span>
                            </div>
                            <#if messagesPerField.existsError('password-confirm')>
                                <span id="input-error-password-confirm" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>
                    </#if>

                    <#if recaptchaRequired??>
                        <div class="form-group mb-4">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </#if>

                    <div class="mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="terms" name="terms" required>
                            <label class="form-check-label text-white" for="terms" style="font-size: 0.875rem;">
                                ${msg("termsText")} <a href="#" class="auth-link">${msg("termsTitle")}</a> ${msg("and")} <a href="#" class="auth-link">${msg("privacyPolicy")}</a>
                            </label>
                        </div>
                    </div>

                    <div id="kc-form-buttons">
                        <input class="submit-button btn" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info">
        <div class="text-center">
            <p class="text-white mb-0" style="font-size: 0.875rem;">
                ${msg("alreadyHaveAccount")}
                <a href="${url.loginUrl}" class="auth-link">${msg("backToLogin")}</a>
            </p>
        </div>
    </#if>

    <!-- Bootstrap Icons (if not already in layout.ftl) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

    <!-- Register JS -->
    <script src="${url.resourcesPath}/js/register.js"></script>
</@layout.registrationLayout>
