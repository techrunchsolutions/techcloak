<#import "template.ftl" as layout>
<@layout.registrationLayout 
    displayMessage=!messagesPerField.existsError('username','password') 
    displayInfo=true;  <!-- Always show the info section -->
    section>

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
                            <#if !realm.loginWithEmailAllowed>Username
                            <#elseif !realm.registrationEmailAsUsername>Username or Email
                            <#else>Email</#if>
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
                                placeholder="<#if !realm.loginWithEmailAllowed>Username<#elseif !realm.registrationEmailAsUsername>Username or Email<#else>Email</#if>"
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
                        <label for="password" class="form-label">Password</label>
                        <div class="position-relative">
                            <input
                                tabindex="2"
                                id="password"
                                class="form-control <#if messagesPerField.existsError('username','password')>is-invalid</#if>"
                                name="password"
                                type="password"
                                autocomplete="off"
                                placeholder="Password"
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
                            value="Sign In"
                        />
                    </div>
                </form>
            </div>
        </div>

    <#elseif section = "info" >
        <!-- Sign Up Instead -->
        <div id="kc-registration-container" class="text-center mt-4">
            <div id="kc-registration">
                <span class="text-white">
                    Don’t have an account?
                    <a tabindex="6" href="${url.registrationUrl}" class="auth-link">Sign up instead</a>
                </span>
            </div>
        </div>

        <!-- Forgot Password -->
        <div class="text-center mt-3">
            <a tabindex="5" href="${url.loginResetCredentialsUrl}" class="auth-link">Forgot Password?</a>
        </div>
    </#if>
</@layout.registrationLayout>
