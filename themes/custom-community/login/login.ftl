<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
<#if section = "header">
    <title>Connect - Login</title>
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
    <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
          href="https://fonts.googleapis.com/css2?display=swap&family=Be+Vietnam+Pro:wght@400;500;700;900&family=Noto+Sans:wght@400;500;700;900"/>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <style>

@media (min-width: 768px) {
    .login-pf-page .login-pf-header {
        margin-bottom: 0; 
    }
}

.login-pf-page .login-pf-header {
        margin-bottom: 0; 
    }

@keyframes fadeIn {
        from {
          opacity: 0;
          transform: translateY(10px);
        }
        to {
          opacity: 1;
          transform: translateY(0);
        }
      }

      @keyframes slideIn {
        from {
          transform: translateX(-20px);
          opacity: 0;
        }
        to {
          transform: translateX(0);
          opacity: 1;
        }
      }

      @keyframes pulse {
        0% {
          transform: scale(1);
        }
        50% {
          transform: scale(1.05);
        }
        100% {
          transform: scale(1);
        }
      }

      @keyframes float {
        0% {
          transform: translateY(0px);
        }
        50% {
          transform: translateY(-5px);
        }
        100% {
          transform: translateY(0px);
        }
      }

      @keyframes gradientShift {
        0% {
          background-position: 0% 50%;
        }
        50% {
          background-position: 100% 50%;
        }
        100% {
          background-position: 0% 50%;
        }
      }

      @keyframes shake {
        0%,
        100% {
          transform: translateX(0);
        }
        25% {
          transform: translateX(-5px);
        }
        75% {
          transform: translateX(5px);
        }
      }

      .animate-fade-in {
        animation: fadeIn 0.6s ease-out forwards;
      }

      .animate-slide-in {
        animation: slideIn 0.5s ease-out forwards;
      }

      .animate-pulse-slow {
        animation: pulse 3s infinite ease-in-out;
      }

      .animate-float {
        animation: float 4s infinite ease-in-out;
      }

      .animate-gradient {
        background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
        background-size: 400% 400%;
        animation: gradientShift 8s ease infinite;
      }

      .animate-shake {
        animation: shake 0.3s ease-in-out;
      }

      .btn-transition {
        transition: all 0.2s ease;
      }

      .btn-transition:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1),
          0 2px 4px -1px rgba(0, 0, 0, 0.06);
      }

      .gradient-text {
        background: linear-gradient(90deg, #2a5dea, #8a3ffc);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        background-clip: text;
      }

      .glass-effect {
        background: rgba(255, 255, 255, 0.7);
        backdrop-filter: blur(10px);
        -webkit-backdrop-filter: blur(10px);
        border: 1px solid rgba(255, 255, 255, 0.18);
      }

      .input-focus:focus {
        box-shadow: 0 0 0 3px rgba(42, 93, 234, 0.2);
      }

      .checkbox:checked {
        background-image: url("data:image/svg+xml,%3csvg viewBox='0 0 16 16' fill='white' xmlns='http://www.w3.org/2000/svg'%3e%3cpath d='M12.207 4.793a1 1 0 010 1.414l-5 5a1 1 0 01-1.414 0l-2-2a1 1 0 011.414-1.414L6.5 9.086l4.293-4.293a1 1 0 011.414 0z'/%3e%3c/svg%3e");
        background-color: #2a5dea;
        border-color: #2a5dea;
      }

.login-pf-page-header {
display: none;
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

        .animate-shake {animation: shake 0.3s ease-in-out;}
        @keyframes shake {
            0%,100% {transform: translateX(0);}
            25% {transform: translateX(-5px);}
            75% {transform: translateX(5px);}
        }
        .input-focus:focus {box-shadow: 0 0 0 3px rgba(42,93,234,0.2);}
        .checkbox:checked {background-color: #2a5dea; border-color: #2a5dea;}
        .animate-gradient {
            background: linear-gradient(-45deg, #2a5dea, #8a3ffc, #2a5dea);
            background-size: 400% 400%;
            animation: gradientShift 8s ease infinite;
        }
        @keyframes gradientShift {
            0% {background-position:0% 50%;}
            50% {background-position:100% 50%;}
            100% {background-position:0% 50%;}
        }
        .glass-effect {
            background: rgba(255, 255, 255, 0.7);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.18);
        }

        /* Responsive left panel */
        .desktop-left-panel {
            display: none;
        }
        
        @media (min-width: 1024px) {
            .desktop-left-panel {
                display: flex !important;
            }
            .mobile-right-panel {
                width: 50% !important;
            }
        }
        
        @media (max-width: 1023px) {
            .mobile-right-panel {
                width: 100% !important;
            }
        }
    </style>
<#elseif section = "form">

<body class="bg-gradient-to-br from-blue-50 to-indigo-50 min-h-screen"
      style="font-family: 'Be Vietnam Pro', 'Noto Sans', sans-serif">

<div class="fixed top-0 left-0 w-full h-full overflow-hidden z-0">
      <div class="absolute -top-20 -left-20 w-72 h-72 bg-blue-200 rounded-full opacity-20 animate-float" style="animation-delay: 0s"></div>
      <div class="absolute top-1/4 -right-20 w-64 h-64 bg-purple-200 rounded-full opacity-20 animate-float" style="animation-delay: 1s"></div>

      <div class="absolute bottom-20 left-1/4 w-56 h-56 bg-indigo-200 rounded-full opacity-20 animate-float" style="animation-delay: 2s"></div>
      <div class="absolute bottom-0 right-1/4 w-48 h-48 bg-blue-300 rounded-full opacity-20 animate-float" style="animation-delay: 3s"></div>
    </div>

<div class="flex min-h-screen relative z-10">

    <!-- Left branding -->
    <div class="desktop-left-panel w-1/2 flex-col justify-between p-12 bg-gradient-to-br from-blue-600 to-purple-600 text-white">
        <div class="flex items-center gap-3 mb-12 animate-fade-in">
            <div class="size-10 animate-pulse-slow"><svg viewBox="0 0 48 48" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M36.7273 44C33.9891 44 31.6043 39.8386 30.3636 33.69C29.123 39.8386 26.7382 44 24 44C21.2618 44 18.877 39.8386 17.6364 33.69C16.3957 39.8386 14.0109 44 11.2727 44C7.25611 44 4 35.0457 4 24C4 12.9543 7.25611 4 11.2727 4C14.0109 4 16.3957 8.16144 17.6364 14.31C18.877 8.16144 21.2618 4 24 4C26.7382 4 29.123 8.16144 30.3636 14.31C31.6043 8.16144 33.9891 4 36.7273 4C40.7439 4 44 12.9543 44 24C44 35.0457 40.7439 44 36.7273 44Z" fill="white"/></svg></div>
            <h1 class="text-2xl font-bold">Connect</h1>
        </div>
        <div class="max-w-md animate-fade-in" style="animation-delay: 0.3s">
            <h2 class="text-4xl font-bold mb-6">Join our community of professionals</h2>
            <p class="text-lg opacity-90 mb-8 comtext">Connect with coaches, expand your network, and accelerate your career growth with our platform.</p>
            <div class="space-y-6">
                <div class="flex items-center">
                  <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                    <i class="fas fa-users text-white"></i>
                  </div>
                  <p class="text-lg comtext">Connect with industry experts</p>
                </div>
                <div class="flex items-center">
                  <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                    <i class="fas fa-graduation-cap text-white"></i>
                  </div>
                  <p class="text-lg comtext">Personalized coaching sessions</p>
                </div>
                <div class="flex items-center">
                  <div class="flex-shrink-0 h-10 w-10 rounded-full bg-white bg-opacity-20 flex items-center justify-center mr-4">
                    <i class="fas fa-briefcase text-white"></i>
                  </div>
                  <p class="text-lg comtext">Career advancement opportunities</p>
                </div>
            </div>
        </div>
        <div class="animate-fade-in" style="animation-delay: 0.6s">
          <div class="flex items-center space-x-2 mb-4">
            <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
              <img src="https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
            </div>
            <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
              <img src="https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
            </div>
            <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
              <img src="https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
            </div>
            <div class="w-8 h-8 rounded-full border-2 border-white overflow-hidden">
              <img src="https://images.unsplash.com/photo-1519345182560-3f2917c472ef?ixlib=rb-4.0.3&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=100&amp;q=80" alt="User" class="w-full h-full object-cover">
            </div>
          </div>
          <p class="text-sm opacity-80 comtext">
            Join thousands of professionals who are already growing their
            careers with Connect
          </p>
        </div>
    </div>

    <!-- Login form -->
    <div class="mobile-right-panel w-full flex items-center justify-center p-8">
        <div class="w-full max-w-md">
            <!-- Logo for mobile - ADDED BACK -->
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
            
            <div class="glass-effect rounded-2xl shadow-xl p-8 animate-fade-in" style="animation-delay: 0.2s">
                <h2 class="text-2xl font-bold text-gray-800 mb-2">Welcome back</h2>
                <p class="text-gray-600 mb-6 text-sm">Sign in to your account to continue</p>

                <form id="kc-form-login" class="space-y-5" action="${url.loginAction}" method="post">
                    <!-- Username/Email -->
                    <div>
                        <label for="username" class="block text-sm font-medium text-gray-700 mb-1">
                            <#if !realm.loginWithEmailAllowed>${msg("username")}
                            <#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}
                            <#else>${msg("email")}</#if>
                        </label>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-envelope text-gray-400"></i>
                            </div>
                            <input type="text" id="username" name="username"
                                   value="${(login.username!'')}"
                                   class="input-focus pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                   autocomplete="username"
                                   placeholder="you@example.com"
                                   aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"/>
                        </div>
                        <#if messagesPerField.existsError('username','password')>
                            <p class="text-red-600 text-sm mt-1">${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}</p>
                        </#if>
                    </div>

                    <!-- Password -->
                    <div>
                        <div class="flex justify-between items-center mb-1">
                            <label for="password" class="block text-sm font-medium text-gray-700">${msg("password")}</label>
                            <#if realm.resetPasswordAllowed>
                                <a href="${url.loginResetCredentialsUrl}" class="text-sm text-blue-600 hover:text-blue-800 transition-colors">${msg("doForgotPassword")}</a>
                            </#if>
                        </div>
                        <div class="relative">
                            <div class="absolute inset-y-0 left-0 pl-3 flex items-center pointer-events-none">
                                <i class="fas fa-lock text-gray-400"></i>
                            </div>
                            <input type="password" id="password" name="password"
                                   class="input-focus pl-10 pr-4 py-3 rounded-lg border border-gray-200 focus:outline-none focus:ring-2 focus:ring-blue-500 w-full transition-all duration-200"
                                   placeholder="••••••••"
                                   autocomplete="current-password"/>
                            <button type="button" id="togglePassword" class="absolute inset-y-0 right-0 pr-3 flex items-center">
                                <i class="fas fa-eye text-gray-400 hover:text-gray-600"></i>
                            </button>
                        </div>
                    </div>

                    <!-- Remember Me -->
                    <#if realm.rememberMe>
                        <div class="flex items-center">
                            <input type="checkbox" id="rememberMe" name="rememberMe"
                                   class="checkbox h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded"
                                   <#if login.rememberMe??>checked</#if>/>
                            <label for="rememberMe" class="ml-2 block text-sm text-gray-700">${msg("rememberMe")}</label>
                        </div>
                    </#if>

                    <!-- Submit -->
                    <div>
                        <input type="hidden" name="credentialId" id="id-hidden-input"
                               <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                        <button type="submit" id="kc-login"
                                class="animate-gradient w-full py-3 px-4 rounded-lg text-white font-medium btn-transition focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                            ${msg("doLogIn")}
                        </button>
                    </div>
                </form>
            </div>

            <!-- Feature highlights for mobile - ADDED BACK -->
            <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mt-8 lg:hidden animate-fade-in" style="animation-delay: 0.6s">
                <div class="bg-white bg-opacity-70 backdrop-filter backdrop-blur-sm rounded-lg p-4 text-center">
                    <div class="inline-flex items-center justify-center h-12 w-12 rounded-full bg-blue-100 text-blue-600 mb-2">
                        <i class="fas fa-users"></i>
                    </div>
                    <h3 class="text-sm font-medium text-gray-800">Connect</h3>
                    <p class="text-xs text-gray-600">Build your professional network</p>
                </div>

                <div class="bg-white bg-opacity-70 backdrop-filter backdrop-blur-sm rounded-lg p-4 text-center">
                    <div class="inline-flex items-center justify-center h-12 w-12 rounded-full bg-purple-100 text-purple-600 mb-2">
                        <i class="fas fa-graduation-cap"></i>
                    </div>
                    <h3 class="text-sm font-medium text-gray-800">Learn</h3>
                    <p class="text-xs text-gray-600">Grow with expert coaching</p>
                </div>

                <div class="bg-white bg-opacity-70 backdrop-filter backdrop-blur-sm rounded-lg p-4 text-center">
                    <div class="inline-flex items-center justify-center h-12 w-12 rounded-full bg-indigo-100 text-indigo-600 mb-2">
                        <i class="fas fa-briefcase"></i>
                    </div>
                    <h3 class="text-sm font-medium text-gray-800">Succeed</h3>
                    <p class="text-xs text-gray-600">Advance your career</p>
                </div>
            </div>

            <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            </#if>
        </div>
    </div>
</div>

<script>
    document.getElementById("togglePassword").addEventListener("click", function () {
        const pwd = document.getElementById("password");
        pwd.type = pwd.type === "password" ? "text" : "password";
        this.querySelector("i").classList.toggle("fa-eye");
        this.querySelector("i").classList.toggle("fa-eye-slash");
    });
</script>

</#if>
</@layout.registrationLayout>
