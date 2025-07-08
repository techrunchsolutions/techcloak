<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "form">
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>${msg("updatePasswordTitle")} - BluePay</title>
            
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
        <link rel="stylesheet" href="${url.resourcesPath}/css/login-update-password.css">
        </head>
        <body class="bg-primary text-white">
            <div class="py-4">
                <!-- Your full original HTML structure here -->
                <div class="row">
                    <div class="col-12 ps-md-5 ps-3">
                        <img src="${url.resourcesPath}/img/logo.svg" alt="BluePay Logo" class="img-fluid" style="max-width: 168px"/>
                    </div>
                </div>

                <div class="row justify-content-center mt-4 mt-md-5">
                    <div class="col-12 col-md-10 col-lg-8 col-xl-6 pb-custom-lg">
                        <!-- Back Button -->
                        <div class="d-flex align-items-center mb-4 ps-md-0 ps-2">
                            <a href="${url.loginUrl}" class="text-white text-decoration-none d-flex align-items-center">
                                <img src="${url.resourcesPath}/img/back-arrow.png" alt="Back" width="24" height="24" class="me-2"/>
                                <span class="fw-medium">Back</span>
                            </a>
                        </div>

                        <!-- Reset Password Card -->
                        <div class="card border-0 rounded-2 shadow">
                            <div class="card-body p-4 p-lg-5">
                                <!-- Error Message Display -->
              
                                <div class="text-center mb-4">
                                    <h1 class="text-secondary fw-bold mb-1" style="font-size: 1.75rem; letter-spacing: -0.84px; line-height: 1;">
                                        ${msg("updatePasswordTitle")}
                                    </h1>
                                    <p class="text-body small mb-0">Enter a new password</p>
                                </div>

                                <!-- Keycloak Form (hidden fields only) -->
                                <form id="kc-passwd-update-form" action="${url.loginAction}" method="post">
                                    <input type="hidden" id="username" name="username" value="${username}" autocomplete="username"/>
                                    <input type="hidden" id="password-new" name="password-new" autocomplete="new-password"/>
                                    <input type="hidden" id="password-confirm" name="password-confirm" autocomplete="new-password"/>
                                </form>

                                <!-- Your Visible Form -->
                                <form id="resetPasswordForm" class="mt-4">
                                    <!-- New Password -->
                                    <div class="mb-3">
                                        <label for="newPassword" class="form-label text-secondary small">${msg("passwordNew")}</label>
                                        <div class="password-input-wrapper">
                                            <input
                                                type="password"
                                                class="form-control bg-light border py-3"
                                                id="newPassword"
                                                required
                                            />
                                            <i class="password-toggle bi bi-eye-slash" data-target="newPassword"></i>
                                        </div>
                                    </div>

                                    <!-- Password Requirements -->
                                    <div class="password-requirements mb-4">
                                        <p class="text-dark mb-2 fw-medium">Your password must contain:</p>
                                        <div class="password-requirement" data-requirement="length">
                                            <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                            <span>At least 8 characters</span>
                                        </div>
                                        <div class="password-requirement" data-requirement="uppercase">
                                            <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                            <span>At least 1 Uppercase character (A-Z)</span>
                                        </div>
                                        <div class="password-requirement" data-requirement="lowercase">
                                            <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                            <span>At least 1 lower case character (a-z)</span>
                                        </div>
                                        <div class="password-requirement" data-requirement="digit">
                                            <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                            <span>At least 1 digit (0 - 9)</span>
                                        </div>
                                        <div class="password-requirement" data-requirement="special">
                                            <img src="${url.resourcesPath}/img/icon-invalid.svg" alt="Check" width="16" height="16"/>
                                            <span>At least 1 special character (~!@#$)</span>
                                        </div>
                                    </div>

                                    <!-- Confirm Password -->
                                    <div class="mb-4">
                                        <label for="confirmPassword" class="form-label text-secondary small">${msg("passwordConfirm")}</label>
                                        <div class="password-input-wrapper">
                                            <input
                                                type="password"
                                                class="form-control bg-light border py-3"
                                                id="confirmPassword"
                                                required
                                            />
                                            <i class="password-toggle bi bi-eye-slash" data-target="confirmPassword"></i>
                                        </div>
                                        <div class="password-error">Passwords must match!</div>
                                    </div>

                                    <button
                                        type="button"
                                        class="change-password-btn"
                                        id="changePasswordBtn"
                                        disabled
                                    >
                                        Change Password
                                    </button>
                                </form>

                                <!-- Login Link -->
                                <div class="text-center mt-3">
                                    <a href="${url.loginUrl}" class="text-primary text-decoration-none">Login instead</a>
                                </div>
                            </div>
                        </div>

                        <!-- Footer -->
                        <div class="text-center text-white mt-3">
                            <p class="mb-1 fw-medium" style="font-size: 1.125rem; color:white;">
                                BluePay Payment Gateway
                            </p>
                            <p class="mb-0" style="font-size: 1rem; color:white;">
                                Licensed by the Central Bank of Nigeria (CBN)
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Your Full Original JavaScript with Keycloak Integration -->
            <script>
                document.addEventListener("DOMContentLoaded", function () {
                    // Keycloak form elements
                    const kcForm = document.getElementById("kc-passwd-update-form");
                    const kcNewPassword = document.getElementById("password-new");
                    const kcConfirmPassword = document.getElementById("password-confirm");
                    
                    // Visible form elements
                    const form = document.getElementById("resetPasswordForm");
                    const newPasswordInput = document.getElementById("newPassword");
                    const confirmPasswordInput = document.getElementById("confirmPassword");
                    const changePasswordBtn = document.getElementById("changePasswordBtn");
                    const passwordRequirements = document.querySelector(".password-requirements");
                    const passwordError = document.querySelector(".password-error");
                    
                    const requirements = {
                        length: {
                            regex: /.{8,}/,
                            element: document.querySelector('[data-requirement="length"]'),
                        },
                        uppercase: {
                            regex: /[A-Z]/,
                            element: document.querySelector('[data-requirement="uppercase"]'),
                        },
                        lowercase: {
                            regex: /[a-z]/,
                            element: document.querySelector('[data-requirement="lowercase"]'),
                        },
                        digit: {
                            regex: /[0-9]/,
                            element: document.querySelector('[data-requirement="digit"]'),
                        },
                        special: {
                            regex: /[~!@#$]/,
                            element: document.querySelector('[data-requirement="special"]'),
                        },
                    };

                    // Password visibility toggle
                    document.querySelectorAll(".password-toggle").forEach((toggle) => {
                        toggle.addEventListener("click", () => {
                            const targetId = toggle.getAttribute("data-target");
                            const input = document.getElementById(targetId);

                            if (input.type === "password") {
                                input.type = "text";
                                toggle.classList.remove("bi-eye-slash");
                                toggle.classList.add("bi-eye");
                            } else {
                                input.type = "password";
                                toggle.classList.remove("bi-eye");
                                toggle.classList.add("bi-eye-slash");
                            }
                        });
                    });

                    // Show password requirements when user starts typing
                    newPasswordInput.addEventListener("input", function () {
                        if (this.value.length > 0) {
                            passwordRequirements.classList.add("visible");
                        } else {
                            passwordRequirements.classList.remove("visible");
                        }
                        validatePassword();
                    });

                    // Password validation
                    function validatePassword() {
                        const password = newPasswordInput.value;
                        const confirmPassword = confirmPasswordInput.value;
                        let validCount = 0;

                        // Check password requirements
                        Object.entries(requirements).forEach(([key, requirement]) => {
                            const isValid = requirement.regex.test(password);
                            requirement.element.classList.toggle("valid", isValid);
                            requirement.element.classList.toggle("invalid", !isValid);
                            requirement.element.querySelector("img").src = isValid
                                ? "${url.resourcesPath}/img/icon-valid.svg"
                                : "${url.resourcesPath}/img/icon-invalid.svg";
                            if (isValid) validCount++;
                        });

                        // Check if passwords match
                        const passwordsMatch = password === confirmPassword && confirmPassword !== "";

                        // Show/hide error message
                        if (confirmPassword && !passwordsMatch) {
                            passwordError.classList.add("visible");
                        } else {
                            passwordError.classList.remove("visible");
                        }

                        // Update button state
                        const allRequirementsMet = validCount === 5 && passwordsMatch;
                        changePasswordBtn.disabled = !allRequirementsMet;
                        changePasswordBtn.classList.toggle("active", allRequirementsMet);
                    }

                    // Add validation on confirm password input
                    confirmPasswordInput.addEventListener("input", validatePassword);

                    // Form submission
                    changePasswordBtn.addEventListener("click", function(e) {
                        e.preventDefault();
                        
                        // Sync values to Keycloak's hidden form
                        kcNewPassword.value = newPasswordInput.value;
                        kcConfirmPassword.value = confirmPasswordInput.value;
                        
                        // Submit Keycloak's form
                        kcForm.submit();
                    });
                });
            </script>
        </body>
        </html>
    </#if>
</@layout.registrationLayout>