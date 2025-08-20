<#import "template.ftl" as layout>

<@layout.registrationLayout; section>
  <#if section = "title">
    ${msg("loginTitle")}
  <#elseif section = "header">
    <h1 class="brand-font fw-bold fs-4 mb-0 text-dark">NASD-Communication System</h1>
  <#elseif section = "form">

  <!-- Main Page Title -->
  <div class="text-center mb-5">
    <h2 class="fw-bold fs-1 text-dark">Login to your account</h2>
  </div>

  <!-- Login Form -->
  <form id="kc-form-login" class="mx-auto" style="max-width: 532px"
        onsubmit="login.disabled = true; return true;"
        action="${url.loginAction}" method="post">

    <!-- Username -->
    <div class="mb-4">
      <label for="username" class="form-label fw-semibold fs-5">${msg("username")}</label>
      <input type="text"
             id="username"
             name="username"
             class="form-control form-control-lg bg-light-custom border-custom"
             value="${(login.username!'')}"
             placeholder="Enter your email"
             style="height: 60px"
             required autofocus />
      <#if messagesPerField.existsError('username')>
        <div class="text-danger small mt-1">${kcSanitize(messagesPerField.get('username'))?no_esc}</div>
      </#if>
    </div>

    <!-- Password -->
    <div class="mb-4">
      <label for="password" class="form-label fw-semibold fs-5">${msg("password")}</label>
      <div class="input-container">
        <input type="password"
               id="password"
               name="password"
               class="form-control form-control-lg bg-light-custom border-custom"
               placeholder="Enter your password"
               style="height: 60px; padding-right: 50px"
               required />
        <i class="bi bi-eye password-toggle" id="password-toggle"></i>
      </div>
      <#if messagesPerField.existsError('password')>
        <div class="text-danger small mt-1">${kcSanitize(messagesPerField.get('password'))?no_esc}</div>
      </#if>
    </div>

    <!-- Remember Me -->
    <#if realm.rememberMe && !usernameEditDisabled??>
      <div class="form-check mb-3">
        <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe"
               <#if login.rememberMe?? && login.rememberMe>checked</#if>>
        <label class="form-check-label" for="rememberMe">${msg("rememberMe")}</label>
      </div>
    </#if>

    <!-- Forgot password / Register -->
    <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
      <#if realm.resetPasswordAllowed>
        <a class="btn btn-link text-primary-custom text-decoration-underline p-0"
           href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a>
      </#if>
      <#if realm.registrationAllowed && !registrationDisabled??>
        <a class="btn btn-link text-primary-custom text-decoration-underline p-0"
           href="${url.registrationUrl}">${msg("doRegister")}</a>
      </#if>
    </div>

    <!-- Submit -->
    <div class="d-grid mb-4">
      <button tabindex="3"
              name="login"
              id="kc-login"
              type="submit"
              class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold">
        ${msg("doLogIn")}
      </button>
    </div>

  </form>

  <!-- Footer -->
  <footer class="text-center">
    <small class="text-muted-custom">© 2024 NASD Plc. All rights reserved</small>
  </footer>

  <!-- ===== JS Section ===== -->
  <script>
    // Carousel logic
    let currentSlide = 1;
    const totalSlides = 3;
    let autoSlideInterval;

    function showSlide(slideNumber) {
      for (let i = 1; i <= totalSlides; i++) {
        document.getElementById(`carousel-img-${i}`)?.classList.remove("active");
        document.getElementById(`indicator-${i}`)?.classList.remove("carousel-indicator-active");
        if (document.getElementById(`indicator-${i}`)) {
          document.getElementById(`indicator-${i}`).classList.add("carousel-indicator");
        }
      }
      document.getElementById(`carousel-img-${slideNumber}`)?.classList.add("active");
      if (document.getElementById(`indicator-${slideNumber}`)) {
        document.getElementById(`indicator-${slideNumber}`).className = "carousel-indicator-active";
      }
    }

    function nextSlide() {
      if (currentSlide < totalSlides) {
        currentSlide++;
        showSlide(currentSlide);
      } else {
        currentSlide = 1;
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
      autoSlideInterval = setInterval(() => nextSlide(), 5000);
    }
    function stopAutoSlide() {
      clearInterval(autoSlideInterval);
    }

    document.getElementById("carousel-next")?.addEventListener("click", () => {
      stopAutoSlide(); nextSlide(); startAutoSlide();
    });
    document.getElementById("carousel-prev")?.addEventListener("click", () => {
      stopAutoSlide(); prevSlide(); startAutoSlide();
    });

    startAutoSlide();

    // Password toggle
    const toggle = document.getElementById("password-toggle");
    const passwordInput = document.getElementById("password");
    toggle?.addEventListener("click", () => {
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
  </script>

  </#if>
</@layout.registrationLayout>
