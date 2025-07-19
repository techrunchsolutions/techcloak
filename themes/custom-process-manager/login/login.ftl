<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <div class="text-center mb-4">
            <h1 class="auth-title">${msg("loginAccountTitle")}</h1>
            <p class="auth-subtitle">${msg("loginAccountSubtitle")}</p>
        </div>
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                        <div class="mb-3">
                            <label for="username" class="form-label">
                                <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                            </label>
                            <input tabindex="1" id="username" class="form-control" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="off"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                   placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                            />
                            <#if messagesPerField.existsError('username','password')>
                                <span id="input-error" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="mb-3 position-relative">
                            <label for="password" class="form-label">${msg("password")}</label>
                            <div class="input-group">
                                <input tabindex="2" id="password" class="form-control" name="password" type="password" autocomplete="off"
                                       aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                       placeholder="${msg("password")}" />
                                <span class="input-group-text" id="toggle-password" style="cursor: pointer; background-color:#ffffff0d; border: 1px solid #3b82f64d;">
                                    <i class="bi bi-eye-slash" id="eye-icon" style="color: white;"></i>
                                </span>
                            </div>
                            <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                                <span id="input-error" class="field-error" aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </span>
                            </#if>
                        </div>

                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <#if realm.rememberMe && !usernameHidden??>
                                <div class="form-check">
                                    <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox" class="form-check-input"
                                           <#if login.rememberMe??>checked</#if>>
                                    <label class="form-check-label text-white" for="rememberMe" style="font-size: 0.875rem;">
                                        ${msg("rememberMe")}
                                    </label>
                                </div>
                            </#if>
                            <#if realm.resetPasswordAllowed>
                                <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="auth-link" style="font-size: 0.875rem;">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>

                        <div id="kc-form-buttons">
                            <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4" class="submit-button btn" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </form>
                </#if>
            </div>
        </div>
    <#elseif section = "info">
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div class="text-center dha">
                <p class="text-white mb-0" style="font-size: 0.875rem;">
                    Don't have an account?
                    <a tabindex="6" href="${url.registrationUrl}" class="auth-link">${msg("doRegister")}</a>
                </p>
            </div>
        </#if>
    </#if>

    <!-- Bootstrap Icons (if not already in your layout.ftl) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" />

    <script src="${url.resourcesPath}/js/login.js"></script>
</@layout.registrationLayout>
