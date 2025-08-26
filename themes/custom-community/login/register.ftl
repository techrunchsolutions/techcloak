<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>Connect - Register</title>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&family=Be+Vietnam+Pro:wght@400;500;700;900&family=Noto+Sans:wght@400;500;700;900"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>

#email-error {
color: red !important;
}

        @media (min-width: 768px) {
    .login-pf-page .login-pf-header {
        margin-bottom: 0; 
    }
}

.login-pf-page .login-pf-header {
        margin-bottom: 0; 
    }

.login-pf-page-header {
display: none;
}

.login-pf-header {
display: none !important;
}

h1#kc-page-title {
    display: none;
}

.comtext {
color: white !important;
}

.login-pf-page {
    padding-top: 0;
    border: none;
}

@media (min-width: 768px) {
    .login-pf-page .card-pf {
        padding: 0;
    }
}

.login-pf-page .card-pf {
    padding: 0;
    margin-bottom: 0;
}

.card-pf {
    padding: 0;
    max-width: 15000px; 
    border: none;
}

.login-pf-header {
display: none;
}

#kc-content-wrapper {
    margin-top: 0;
}

.login-pf-signup {
display: none;
}
    </style>
<#elseif section = "form">

<body class="bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen"
      style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif">

<div class="fixed top-0 left-0 w-full h-full overflow-hidden z-0">
    <div class="absolute -top-20 -left-20 w-72 h-72 bg-blue-200 rounded-full opacity-20 animate-float"></div>
    <div class="absolute top-1/4 -right-20 w-64 h-64 bg-purple-200 rounded-full opacity-20 animate-float"></div>
    <div class="absolute bottom-20 left-1/4 w-56 h-56 bg-indigo-200 rounded-full opacity-20 animate-float"></div>
    <div class="absolute bottom-0 right-1/4 w-48 h-48 bg-blue-300 rounded-full opacity-20 animate-float"></div>
</div>

<div class="flex min-h-screen relative z-10">
    <!-- Left branding (reuse same content from login.ftl left panel) -->
    <div class="desktop-left-panel w-1/2 flex-col justify-between p-12 bg-gradient-to-br from-blue-600 to-purple-600 text-white">
        <div class="flex items-center gap-3 mb-12 animate-fade-in">
            <div class="size-10 animate-pulse-slow">
                <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/>
                </svg>
            </div>
            <h1 class="text-2xl font-bold">Connect</h1>
        </div>
        <div class="max-w-md animate-fade-in">
            <h2 class="text-4xl font-bold mb-6">Create your account</h2>
            <p class="text-lg opacity-90 mb-8 comtext">Join our platform and start connecting with professionals today.</p>
        </div>
    </div>

    <!-- Registration Form -->
    <div class="mobile-right-panel w-full flex items-center justify-center p-8">
        <div class="w-full max-w-md">
            <div class="flex justify-center mb-8 lg:hidden animate-fade-in">
                <div class="flex items-center gap-3">
                    <div class="size-12 animate-pulse-slow">
                        <svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="#2a5dea"/>
                        </svg>
                    </div>
                    <h1 class="text-3xl font-bold gradient-text">Connect</h1>
                </div>
            </div>

            <div class="glass-effect rounded-2xl shadow-xl p-8 animate-fade-in">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Sign up</h2>
                <p class="text-gray-600 mb-6 text-sm">Create an account to start connecting</p>

                <form id="kc-register-form" action="${url.registrationAction}" method="post" class="space-y-5">
    <!-- First & Last Name -->
    <div class="flex gap-4">
        <div class="w-1/2">
            <label for="firstName" class="block text-sm font-medium text-gray-700 mb-1">${msg("firstName")}</label>
            <input type="text" id="firstName" name="firstName"
                   class="input-focus px-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
                   placeholder="First Name" required/>
        </div>
        <div class="w-1/2">
            <label for="lastName" class="block text-sm font-medium text-gray-700 mb-1">${msg("lastName")}</label>
            <input type="text" id="lastName" name="lastName"
                   class="input-focus px-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
                   placeholder="Last Name" required/>
        </div>
    </div>

    <!-- Email -->
    <div>
        <label for="email" class="block text-sm font-medium text-gray-700 mb-1">${msg("email")}</label>
        <input type="email" id="email" name="email"
               class="input-focus px-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full"
               placeholder="you@example.com" autocomplete="email" required/>
        <p id="email-error" class="text-red-500 text-xs mt-1 hidden">Please enter a valid email address.</p>
    </div>

    <!-- Password -->
    <div class="relative">
        <label for="password" class="block text-sm font-medium text-gray-700 mb-1">${msg("password")}</label>
        <input type="password" id="password" name="password"
               class="input-focus px-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full pr-10"
               placeholder="••••••••" autocomplete="new-password" required/>
        <button type="button" id="toggle-password"
                class="absolute inset-y-0 right-3 flex items-center text-gray-500">
            <i class="fa-solid fa-eye"></i>
        </button>
        <p id="password-error" class="text-red-500 text-xs mt-1 hidden">
            Must be at least 8 characters, include uppercase, lowercase, and a special character.
        </p>
    </div>

    <!-- Confirm Password -->
    <div class="relative">
        <label for="password-confirm" class="block text-sm font-medium text-gray-700 mb-1">${msg("passwordConfirm")}</label>
        <input type="password" id="password-confirm" name="password-confirm"
               class="input-focus px-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full pr-10"
               placeholder="••••••••" autocomplete="new-password" required/>
        <button type="button" id="toggle-password-confirm"
                class="absolute inset-y-0 right-3 flex items-center text-gray-500">
            <i class="fa-solid fa-eye"></i>
        </button>
        <p id="password-confirm-error" class="text-red-500 text-xs mt-1 hidden">
            Passwords do not match.
        </p>
    </div>

    <!-- Submit -->
    <button type="submit" id="register-btn"
            class="animate-gradient w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500 opacity-50 cursor-not-allowed">
        ${msg("doRegister")}
    </button>

    <p class="text-center text-sm text-gray-600 mt-4">
        Already have an account? <a href="${url.loginUrl}" class="text-blue-600 hover:underline">Login</a>
    </p>
