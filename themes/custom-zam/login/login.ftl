<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>NASD ZAM - Login</title>
        
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        
        <!-- Bootstrap Icons -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
        
        <style>
            body {
                font-family: "Segoe UI", -apple-system, Roboto, Helvetica, sans-serif;
                overflow-x: hidden;
                background-color: white;
            }

            .brand-font {
                font-family: "Champagne & Limousines", -apple-system, Roboto, Helvetica, sans-serif;
            }

            .bg-primary-custom {
                background-color: #242063 !important;
            }

            .text-primary-custom {
                color: #2a2494 !important;
            }

            .bg-light-custom {
                background-color: #f8f8f8 !important;
            }

            .text-muted-custom {
                color: #909090 !important;
            }

            .border-custom {
                border-color: #e6e6e6 !important;
            }

            .password-toggle {
                cursor: pointer;
                position: absolute;
                right: 15px;
                top: 50%;
                transform: translateY(-50%);
                z-index: 10;
            }

            .input-container {
                position: relative;
            }

            .social-icons {
                display: flex;
                justify-content: center;
                gap: 2rem;
                margin-bottom: 1.5rem;
            }

            .social-icon {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                border: 1px solid #e6e6e6;
                transition: all 0.3s ease;
                cursor: pointer;
            }

            .social-icon:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .login-container {
                max-width: 532px;
                margin: 0 auto;
                padding: 2rem 1rem;
            }

            @media (max-width: 768px) {
                .login-container {
                    padding: 1rem 0.5rem;
                }
            }
        </style>
        
    <#elseif section = "form">
        <div class="container-fluid">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-8">
                    <div class="login-container">
                        <!-- Header with Logo -->
                        <header class="d-flex justify-content-center align-items-center mb-4">
                            <div class="d-flex align-items-center gap-2">
                                <svg
                                    width="39"
                                    height="36"
                                    viewBox="0 0 39 36"
                                    fill="none"
                                    xmlns="http://www.w3.org/2000/svg"
                                >
                                    <g clip-path="url(#clip0_241_52)">
                                        <rect
                                            y="0.111328"
                                            width="38.0454"
                                            height="35.7778"
                                            rx="4.28325"
                                            fill="white"
                                        ></rect>
                                        <g filter="url(#filter0_d_241_52)">
                                            <path
                                                d="M7.34242 7.54281C7.34612 6.70549 8.02971 6.03068 8.86701 6.03781L19.5994 6.12918C20.9743 6.14088 21.621 7.83309 20.6043 8.75871L9.82811 18.5695C8.85492 19.4555 7.29286 18.761 7.29867 17.445L7.34242 7.54281Z"
                                                fill="#242063"
                                            ></path>
                                        </g>
                                        <g filter="url(#filter1_d_241_52)">
                                            <path
                                                d="M8.75147 30.02C7.91415 30.0235 7.23354 29.3457 7.23354 28.5083L7.23355 17.7755C7.23355 16.4006 8.92019 15.7395 9.85444 16.7483L19.7566 27.4406C20.6508 28.4062 19.9697 29.9741 18.6536 29.9795L8.75147 30.02Z"
                                                fill="#EC232A"
                                            ></path>
                                        </g>
                                        <path
                                            d="M31.142 28.7493C31.1336 29.5865 30.4462 30.2575 29.609 30.2456L18.8772 30.0937C17.5024 30.0742 16.8653 28.3784 17.8873 27.4585L28.7186 17.7087C29.6968 16.8282 31.2549 17.5315 31.2417 18.8475L31.142 28.7493Z"
                                            fill="#242063"
                                        ></path>
                                        <path
                                            d="M29.7258 6.15196C30.5584 6.15196 31.2342 6.8252 31.2375 7.65781L31.2794 18.395C31.2847 19.7712 29.5981 20.4382 28.6608 19.4306L18.6724 8.69337C17.7729 7.72642 18.4586 6.15197 19.7792 6.15196L29.7258 6.15196Z"
                                            fill="#EC232A"
                                        ></path>
                                        <path
                                            d="M19.1328 6.14062L23.4161 6.14062L17.999 11.0967L17.999 6.14062L19.1328 6.14062Z"
                                            fill="#242063"
                                        ></path>
                                    </g>
                                </svg>
                                <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">
                                    NASD-Communication System
                                </h1>
                            </div>
                        </header>

                        <!-- Page Title -->
                        <div class="text-center mb-5">
                            <h2 class="fw-bold fs-1 text-dark">Login to your account</h2>
                        </div>

                        <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="alert alert-${message.type}">
                                ${kcSanitize(message.summary)?no_esc}
                            </div>
                        </#if>

                        <!-- Login Form -->
                        <form id="kc-form-login" action="${url.loginAction}" method="post">
                            <!-- Username/Email Field -->
                            <div class="mb-4">
                                <label for="username" class="form-label fw-semibold fs-5">
                                    <#if !realm.loginWithEmailAllowed>${msg("username")}
                                    <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                                    <#else>${msg("email")}</#if>
                                </label>
                                <input
                                    type="text"
                                    class="form-control form-control-lg bg-light-custom border-custom"
                                    id="username"
                                    name="username"
                                    value="${(login.username!'')}"
                                    placeholder="Enter your email"
                                    style="height: 60px"
                                    autofocus
                                    autocomplete="username"
                                    aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                />
                                <#if messagesPerField.existsError('username','password')>
                                    <div class="text-danger small mt-1" aria-live="polite">
                                        ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                                    </div>
                                </#if>
                            </div>

                            <!-- Password Field -->
                            <div class="mb-4">
                                <label for="password" class="form-label fw-semibold fs-5">${msg("password")}</label>
                                <div class="input-container">
                                    <input
                                        type="password"
                                        class="form-control form-control-lg bg-light-custom border-custom"
                                        id="password"
                                        name="password"
                                        placeholder="Enter your password"
                                        style="height: 60px; padding-right: 50px"
                                        autocomplete="current-password"
                                        aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                    <i class="bi bi-eye password-toggle" id="password-toggle"></i>
                                </div>
                            </div>

                            <#if realm.rememberMe && !usernameEditDisabled??>
                                <div class="mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                                        <label class="form-check-label" for="rememberMe">${msg("rememberMe")}</label>
                                    </div>
                                </div>
                            </#if>

                            <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                                <#if realm.resetPasswordAllowed>
                                    <a href="${url.loginResetCredentialsUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                                        ${msg("doForgotPassword")}
                                    </a>
                                </#if>
                                <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
                                    <a href="${url.registrationUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                                        ${msg("doRegister")}
                                    </a>
                                </#if>
                            </div>

                            <div class="d-grid mb-4">
                                <button
                                    type="submit"
                                    class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold"
                                    id="kc-login"
                                >
                                    ${msg("doLogIn")}
                                </button>
                            </div>
                        </form>

                        <!-- Social Media Icons -->
                        <div class="social-icons">
                            <#if social.providers??>
                                <#list social.providers as p>
                                    <a href="${p.loginUrl}" class="social-icon" title="${p.displayName}">
                                        <#if p.alias == "google">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                                                <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                                                <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                                                <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                                            </svg>
                                        <#elseif p.alias == "facebook">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" fill="#1877F2"/>
                                            </svg>
                                        <#else>
                                            ${p.displayName}
                                        </#if>
                                    </a>
                                </#list>
                            </#if>
                        </div>

                        <!-- Footer -->
                        <footer class="text-center mt-4">
                            <small class="text-muted-custom">© 2024 NASD Plc. All rights reserved</small>
                        </footer>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS Bundle with Popper -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            // Password toggle functionality
            document.getElementById("password-toggle").addEventListener("click", function() {
                const passwordInput = document.getElementById("password");
                const toggleIcon = this;
                
                if (passwordInput.type === "password") {
                    passwordInput.type = "text";
                    toggleIcon.classList.remove("bi-eye");
                    toggleIcon.classList.add("bi-eye-slash");
                } else {
                    passwordInput.type = "password";
                    toggleIcon.classList.remove("bi-eye-slash");
                    toggleIcon.classList.add("bi-eye");
                }
            });
        </script>
    </#if>
</@layout.registrationLayout>
