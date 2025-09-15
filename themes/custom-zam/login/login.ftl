<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
    <#elseif section = "form">
        <style>
          /* Enhanced CSS for beautiful login page */
          @import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

          * {
            box-sizing: border-box;
          }

          body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%) !important;
            font-family: 'Inter', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
          }

          .login-container {
            min-height: 100vh;
            display: flex;
            position: relative;
            overflow: hidden;
          }

          /* Hide default Keycloak elements */
          .login-pf-page-header,
          .login-pf-header,
          h1#kc-page-title,
          .login-pf-signup,
          #kc-info-wrapper,
          #kc-header,
          .login-pf-header {
            display: none !important;
          }

          .login-pf-page {
            padding-top: 0;
            border: none;
          }

          .login-pf-page .card-pf {
            padding: 0;
            margin-bottom: 0;
            border: none;
            max-width: none;
          }

          #kc-content-wrapper {
            margin-top: 0;
          }

          html, body {
            overflow-x: hidden;
          }

          .card-pf {
            max-width: 15000px;
            border-top: none;
          }

          @media (min-width: 768px) {
            .login-pf-page .card-pf {
              padding: 0;
            }
          }

          /* Left Content - Enhanced Carousel */
          .left-content {
            width: 50%;
            position: relative;
            overflow: hidden;
            display: none;
          }

          @media (min-width: 992px) {
            .left-content { display: block; }
            .main-content { width: 50%; }
          }

          @media (max-width: 991px) {
            .main-content { width: 100%; }
          }

          .background-container {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
          }

          .carousel-image {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover;
            opacity: 0;
            transition: all 0.8s cubic-bezier(0.4, 0, 0.2, 1);
            transform: scale(1.1);
          }

          .carousel-image.active {
            opacity: 1;
            transform: scale(1);
          }

          /* Enhanced decorative elements */
          .decorative-ellipse-red {
            position: absolute;
            top: 15%;
            right: 8%;
            z-index: 2;
            animation: float 6s ease-in-out infinite;
          }

          @keyframes float {
            0%, 100% { transform: translateY(0px) rotate(0deg); }
            50% { transform: translateY(-20px) rotate(5deg); }
          }

          .decorative-ellipse {
            position: absolute;
            border-radius: 50%;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.05));
            backdrop-filter: blur(10px);
            animation: pulse 4s ease-in-out infinite;
          }

          @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.7; }
            50% { transform: scale(1.1); opacity: 1; }
          }

          .decorative-ellipse-gray-large {
            width: 220px;
            height: 220px;
            top: 8%;
            left: 8%;
            animation-delay: 0s;
          }

          .decorative-ellipse-gray-medium {
            width: 120px;
            height: 120px;
            bottom: 35%;
            right: 15%;
            animation-delay: 1s;
          }

          .decorative-ellipse-gray-small {
            width: 80px;
            height: 80px;
            bottom: 15%;
            left: 25%;
            animation-delay: 2s;
          }

          /* Enhanced promotional section */
          .promotional-section {
            position: absolute;
            bottom: 40px;
            left: 40px;
            right: 40px;
            z-index: 3;
            backdrop-filter: blur(20px);
            background: linear-gradient(135deg, rgba(0, 0, 0, 0.3), rgba(0, 0, 0, 0.1));
            border-radius: 20px;
            padding: 32px;
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.2);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            transform: translateY(20px);
            animation: slideUp 1s ease-out 0.5s forwards;
          }

          @keyframes slideUp {
            to { transform: translateY(0); }
          }

          .promotional-section h3 {
            font-weight: 600;
            font-size: 1.5rem;
            text-align: center;
            margin-bottom: 16px;
            background: linear-gradient(135deg, #fff, #e0e7ff);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
          }

          .promotional-section p {
            text-align: center;
            margin-bottom: 24px;
            font-size: 1rem;
            line-height: 1.6;
            opacity: 0.9;
          }

          /* Enhanced carousel controls */
          .carousel-indicator {
            width: 8px;
            height: 8px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.4);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-block;
            cursor: pointer;
          }

          .carousel-indicator-active {
            width: 32px;
            height: 8px;
            border-radius: 4px;
            background: linear-gradient(135deg, #fff, #e0e7ff);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-block;
            cursor: pointer;
            box-shadow: 0 4px 12px rgba(255, 255, 255, 0.3);
          }

          .carousel-btn {
            background: rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.3);
            color: white;
            cursor: pointer;
            padding: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
          }

          .carousel-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: scale(1.1);
          }

          /* Main Content - Enhanced */
          .main-content {
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            min-height: 100vh;
            overflow-y: auto;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.95), rgba(248, 250, 252, 0.95));
            backdrop-filter: blur(20px);
            position: relative;
          }

          .main-content::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grain" width="100" height="100" patternUnits="userSpaceOnUse"><circle cx="25" cy="25" r="1" fill="%23000" opacity="0.02"/><circle cx="75" cy="75" r="1" fill="%23000" opacity="0.02"/><circle cx="50" cy="10" r="1" fill="%23000" opacity="0.02"/><circle cx="10" cy="90" r="1" fill="%23000" opacity="0.02"/></pattern></defs><rect width="100" height="100" fill="url(%23grain)"/></svg>');
            pointer-events: none;
            z-index: 1;
          }

          .main-content > * {
            position: relative;
            z-index: 2;
          }

          /* Enhanced brand header */
          .brand-header {
            text-align: center;
            margin-bottom: 40px;
            margin-top: 40px;
            animation: fadeInDown 1s ease-out;
          }

          @keyframes fadeInDown {
            from { opacity: 0; transform: translateY(-30px); }
            to { opacity: 1; transform: translateY(0); }
          }

          .brand-logo {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            padding: 20px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.8), rgba(255, 255, 255, 0.4));
            border-radius: 20px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 0 auto;
          }

          .brand-logo img {
            transition: transform 0.3s ease;
          }

          .brand-logo:hover img {
            transform: scale(1.05);
          }

          .brand-title {
            font-weight: 700;
            font-size: 1.4rem;
            margin: 0;
            background: linear-gradient(135deg, #667eea, #764ba2);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
          }

          /* Enhanced page title */
          .page-title {
            text-align: center;
            margin-bottom: 48px;
            animation: fadeInUp 1s ease-out 0.2s both;
          }

          @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(30px); }
            to { opacity: 1; transform: translateY(0); }
          }

          .page-title h2 {
            font-weight: 700;
            font-size: 3rem;
            background: linear-gradient(135deg, #1e293b, #475569);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin: 0;
            position: relative;
          }

          .page-title h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 60px;
            height: 4px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            border-radius: 2px;
          }

          /* Enhanced form styling */
          .login-form {
            max-width: 480px;
            margin: 0 auto;
            animation: fadeInUp 1s ease-out 0.4s both;
          }

          .form-group {
            margin-bottom: 28px;
            position: relative;
          }

          .form-label {
            font-weight: 600;
            font-size: 1.1rem;
            color: #374151;
            margin-bottom: 12px;
            display: block;
            transition: color 0.3s ease;
          }

          .form-control-custom {
            width: 100%;
            height: 64px;
            padding: 20px 24px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.9), rgba(248, 250, 252, 0.9));
            border: 2px solid rgba(203, 213, 225, 0.5);
            border-radius: 16px;
            font-size: 1.1rem;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            backdrop-filter: blur(10px);
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
          }

          .form-control-custom:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1), 0 8px 30px rgba(102, 126, 234, 0.15);
            transform: translateY(-2px);
            background: rgba(255, 255, 255, 0.95);
          }

          .form-control-custom.error {
            border-color: #ef4444;
            box-shadow: 0 0 0 4px rgba(239, 68, 68, 0.1);
          }

          .form-control-custom::placeholder {
            color: #9ca3af;
            transition: opacity 0.3s ease;
          }

          .form-control-custom:focus::placeholder {
            opacity: 0.7;
          }

          /* Enhanced input container */
          .input-container {
            position: relative;
          }

          .password-toggle {
            position: absolute;
            right: 20px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
            color: #6b7280;
            width: 24px;
            height: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.8);
            backdrop-filter: blur(10px);
          }

          .password-toggle:hover {
            color: #667eea;
            background: rgba(102, 126, 234, 0.1);
            transform: translateY(-50%) scale(1.1);
          }

          .password-toggle svg {
            width: 20px;
            height: 20px;
          }

          /* Enhanced form actions */
          .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 32px;
            flex-wrap: wrap;
            gap: 16px;
          }

          .btn-link-custom {
            background: none;
            border: none;
            color: #667eea;
            text-decoration: none;
            cursor: pointer;
            padding: 8px 16px;
            font-size: 1rem;
            font-weight: 500;
            border-radius: 8px;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
          }

          .btn-link-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(102, 126, 234, 0.1), transparent);
            transition: left 0.5s ease;
          }

          .btn-link-custom:hover::before {
            left: 100%;
          }

          .btn-link-custom:hover {
            color: #4f46e5;
            background: rgba(102, 126, 234, 0.05);
            transform: translateY(-1px);
          }

          /* Enhanced remember me */
          .remember-me {
            margin-bottom: 24px;
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 16px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.6), rgba(248, 250, 252, 0.6));
            border-radius: 12px;
            border: 1px solid rgba(203, 213, 225, 0.3);
            backdrop-filter: blur(10px);
          }

          .remember-me input[type="checkbox"] {
            width: 20px;
            height: 20px;
            accent-color: #667eea;
            cursor: pointer;
          }

          .remember-me label {
            cursor: pointer;
            font-weight: 500;
            color: #374151;
            margin: 0;
          }

          /* Enhanced terms text */
          .terms-text {
            text-align: center;
            margin-bottom: 32px;
            color: #6b7280;
            font-size: 0.95rem;
            line-height: 1.6;
            padding: 20px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.5), rgba(248, 250, 252, 0.5));
            border-radius: 12px;
            border: 1px solid rgba(203, 213, 225, 0.2);
            backdrop-filter: blur(10px);
          }

          /* Enhanced primary button */
          .btn-primary-custom {
            width: 100%;
            height: 64px;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 16px;
            color: white;
            font-size: 1.2rem;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            margin-bottom: 32px;
            position: relative;
            overflow: hidden;
            box-shadow: 0 8px 30px rgba(102, 126, 234, 0.3);
          }

          .btn-primary-custom::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.6s ease;
          }

          .btn-primary-custom:hover:not(:disabled) {
            background: linear-gradient(135deg, #5a67d8 0%, #6b46c1 100%);
            transform: translateY(-3px);
            box-shadow: 0 12px 40px rgba(102, 126, 234, 0.4);
          }

          .btn-primary-custom:hover:not(:disabled)::before {
            left: 100%;
          }

          .btn-primary-custom:active {
            transform: translateY(-1px);
          }

          .btn-primary-custom:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
            box-shadow: 0 4px 15px rgba(102, 126, 234, 0.2);
          }

          /* Enhanced error messages */
          .error-message {
            color: #ef4444;
            font-size: 0.9rem;
            margin-top: 8px;
            padding: 8px 12px;
            background: rgba(239, 68, 68, 0.1);
            border-radius: 8px;
            border-left: 4px solid #ef4444;
            animation: shake 0.5s ease-in-out;
          }

          @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
          }

          /* Enhanced footer */
          .footer-text {
            text-align: center;
            color: #6b7280;
            font-size: 0.9rem;
            margin-top: 40px;
            padding: 20px;
            background: linear-gradient(135deg, rgba(255, 255, 255, 0.4), rgba(248, 250, 252, 0.4));
            border-radius: 12px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(203, 213, 225, 0.2);
          }

          /* Enhanced carousel navigation */
          .carousel-nav {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px;
          }

          .carousel-indicators {
            display: flex;
            align-items: center;
            gap: 12px;
          }

          /* Responsive enhancements */
          @media (max-width: 768px) {
            .main-content {
              padding: 20px;
            }

            .page-title h2 {
              font-size: 2.2rem;
            }

            .brand-title {
              font-size: 1.1rem;
            }

            .form-control-custom {
              height: 56px;
              padding: 16px 20px;
              font-size: 1rem;
            }

            .btn-primary-custom {
              height: 56px;
              font-size: 1.1rem;
            }
          }

          /* Loading animation for buttons */
          .btn-loading {
            position: relative;
            color: transparent !important;
          }

          .btn-loading::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            width: 20px;
            height: 20px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-top: 2px solid white;
            border-radius: 50%;
            animation: spin 1s linear infinite;
          }

          @keyframes spin {
            0% { transform: translate(-50%, -50%) rotate(0deg); }
            100% { transform: translate(-50%, -50%) rotate(360deg); }
          }

          /* Bootstrap integration */
          .kc-login #kc-form {
            width: 100% !important;
          }

          .kc-login #kc-form-wrapper {
            width: 100% !important;
          }
        </style>

        <div class="login-container">
          <!-- Left Content (Hidden on smaller screens) -->
          <div class="left-content">
            <div class="background-container">
              <!-- Background Images -->
              <img
                src="${url.resourcesPath}/img/car1.png"
                alt=""
                class="carousel-image active"
                id="carousel-img-1"
              />
              <img
                src="${url.resourcesPath}/img/car2.png"
                alt=""
                class="carousel-image"
                id="carousel-img-2"
              />
              <img
                src="${url.resourcesPath}/img/car3.png"
                alt=""
                class="carousel-image"
                id="carousel-img-3"
              />

              <!-- Decorative Elements -->
              <svg
                class="decorative-ellipse-red"
                width="120"
                height="120"
                viewBox="0 0 179 95"
                fill="none"
                xmlns="http://www.w3.org/2000/svg"
              >
                <ellipse
                  cx="89.5"
                  cy="86"
                  rx="89.5"
                  ry="86"
                  fill="url(#redGradient)"
                ></ellipse>
                <defs>
                  <linearGradient id="redGradient" x1="0%" y1="0%" x2="100%" y2="100%">
                    <stop offset="0%" style="stop-color:#ff6b6b;stop-opacity:1" />
                    <stop offset="100%" style="stop-color:#ee5a52;stop-opacity:1" />
                  </linearGradient>
                </defs>
              </svg>

              <div class="decorative-ellipse decorative-ellipse-gray-large"></div>
              <div class="decorative-ellipse decorative-ellipse-gray-medium"></div>
              <div class="decorative-ellipse decorative-ellipse-gray-small"></div>

              <!-- Promotional Section -->
              <div class="promotional-section">
                <h3>Discover your communication potential</h3>
                <p>
                  Tired of using non-privacy communication system? Customize your
                  organization chat and branding the way its suit you and your
                  business. We have all the parameters and functionalities you need
                  to push your business communication to the next level.
                </p>
                <div class="carousel-nav">
                  <button
                    class="carousel-btn"
                    id="carousel-prev"
                    style="display: none"
                    type="button"
                  >
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                      style="transform: rotate(90deg)"
                    >
                      <path
                        d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z"
                        fill="white"
                      ></path>
                    </svg>
                  </button>
                  <div class="carousel-indicators">
                    <div class="carousel-indicator-active" id="indicator-1"></div>
                    <div class="carousel-indicator" id="indicator-2"></div>
                    <div class="carousel-indicator" id="indicator-3"></div>
                  </div>
                  <button class="carousel-btn" id="carousel-next" type="button">
                    <svg
                      width="16"
                      height="16"
                      viewBox="0 0 16 16"
                      fill="none"
                      xmlns="http://www.w3.org/2000/svg"
                      style="transform: rotate(-90deg)"
                    >
                      <path
                        d="M8 13C10.7614 13 13 10.7614 13 8C13 5.23858 10.7614 3 8 3C5.23858 3 3 5.23858 3 8C3 10.7614 5.23858 13 8 13ZM14 8C14 11.3137 11.3137 14 8 14C4.68629 14 2 11.3137 2 8C2 4.68629 4.68629 2 8 2C11.3137 2 14 4.68629 14 8ZM7.35355 5.14645L9.85355 7.64645C10.0488 7.84171 10.0488 8.15829 9.85355 8.35355L7.35355 10.8536C7.15829 11.0488 6.84171 11.0488 6.64645 10.8536C6.45118 10.6583 6.45118 10.3417 6.64645 10.1464L8.79289 8L6.64645 5.85355C6.45118 5.65829 6.45118 5.34171 6.64645 5.14645C6.84171 4.95118 7.15829 4.95118 7.35355 5.14645Z"
                        fill="white"
                      ></path>
                    </svg>
                  </button>
                </div>
              </div>
            </div>
          </div>

          <!-- Main Content Area -->
          <div class="main-content">
            <!-- Header with Logo -->
            <header class="brand-header">
              <div class="brand-logo">
                <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="NASD Logo" />
                <h1 class="brand-title">NASD-Communication System</h1>
              </div>
            </header>

            <!-- Page Title -->
            <section class="page-title">
              <h2>Login to your account</h2>
            </section>

            <!-- Keycloak Login Form -->
            <main id="kc-form">
              <div id="kc-form-wrapper">
                <#if realm.password>
                  <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="login-form">

                    <#if !usernameHidden??>
                      <div class="form-group">
                        <label for="username" class="form-label">
                          <#if !realm.loginWithEmailAllowed>
                            ${msg("username")}
                          <#elseif !realm.registrationEmailAsUsername>
                            ${msg("usernameOrEmail")}
                          <#else>
                            Email
                          </#if>
                        </label>
                        <input
                          tabindex="2"
                          id="username"
                          class="form-control-custom <#if messagesPerField.existsError('username','password')>error</#if>"
                          name="username"
                          value="${(login.username!'')}"
                          type="text"
                          autofocus
                          autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('username webauthn', 'username')}"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          dir="ltr"
                          placeholder="Enter your email"
                          required
                        />
                        <#if messagesPerField.existsError('username','password')>
                          <div class="error-message">
                            ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                          </div>
                        </#if>
                      </div>
                    </#if>

                    <div class="form-group">
                      <label for="password" class="form-label">Password</label>
                      <div class="input-container">
                        <input
                          tabindex="3"
                          id="password"
                          class="form-control-custom <#if messagesPerField.existsError('username','password')>error</#if>"
                          name="password"
                          type="password"
                          autocomplete="current-password"
                          aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                          placeholder="Enter your password"
                          style="padding-right: 60px;"
                          required
                        />
                        <span class="password-toggle" id="password-toggle">
                          <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                          </svg>
                        </span>
                      </div>
                      <#if usernameHidden?? && messagesPerField.existsError('username','password')>
                        <div class="error-message">
                          ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                        </div>
                      </#if>
                    </div>

                    <div class="form-actions">
                      <#if realm.resetPasswordAllowed>
                        <a tabindex="6" href="${url.loginResetCredentialsUrl}" class="btn-link-custom">
                          Forgot password?
                        </a>
                      <#else>
                        <span></span>
                      </#if>

                      <#if realm.registrationAllowed && !registrationDisabled??>
                        <a tabindex="8" href="${url.registrationUrl}" class="btn-link-custom">
                          Create account
                        </a>
                      </#if>
                    </div>

                    <#if realm.rememberMe && !usernameHidden??>
                      <div class="remember-me">
                        <input tabindex="5" id="rememberMe" name="rememberMe" type="checkbox" <#if login.rememberMe??>checked</#if>>
                        <label for="rememberMe">${msg("rememberMe")}</label>
                      </div>
                    </#if>

                    <div class="terms-text">
                      By registering, you agree to ZAM's
                      <button type="button" class="btn-link-custom" style="font-size: 0.95rem;">Terms of Service</button>
                      and
                      <button type="button" class="btn-link-custom" style="font-size: 0.95rem;">Privacy Policy</button>
                    </div>

                    <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                    <button
                      tabindex="7"
                      class="btn-primary-custom"
                      name="login"
                      id="kc-login"
                      type="submit"
                    >
                      Sign in
                    </button>
                  </form>
                </#if>
              </div>
            </main>

            <!-- Footer -->
            <footer class="footer-text">
              © 2024 NASD Plc. All rights reserved
            </footer>
          </div>
        </div>

        <script>
          // Enhanced carousel functionality
          let currentSlide = 1;
          const totalSlides = 3;
          let autoSlideInterval;
          let isTransitioning = false;

          function showSlide(slideNumber) {
            if (isTransitioning) return;
            isTransitioning = true;

            // Hide all images
            for (let i = 1; i <= totalSlides; i++) {
              const img = document.getElementById('carousel-img-' + i);
              const indicator = document.getElementById('indicator-' + i);
              if (img) img.classList.remove("active");
              if (indicator) indicator.className = "carousel-indicator";
            }

            // Show current image with delay for smooth transition
            setTimeout(() => {
              const currentImg = document.getElementById('carousel-img-' + slideNumber);
              const currentIndicator = document.getElementById('indicator-' + slideNumber);
              if (currentImg) currentImg.classList.add("active");
              if (currentIndicator) currentIndicator.className = "carousel-indicator-active";

              // Update navigation buttons
              const prevBtn = document.getElementById("carousel-prev");
              const nextBtn = document.getElementById("carousel-next");
              if (prevBtn) prevBtn.style.display = slideNumber === 1 ? "none" : "flex";
              if (nextBtn) nextBtn.style.display = slideNumber === totalSlides ? "none" : "flex";

              isTransitioning = false;
            }, 100);
          }

          function nextSlide() {
            if (currentSlide < totalSlides && !isTransitioning) {
              currentSlide++;
              showSlide(currentSlide);
            }
          }

          function prevSlide() {
            if (currentSlide > 1 && !isTransitioning) {
              currentSlide--;
              showSlide(currentSlide);
            }
          }

          function startAutoSlide() {
            autoSlideInterval = setInterval(function() {
              if (currentSlide < totalSlides) {
                nextSlide();
              } else {
                currentSlide = 1;
                showSlide(currentSlide);
              }
            }, 6000);
          }

          function stopAutoSlide() {
            if (autoSlideInterval) {
              clearInterval(autoSlideInterval);
            }
          }

          // Enhanced form interactions
          function addFormEnhancements() {
            const form = document.getElementById('kc-form-login');
            const submitBtn = document.getElementById('kc-login');
            const inputs = form.querySelectorAll('.form-control-custom');

            // Add loading state to submit button
            if (form && submitBtn) {
              form.addEventListener('submit', function() {
                submitBtn.classList.add('btn-loading');
                submitBtn.disabled = true;
              });
            }

            // Enhanced input interactions
            inputs.forEach(input => {
              input.addEventListener('focus', function() {
                this.parentElement.style.transform = 'translateY(-2px)';
              });

              input.addEventListener('blur', function() {
                this.parentElement.style.transform = 'translateY(0)';
              });

              // Add floating label effect
              input.addEventListener('input', function() {
                const label = this.parentElement.querySelector('.form-label');
                if (label) {
                  if (this.value.length > 0) {
                    label.style.color = '#667eea';
                    label.style.transform = 'scale(0.9)';
                  } else {
                    label.style.color = '#374151';
                    label.style.transform = 'scale(1)';
                  }
                }
              });
            });
          }

          // Initialize when DOM is ready
          document.addEventListener('DOMContentLoaded', function() {
            // Event listeners for carousel
            const nextBtn = document.getElementById("carousel-next");
            const prevBtn = document.getElementById("carousel-prev");

            if (nextBtn) {
              nextBtn.addEventListener("click", function() {
                stopAutoSlide();
                nextSlide();
                setTimeout(startAutoSlide, 1000);
              });
            }

            if (prevBtn) {
              prevBtn.addEventListener("click", function() {
                stopAutoSlide();
                prevSlide();
                setTimeout(startAutoSlide, 1000);
              });
            }

            // Start auto-slide
            startAutoSlide();

            // Enhanced password toggle functionality
            const passwordToggle = document.getElementById("password-toggle");
            const passwordInput = document.getElementById("password");

            if (passwordToggle && passwordInput) {
              passwordToggle.addEventListener("click", function() {
                if (passwordInput.type === "password") {
                  passwordInput.type = "text";
                  passwordToggle.innerHTML = `
                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                      <path d="M3 3l18 18" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
                    </svg>
                  `;
                } else {
                  passwordInput.type = "password";
                  passwordToggle.innerHTML = `
                    <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <path d="M12 4.5C7 4.5 2.73 7.61 1 12c1.73 4.39 6 7.5 11 7.5s9.27-3.11 11-7.5c-1.73-4.39-6-7.5-11-7.5zM12 17c-2.76 0-5-2.24-5-5s2.24-5 5-5 5 2.24 5 5-2.24 5-5 5zm0-8c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z" fill="currentColor"/>
                    </svg>
                  `;
                }
              });
            }

            // Add form enhancements
            addFormEnhancements();

            // Add click handlers for carousel indicators
            for (let i = 1; i <= totalSlides; i++) {
              const indicator = document.getElementById('indicator-' + i);
              if (indicator) {
                indicator.addEventListener('click', function() {
                  if (currentSlide !== i && !isTransitioning) {
                    stopAutoSlide();
                    currentSlide = i;
                    showSlide(currentSlide);
                    setTimeout(startAutoSlide, 1000);
                  }
                });
              }
            }
          });
        </script>

        <@passkeys.conditionalUIData />
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="8" href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    <#elseif section = "socialProviders" >
        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                <hr/>
                <h2>${msg("identity-provider-login-label")}</h2>
                <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                    <#list social.providers as p>
                        <li>
                            <a id="social-${p.alias}"
                                    class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                                    type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </li>
                    </#list>
                </ul>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
