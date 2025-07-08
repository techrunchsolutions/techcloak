<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username') displayRequiredFields=false; section>
    <#if section = "header">
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
        
        <!-- Your Custom CSS -->
        <link rel="stylesheet" href="${url.resourcesPath}/css/login-reset-password.css">
        
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="bg-primary text-white py-4 ">
            <!-- Logo Section -->
            <div class="row">
                <div class="col-12 ps-md-5 ps-3">
                    <img src="${url.resourcesPath}/img/Bluepay-Logo-2.png" alt="BluePay Logo" class="img-fluid" style="max-width: 168px"/>
                </div>
            </div>

            <div class="row justify-content-center mt-4 mt-md-5">
                <div class="col-12 col-md-10 col-lg-8 col-xl-6 pb-custom-lg">
                    <!-- Back Button -->
                    <div class="d-flex align-items-center mb-4 ps-md-0 ps-2">
                        <a href="${url.loginUrl}" class="text-white text-decoration-none d-flex align-items-center" id="back-button">
                            <img src="${url.resourcesPath}/img/back-arrow.png" alt="Back" width="24" height="24" class="me-2"/>
                            <span class="fw-medium">Back</span>
                        </a>
                    </div>

                    <!-- Reset Password Card -->
                    <div class="card border-0 rounded-2 shadow">
                        <div class="card-body p-4 p-lg-5" id="reset-password-container">
                            <form 
    id="kc-reset-password-form" 
    class="needs-validation" 
    action="${url.loginAction}" 
    method="post" 
    novalidate
    data-email-icon-path="${url.resourcesPath}/img/email-sent-icon.png"
    data-login-url="${url.loginUrl}"
>
                                <div class="text-center mb-4">
                                    <h1 class="text-secondary fw-bold mb-1" style="font-size: 1.875rem; letter-spacing: -0.9px; line-height: 1; padding-bottom:10px;">
                                        ${msg("emailForgotTitle")}
                                    </h1>
                                    <p class="text-body small mb-0">
                                        Enter the email address you used to register. We will send<br/>
                                        you an email with instructions to reset your password.
                                    </p>
                                </div>

                                <div class="mb-3">
                                    <label for="username" class="form-label text-secondary small">
                                        <#if !realm.loginWithEmailAllowed>
                                            ${msg("username")}
                                        <#elseif !realm.registrationEmailAsUsername>
                                            ${msg("usernameOrEmail")}
                                        <#else>
                                            ${msg("email")}
                                        </#if>
                                    </label>
                                    <input
                                        type="email"
                                        class="form-control bg-light border py-3"
                                        id="username"
                                        name="username"
                                        required
                                        value="${(auth.attemptedUsername!'')}"
                                        aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"
                                    />
                                    <div class="invalid-feedback">
                                        <#if messagesPerField.existsError('username')>
                                            ${kcSanitize(messagesPerField.get('username'))?no_esc}
                                        <#else>
                                            Please enter a valid email address.
                                        </#if>
                                    </div>
                                </div>

                                <button
                                    type="submit"
                                    class="btn btn-info w-100 py-3 fw-bold mt-4"
                                    id="reset-button"
                                >
                                    Request Reset
                                </button>
                            </form>

                            <div class="text-center mt-3" id="login-link-container">
                                <a href="${url.loginUrl}" class="text-primary text-decoration-none">Login instead</a>
                            </div>
                        </div>
                    </div>

                    <!-- Footer -->
                    <div class="text-center text-white mt-3">
                        <p class="mb-1 fw-medium" style="font-size: 1.125rem; color: white;">BluePay Payment Gateway</p>
                        <p class="mb-0" style="font-size: 1rem; color: white;">Licensed by the Central Bank of Nigeria (CBN)</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${url.resourcesPath}/js/login-reset-password.js"></script>
    </#if>
</@layout.registrationLayout>