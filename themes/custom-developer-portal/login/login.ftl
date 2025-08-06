<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <h1 class="auth-title">Welcome back</h1>
        <p class="auth-subtitle">Sign in to your developer account</p>
        <!-- Custom CSS -->
        <link rel="stylesheet" href="${url.resourcesPath}/css/login.css">
    <#elseif section = "form">
        <div id="kc-form">
            <div id="kc-form-wrapper">
                <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post">
                    <!-- Email Field -->
                    <div class="mb-4">
                        <label for="username" class="form-label">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                        </label>
                        <div class="position-relative">
                            <input
                                tabindex="1"
                                id="username"
                                class="form-control <#if messagesPerField.existsError('username','password')>is-invalid</#if>"
                                name="username"
                                value="${(login.username!'')}"
                                type="text"
                                autofocus
                                autocomplete="off"
                                placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                            <#if messagesPerField.existsError('username','password')>
                                <div class="field-error">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                </div>
                            </#if>
                        </div>
                    </div>

                    <!-- Password Field -->
                    <div class="mb-4">
                        <label for="password" class="form-label">${msg("password")}</label>
                        <div class="position-relative">
                            <input
                                tabindex="2"
                                id="password"
                                class="form-control <#if messagesPerField.existsError('username','password')>is-invalid</#if>"
                                name="password"
                                type="password"
                                autocomplete="off"
                                placeholder="${msg("password")}"
                                aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                            />
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="mt-4">
                        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <input
                            tabindex="4"
                            class="submit-button"
                            name="login"
                            id="kc-login"
                            type="submit"
                            value="${msg("doLogIn")}"
                        />
                    </div>
                </form>
            </div>
        </div>
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span class="text-white">${msg("noAccount")} <a tabindex="6" href="${url.registrationUrl}" class="auth-link">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>
</@layout.registrationLayout>
