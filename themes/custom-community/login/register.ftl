<#import "template.ftl" as layout>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
<#if section = "header">
    <title>Community App — Sign Up</title>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Spline+Sans%3Awght%40400%3B500%3B700"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>

<#elseif section = "form">

<style>
.login-pf-page { padding-top: 0; }
.login-pf-page-header, .login-pf-header { display: none; }
.card-pf { max-width: 15000px; }
</style>

<div class="flex min-h-screen w-full bg-sky-100" style="font-family: 'Spline Sans', 'Noto Sans', sans-serif">
    <!-- Left Image -->
    <div class="w-1/2 h-screen bg-center bg-no-repeat bg-cover"
         style="background-image: url('https://img.freepik.com/premium-vector/business-training-illustration-concept-flat-illustration-isolated-white-background_701961-9696.jpg');"></div>

    <!-- Registration Form -->
    <div class="w-1/2 h-screen flex flex-col justify-center items-center text-slate-900">
        <h2 class="text-sky-700 text-[28px] font-bold leading-tight pb-3">${msg("registerTitle")}</h2>

        <form id="kc-register-form" class="w-3/4" action="${url.registrationAction}" method="post" novalidate>
            <!-- Hidden username (for backend compatibility) -->
            <input type="hidden" name="username" value="${(user.email!'')}"/>

            <!-- Email Field -->
            <div class="mb-4">
                <label for="email" class="block text-slate-700 font-medium pb-1">Email *</label>
                <input type="email" id="email" name="email" placeholder="Email"
                       class="form-input w-full rounded-xl text-slate-800 border border-sky-300 bg-white h-14
                              placeholder:text-slate-400 p-4 text-base focus:outline-none focus:ring-2 focus:ring-sky-500"
                       value="${(user.email!'')}" required/>
                <p id="email-error" class="text-red-600 text-sm hidden mt-1">Enter a valid email address</p>
            </div>

            <!-- Password Field -->
            <div class="mb-4 relative">
                <label for="password" class="block text-slate-700 font-medium pb-1">Password *</label>
                <input type="password" id="password" name="password" placeholder="Password"
                       class="form-input w-full rounded-xl text-slate-800 border border-sky-300 bg-white h-14
                              placeholder:text-slate-400 p-4 text-base focus:outline-none focus:ring-2 focus:ring-sky-500 pr-12"
                       required/>
                <button type="button" id="toggle-password"
                        class="absolute right-3 top-[42px] text-slate-500 hover:text-sky-600">Show</button>
                <p id="password-error" class="text-red-600 text-sm hidden mt-1">
                    Password must be at least 8 characters, with uppercase, lowercase, and special character.
                </p>
            </div>

            <!-- Confirm Password -->
            <div class="mb-4 relative">
                <label for="password-confirm" class="block text-slate-700 font-medium pb-1">Confirm Password *</label>
                <input type="password" id="password-confirm" name="password-confirm" placeholder="Confirm Password"
                       class="form-input w-full rounded-xl text-slate-800 border border-sky-300 bg-white h-14
                              placeholder:text-slate-400 p-4 text-base focus:outline-none focus:ring-2 focus:ring-sky-500 pr-12"
                       required/>
                <button type="button" id="toggle-password-confirm"
                        class="absolute right-3 top-[42px] text-slate-500 hover:text-sky-600">Show</button>
                <p id="confirm-error" class="text-red-600 text-sm hidden mt-1">Passwords do not match</p>
            </div>

            <!-- Submit -->
            <div>
                <input id="register-btn"
                       class="w-full h-12 bg-gray-300 cursor-not-allowed border border-sky-400 text-sky-700 font-bold rounded-xl transition-colors duration-200"
                       type="submit" value="${msg('doRegister')}" disabled/>
            </div>

            <!-- Back to Login -->
            <div class="mt-4 text-center">
                <a href="${url.loginUrl}" class="text-sky-600 hover:underline">${msg('backToLogin')}</a>
            </div>
        </form>
    </div>
</div>

<script>
    const emailInput = document.getElementById('email');
    const passInput = document.getElementById('password');
    const confirmInput = document.getElementById('password-confirm');
    const registerBtn = document.getElementById('register-btn');

    const emailError = document.getElementById('email-error');
    const passError = document.getElementById('password-error');
    const confirmError = document.getElementById('confirm-error');

    function validateEmail(email) {
        return /^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$/.test(email);
    }

    function validatePassword(pwd) {
        return /^(?=.*[a-z])(?=.*[A-Z])(?=.*[^A-Za-z0-9]).{8,}$/.test(pwd);
    }

    function checkValidity() {
        let valid = true;

        if (!validateEmail(emailInput.value.trim())) { emailError.classList.remove('hidden'); valid = false; }
        else emailError.classList.add('hidden');

        if (!validatePassword(passInput.value)) { passError.classList.remove('hidden'); valid = false; }
        else passError.classList.add('hidden');

        if (passInput.value !== confirmInput.value || confirmInput.value === '') {
            confirmError.classList.remove('hidden'); valid = false;
        } else confirmError.classList.add('hidden');

        registerBtn.disabled = !valid;
        registerBtn.classList.toggle('bg-gray-300', !valid);
        registerBtn.classList.toggle('cursor-not-allowed', !valid);
        registerBtn.classList.toggle('bg-white', valid);
        registerBtn.classList.toggle('hover:bg-sky-200', valid);
    }

    [emailInput, passInput, confirmInput].forEach(input => input.addEventListener('input', checkValidity));

    document.getElementById('toggle-password').addEventListener('click', () => {
        passInput.type = passInput.type === 'password' ? 'text' : 'password';
        document.getElementById('toggle-password').textContent = passInput.type === 'password' ? 'Show' : 'Hide';
    });

    document.getElementById('toggle-password-confirm').addEventListener('click', () => {
        confirmInput.type = confirmInput.type === 'password' ? 'text' : 'password';
        document.getElementById('toggle-password-confirm').textContent = confirmInput.type === 'password' ? 'Show' : 'Hide';
    });
</script>
</#if>
</@layout.registrationLayout>