</form>

            </div>
        </div>
    </div>
</div>

<script>
    const emailInput = document.getElementById('email');
    const emailError = document.getElementById('email-error');

    const passwordInput = document.getElementById('password');
    const passwordError = document.getElementById('password-error');

    const confirmInput = document.getElementById('password-confirm');
    const confirmError = document.getElementById('password-confirm-error');

    const togglePassword = document.getElementById('toggle-password');
    const togglePasswordConfirm = document.getElementById('toggle-password-confirm');

    // Email Validation
    emailInput.addEventListener('input', () => {
        const valid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value);
        emailError.classList.toggle('hidden', valid || emailInput.value === '');
    });

    // Password Validation
    passwordInput.addEventListener('input', () => {
        const valid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$/.test(passwordInput.value);
        passwordError.classList.toggle('hidden', valid || passwordInput.value === '');
        checkConfirmPassword();
    });

    // Confirm Password Validation
    confirmInput.addEventListener('input', checkConfirmPassword);

    function checkConfirmPassword() {
        const matches = confirmInput.value === passwordInput.value;
        confirmError.classList.toggle('hidden', matches || confirmInput.value === '');
    }

    // Toggle Visibility
    togglePassword.addEventListener('click', () => {
        const type = passwordInput.type === 'password' ? 'text' : 'password';
        passwordInput.type = type;
        togglePassword.innerHTML = type === 'password' ? '<i class="fa-solid fa-eye"></i>' : '<i class="fa-solid fa-eye-slash"></i>';
    });

    togglePasswordConfirm.addEventListener('click', () => {
        const type = confirmInput.type === 'password' ? 'text' : 'password';
        confirmInput.type = type;
        togglePasswordConfirm.innerHTML = type === 'password' ? '<i class="fa-solid fa-eye"></i>' : '<i class="fa-solid fa-eye-slash"></i>';
    });

    // Final Submit Validation
    document.getElementById('kc-register-form').addEventListener('submit', (e) => {
        if (!emailInput.value || !passwordInput.value || !confirmInput.value ||
            !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value) ||
            !/^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$/.test(passwordInput.value) ||
            confirmInput.value !== passwordInput.value) {
            e.preventDefault();
            emailInput.dispatchEvent(new Event('input'));
            passwordInput.dispatchEvent(new Event('input'));
            confirmInput.dispatchEvent(new Event('input'));
        }
    });

const registerBtn = document.getElementById('register-btn');

// Validation check function
function validateForm() {
    const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value);
    const passwordValid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).{8,}$/.test(passwordInput.value);
    const confirmValid = confirmInput.value === passwordInput.value && passwordValid;
    const firstNameValid = document.getElementById('firstName').value.trim() !== '';
    const lastNameValid = document.getElementById('lastName').value.trim() !== '';

    const formValid = emailValid && passwordValid && confirmValid && firstNameValid && lastNameValid;

    registerBtn.disabled = !formValid;
    registerBtn.classList.toggle('opacity-50', !formValid);
    registerBtn.classList.toggle('cursor-not-allowed', !formValid);
}

// Add event listeners to all fields
[emailInput, passwordInput, confirmInput,
 document.getElementById('firstName'),
 document.getElementById('lastName')]
.forEach(input => input.addEventListener('input', validateForm));

</script>


</#if>
</@layout.registrationLayout>







