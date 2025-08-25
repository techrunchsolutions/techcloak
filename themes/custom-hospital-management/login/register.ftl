<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <title>${msg("registerTitle")}</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${url.resourcesPath}/css/styles.css">
    <#elseif section = "form">
        <form id="kc-register-form" class="space-y-4" action="${url.registrationAction}" method="post">

            <#-- Email Field -->
            <div class="mb-3">
                <label for="email" class="form-label">Email <span class="text-danger">*</span></label>
                <input type="email" id="email" name="email" value="${(register.email!'')}" 
                       class="form-control p-3 rounded border border-gray-300 w-full"
                       required autofocus />
                <div id="email-error" class="text-danger mt-1 small"></div>
            </div>

            <#-- Password Field -->
            <div class="mb-3 relative">
                <label for="password" class="form-label">Password <span class="text-danger">*</span></label>
                <div class="input-group">
                    <input type="password" id="password" name="password" 
                           class="form-control p-3 rounded border border-gray-300 w-full"
                           required />
                    <button type="button" class="btn btn-outline-secondary toggle-password" data-target="password">Show</button>
                </div>
                <div id="password-error" class="text-danger mt-1 small"></div>
            </div>

            <#-- Confirm Password Field -->
            <div class="mb-3 relative">
                <label for="password-confirm" class="form-label">Confirm Password <span class="text-danger">*</span></label>
                <div class="input-group">
                    <input type="password" id="password-confirm" name="password-confirm" 
                           class="form-control p-3 rounded border border-gray-300 w-full"
                           required />
                    <button type="button" class="btn btn-outline-secondary toggle-password" data-target="password-confirm">Show</button>
                </div>
                <div id="confirm-password-error" class="text-danger mt-1 small"></div>
            </div>

            <#-- Terms and Conditions -->
            <#if realm.termsAndConditions>
                <div class="form-check">
                    <input type="checkbox" id="terms" name="terms" class="form-check-input" required>
                    <label for="terms" class="form-check-label">${msg("termsAndConditions")}</label>
                </div>
            </#if>

            <#-- Submit Button -->
            <div class="d-grid mt-4">
                <button id="kc-register" class="btn btn-primary p-3" type="submit" disabled>${msg("doRegister")}</button>
            </div>
        </form>

        <script>
            const emailInput = document.getElementById('email');
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('password-confirm');
            const registerButton = document.getElementById('kc-register');

            const emailError = document.getElementById('email-error');
            const passwordError = document.getElementById('password-error');
            const confirmPasswordError = document.getElementById('confirm-password-error');

            const validateEmail = (email) => /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(email);
            const validatePassword = (pwd) => /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$/.test(pwd);

            function checkFormValidity() {
                let valid = true;

                if (!validateEmail(emailInput.value)) {
                    emailError.textContent = "Please enter a valid email address.";
                    valid = false;
                } else {
                    emailError.textContent = "";
                }

                if (!validatePassword(passwordInput.value)) {
                    passwordError.textContent = "Password must be at least 8 characters, include uppercase, lowercase, and a special character.";
                    valid = false;
                } else {
                    passwordError.textContent = "";
                }

                if (confirmPasswordInput.value !== passwordInput.value || confirmPasswordInput.value === "") {
                    confirmPasswordError.textContent = "Passwords do not match.";
                    valid = false;
                } else {
                    confirmPasswordError.textContent = "";
                }

                registerButton.disabled = !valid;
            }

            emailInput.addEventListener('input', checkFormValidity);
            passwordInput.addEventListener('input', checkFormValidity);
            confirmPasswordInput.addEventListener('input', checkFormValidity);

            // Toggle Password Visibility
            document.querySelectorAll('.toggle-password').forEach(btn => {
                btn.addEventListener('click', () => {
                    const target = document.getElementById(btn.getAttribute('data-target'));
                    target.type = target.type === "password" ? "text" : "password";
                    btn.textContent = target.type === "password" ? "Show" : "Hide";
                });
            });
        </script>
    </#if>
</@layout.registrationLayout>
