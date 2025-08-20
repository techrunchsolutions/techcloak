<#import "template.ftl" as layout>
<@layout.registrationLayout 
    displayMessage=!(messagesPerField.exists('username') || messagesPerField.exists('password')) 
    displayInfo=(realm.password && realm.registrationAllowed && !(registrationDisabled??)); 
    section>
    <#if section = "header">
        ${msg("doLogIn")}
    <#elseif section = "form">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css"
      rel="stylesheet"
    />
    <style>
      body {
        font-family: "Segoe UI", -apple-system, Roboto, Helvetica, sans-serif;
        overflow-x: hidden;
      }

      .tap {
        font-size: 0.87rem !important;
      }

      .brand-font {
        font-family: "Champagne & Limousines", -apple-system, Roboto, Helvetica,
          sans-serif;
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

      .bg-overlay {
        background-color: rgba(0, 0, 0, 0.1);
        backdrop-filter: blur(11px);
      }

      #kc-info-wrapper {
        display: none;
      }

      .login-pf-page .card-pf {
        padding: 0px;
        margin-bottom: 0;
        max-width: 15000px !important;
        border-top: 0px solid transparent;
      }

      .login-pf-header, .login-pf-page-header {
        display: none !important;
      }

      .login-pf-page {
        padding-top: 0px;
      }

      #kc-content-wrapper {
        margin-top: 0px;
      }

      #kc-info {
        margin: 0px;
      }

      html, body {
        overflow-x: hidden;
      }

      .left-content {
        position: fixed;
        left: 0;
        top: 0;
        width: 50%;
        height: 100vh;
        overflow: hidden;
        z-index: 1;
      }

      .main-content {
        position: absolute;
        right: 0;
        top: 0;
        width: 50%;
        min-height: 100vh;
        z-index: 5;
        padding: 0 24px;
        background-color: white;
      }

      .carousel-indicator-active {
        width: 42px;
        height: 9px;
        border-radius: 24px;
        background-color: #fff;
        transition: all 0.3s ease;
      }

      .carousel-indicator {
        width: 10px;
        height: 9px;
        border-radius: 24px;
        background-color: #909090;
        transition: all 0.3s ease;
      }

      .btn-disabled {
        opacity: 0.6;
        cursor: not-allowed;
      }

      .carousel-image {
        opacity: 0;
        transition: opacity 0.5s ease;
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }

      .carousel-image.active {
        opacity: 1;
      }

      .background-container {
        position: relative;
        width: 100%;
        height: 100%;
        overflow: hidden;
      }

      .decorative-ellipse {
        border-radius: 50%;
        background: rgba(217, 217, 217, 0.23);
        position: absolute;
      }

      .decorative-ellipse-red {
        width: 120px;
        height: 120px;
        bottom: 100px;
        right: 50px;
        z-index: 2;
      }

      .decorative-ellipse-gray-large {
        width: 200px;
        height: 200px;
        top: 50px;
        right: 20px;
        z-index: 1;
      }

      .decorative-ellipse-gray-medium {
        width: 150px;
        height: 150px;
        bottom: 200px;
        left: 20px;
        z-index: 1;
      }

      .decorative-ellipse-gray-small {
        width: 100px;
        height: 100px;
        top: 150px;
        left: 50px;
        z-index: 1;
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

      .promotional-section {
        position: absolute;
        bottom: 80px;
        left: 50%;
        transform: translateX(-50%);
        width: 90%;
        max-width: 450px;
        z-index: 4;
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
        text-decoration: none;
      }

      .social-icon:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      }

      .error-message {
        color: #dc3545;
        font-size: 0.875rem;
        margin-top: 0.25rem;
      }

      .custom-container {
        position: relative;
        min-height: 100vh;
        display: flex;
      }

      @media (max-width: 1200px) {
        .left-content {
          display: none !important;
        }

        .main-content {
          width: 100% !important;
          position: relative !important;
          right: auto !important;
          padding: 20px !important;
        }

        .custom-container {
          display: block;
        }
      }

      @media (max-width: 768px) {
        .main-content {
          padding: 15px !important;
        }
      }
    </style>

    <div class="custom-container bg-white">
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
              fill="#EC232A"
            ></ellipse>
          </svg>

          <div class="decorative-ellipse decorative-ellipse-gray-large"></div>
          <div class="decorative-ellipse decorative-ellipse-gray-medium"></div>
          <div class="decorative-ellipse decorative-ellipse-gray-small"></div>

          <!-- Promotional Section -->
          <section
            class="promotional-section bg-overlay text-white rounded-3 p-4"
          >
            <header class="text-center mb-3">
              <h3 class="fw-semibold fs-5 lh-base">
                Discover your communication potential
              </h3>
            </header>
            <p class="text-center mb-4 lh-sm small">
              Tired of using non-privacy communication system? Customize your
              organization chat and branding the way its suit you and your
              business. We have all the parameters and functionalities you need
              to push your business communication to the next level.
            </p>
            <div class="d-flex justify-content-center align-items-center gap-3">
              <button
                class="btn btn-link p-0 text-white"
                id="carousel-prev"
                style="display: none"
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
              <div class="d-flex align-items-center gap-2">
                <div class="carousel-indicator-active" id="indicator-1"></div>
                <div class="carousel-indicator" id="indicator-2"></div>
                <div class="carousel-indicator" id="indicator-3"></div>
              </div>
              <button class="btn btn-link p-0 text-white" id="carousel-next">
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
          </section>
        </div>
      </div>

      <!-- Main Content Area -->
      <section class="main-content">
        <div class="container-fluid h-100">
          <!-- Header with Logo -->
          <header
            class="d-flex justify-content-center align-items-center mb-4"
            style="margin-top: 100px"
          >
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
                <defs>
                  <filter
                    id="filter0_d_241_52"
                    x="6.03905"
                    y="5.78515"
                    width="16.8262"
                    height="15.9532"
                    filterUnits="userSpaceOnUse"
                    color-interpolation-filters="sRGB"
                  >
                    <feFlood
                      flood-opacity="0"
                      result="BackgroundImageFix"
                    ></feFlood>
                    <feColorMatrix
                      in="SourceAlpha"
                      type="matrix"
                      values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
                      result="hardAlpha"
                    ></feColorMatrix>
                    <feOffset dx="0.251956" dy="1.25978"></feOffset>
                    <feGaussianBlur stdDeviation="0.755868"></feGaussianBlur>
                    <feComposite in2="hardAlpha" operator="out"></feComposite>
                    <feColorMatrix
                      type="matrix"
                      values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.25 0"
                    ></feColorMatrix>
                    <feBlend
                      mode="normal"
                      in2="BackgroundImageFix"
                      result="effect1_dropShadow_241_52"
                    ></feBlend>
                    <feBlend
                      mode="normal"
                      in="SourceGraphic"
                      in2="effect1_dropShadow_241_52"
                      result="shape"
                    ></feBlend>
                  </filter>
                  <filter
                    id="filter1_d_241_52"
                    x="5.97362"
                    y="13.9922"
                    width="14.9444"
                    height="16.0274"
                    filterUnits="userSpaceOnUse"
                    color-interpolation-filters="sRGB"
                  >
                    <feFlood
                      flood-opacity="0"
                      result="BackgroundImageFix"
                    ></feFlood>
                    <feColorMatrix
                      in="SourceAlpha"
                      type="matrix"
                      values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 127 0"
                      result="hardAlpha"
                    ></feColorMatrix>
                    <feOffset dx="-0.251956" dy="-1.25978"></feOffset>
                    <feGaussianBlur stdDeviation="0.503912"></feGaussianBlur>
                    <feComposite in2="hardAlpha" operator="out"></feComposite>
                    <feColorMatrix
                      type="matrix"
                      values="0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0.3 0"
                    ></feColorMatrix>
                    <feBlend
                      mode="normal"
                      in2="BackgroundImageFix"
                      result="effect1_dropShadow_241_52"
                    ></feBlend>
                    <feBlend
                      mode="normal"
                      in="SourceGraphic"
                      in2="effect1_dropShadow_241_52"
                      result="shape"
                    ></feBlend>
                  </filter>
                  <clipPath id="clip0_241_52">
                    <rect
                      y="0.111328"
                      width="38.0454"
                      height="35.7778"
                      rx="4.28325"
                      fill="white"
                    ></rect>
                  </clipPath>
                </defs>
              </svg>
              <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">
                NASD-Communication System
              </h1>
            </div>
          </header>

          <!-- Page Title -->
          <div class="text-center mb-5">
            <h2 class="fw-bold fs-1 text-dark">${msg("doLogIn")}</h2>
          </div>

          <!-- Display Messages -->
          <#if message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
            <div class="alert alert-<#if message.type = 'error'>danger<#elseif message.type = 'success'>success<#else>info</#if> mb-4" role="alert">
              ${kcSanitize(message.summary)?no_esc}
            </div>
          </#if>

          <!-- Login Form -->
          <#if realm.password>
            <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}" method="post" class="mx-auto" style="max-width: 532px">
              <div class="mb-4">
                <label for="username" class="form-label fw-semibold fs-5">
                  <#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>
                </label>
                <input
                  type="text"
                  class="form-control form-control-lg bg-light-custom border-custom <#if messagesPerField.existsError('username','password')>is-invalid</#if>"
                  id="username"
                  name="username"
                  value="${(login.username!'')}"
                  placeholder="<#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if>"
                  style="height: 60px"
                  tabindex="1"
                  autofocus
                  autocomplete="<#if realm.loginWithEmailAllowed>email<#else>username</#if>"
                  required
                />
                <#if messagesPerField.existsError('username','password')>
                  <div class="error-message">
                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                  </div>
                </#if>
              </div>

              <div class="mb-4">
                <label for="password" class="form-label fw-semibold fs-5">${msg("password")}</label>
                <div class="input-container">
                  <input
                    type="password"
                    class="form-control form-control-lg bg-light-custom border-custom <#if messagesPerField.existsError('username','password')>is-invalid</#if>"
                    id="password"
                    name="password"
                    placeholder="${msg("password")}"
                    style="height: 60px; padding-right: 50px"
                    tabindex="2"
                    autocomplete="current-password"
                    required
                  />
                  <i class="bi bi-eye password-toggle" id="password-toggle"></i>
                </div>
              </div>

              <#if realm.rememberMe && !usernameHidden??>
                <div class="form-check mb-4">
                  <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe" tabindex="3" <#if login.rememberMe??>checked</#if>>
                  <label class="form-check-label" for="rememberMe">
                    ${msg("rememberMe")}
                  </label>
                </div>
              </#if>

              <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                <#if realm.resetPasswordAllowed>
                  <a href="${url.loginResetCredentialsUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                    ${msg("doForgotPassword")}
                  </a>
                <#else>
                  <span></span>
                </#if>
                <#if realm.registrationAllowed && !registrationDisabled??>
                  <a href="${url.registrationUrl}" class="btn btn-link text-primary-custom text-decoration-underline p-0">
                    ${msg("doRegister")}
                  </a>
                </#if>
              </div>

              <div class="text-center mb-4">
                <small class="text-muted-custom">
                  By registering, you agree to ZAM's
                  <a href="#" class="btn btn-link text-primary-custom text-decoration-underline p-0 small tap">
                    Terms of Service
                  </a>
                  and
                  <a href="#" class="btn btn-link text-primary-custom text-decoration-underline p-0 small tap">
                    Privacy Policy
                  </a>
                </small>
              </div>

              <div class="d-grid mb-4">
                <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                <button
                  type="submit"
                  class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold"
                  id="kc-login"
                  name="login"
                  tabindex="4"
                >
                  ${msg("doLogIn")}
                </button>
              </div>

              <!-- Social Media Icons -->
              <#if realm.password && social.providers??>
                <div class="social-icons">
                  <#list social.providers as p>
                    <a href="${p.loginUrl}" class="social-icon" title="${p.displayName}">
                      <#if p.providerId == "google">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z" fill="#4285F4"/>
                          <path d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z" fill="#34A853"/>
                          <path d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z" fill="#FBBC05"/>
                          <path d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z" fill="#EA4335"/>
                        </svg>
                      <#elseif p.providerId == "facebook">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M24 12.073c0-6.627-5.373-12-12-12s-12 5.373-12 12c0 5.99 4.388 10.954 10.125 11.854v-8.385H7.078v-3.47h3.047V9.43c0-3.007 1.792-4.669 4.533-4.669 1.312 0 2.686.235 2.686.235v2.953H15.83c-1.491 0-1.956.925-1.956 1.874v2.25h3.328l-.532 3.47h-2.796v8.385C19.612 23.027 24 18.062 24 12.073z" fill="#1877F2"/>
                        </svg>
                      <#elseif p.providerId == "apple">
                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                          <path d="M12.152 6.896c-.948 0-2.415-1.078-3.96-1.04-2.04.027-3.91 1.183-4.961 3.014-2.117 3.675-.546 9.103 1.519 12.09 1.013 1.454 2.208 3.09 3.792 3.039 1.52-.065 2.09-.987 3.935-.987 1.831 0 2.35.987 3.96.948 1.637-.026 2.676-1.48 3.676-2.948 1.156-1.688 1.636-3.325 1.662-3.415-.039-.013-3.182-1.221-3.22-4.857-.026-3.04 2.48-4.494 2.597-4.559-1.429-2.09-3.623-2.324-4.39-2.376-2-.156-3.675 1.09-4.61 1.09zM15.53 3.83c.843-1.012 1.4-2.427 1.245-3.83-1.207.052-2.662.805-3.532 1.818-.78.896-1.454 2.338-1.273 3.714 1.338.104 2.715-.688 3.559-1.701" fill="#000"/>
                        </svg>
                      <#else>
                        <span class="fw-bold">${p.displayName?substring(0,1)}</span>
                      </#if>
                    </a>
                  </#list>
                </div>
              </#if>

              <!-- Footer -->
              <footer class="text-center">
                <small class="text-muted-custom">
                  © 2024 NASD Plc. All rights reserved
                </small>
              </footer>
            </form>
          </#if>
        </div>
      </section>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
      // Carousel functionality
      let currentSlide = 1;
      const totalSlides = 3;
      let autoSlideInterval;

      function showSlide(slideNumber) {
        // Hide all images
        for (let i = 1; i <= totalSlides; i++) {
          const img = document.getElementById(`carousel-img-${i}`);
          const indicator = document.getElementById(`indicator-${i}`);
          if (img) img.classList.remove("active");
          if (indicator) indicator.className = "carousel-indicator";
        }

        // Show current image
        const currentImg = document.getElementById(`carousel-img-${slideNumber}`);
        const currentIndicator = document.getElementById(`indicator-${slideNumber}`);
        if (currentImg) currentImg.classList.add("active");
        if (currentIndicator) currentIndicator.className = "carousel-indicator-active";

        // Update navigation buttons
        const prevBtn = document.getElementById("carousel-prev");
        const nextBtn = document.getElementById("carousel-next");
        if (prevBtn) prevBtn.style.display = slideNumber === 1 ? "none" : "block";
        if (nextBtn) nextBtn.style.display = slideNumber === totalSlides ? "none" : "block";
      }

      function nextSlide() {
        if (currentSlide < totalSlides) {
          currentSlide++;
          showSlide(currentSlide);
        }
      }

      function prevSlide() {
        if (currentSlide > 1) {
          currentSlide--;
          showSlide(currentSlide);
        }
      }

      function startAutoSlide() {
        autoSlideInterval = setInterval(() => {
          if (currentSlide < totalSlides) {
            nextSlide();
          } else {
            currentSlide = 1;
            showSlide(currentSlide);
          }
        }, 5000);
      }

      function stopAutoSlide() {
        clearInterval(autoSlideInterval);
      }

      // Event listeners for carousel
      const nextBtn = document.getElementById("carousel-next");
      const prevBtn = document.getElementById("carousel-prev");

      if (nextBtn) {
        nextBtn.addEventListener("click", () => {
          stopAutoSlide();
          nextSlide();
          startAutoSlide();
        });
      }

      if (prevBtn) {
        prevBtn.addEventListener("click", () => {
          stopAutoSlide();
          prevSlide();
          startAutoSlide();
        });
      }

      // Start auto-slide
      startAutoSlide();

      // Password toggle functionality
      const passwordToggle = document.getElementById("password-toggle");
      if (passwordToggle) {
        passwordToggle.addEventListener("click", () => {
          const passwordInput = document.getElementById("password");
          const toggle = document.getElementById("password-toggle");

          if (passwordInput.type === "password") {
            passwordInput.type = "text";
            toggle.classList.remove("bi-eye");
            toggle.classList.add("bi-eye-slash");
          } else {
            passwordInput.type = "password";
            toggle.classList.remove("bi-eye-slash");
            toggle.classList.add("bi-eye");
          }
        });
      }
    </script>
    </#if>
</@layout.registrationLayout>
