<#import "template.ftl" as layout>
<@layout.emailLayout>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Verify your Bluepay Email</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
      body {
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica, sans-serif;
        background-color: transparent;
        margin: 0;
        padding: 0;
      }
      .email-container {
        width: 100%;
        max-width: 600px;
        margin: 0 auto;
        background-color: transparent;
      }
      .bluepay-logo {
        width: 135px;
        height: 43px;
        object-fit: contain;
      }
      .email-body {
        border-radius: 4px 4px 0px 0px;
        background-color: #fff;
      }
      .welcome-message,
      .instructions-text,
      .closing-message,
      .copyright-text {
        color: #313957;
        font-feature-settings: "liga" off, "clig" off;
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica, sans-serif;
        font-weight: 400;
        line-height: 160%;
        font-size: 1rem;
      }
      .instructions-text {
        line-height: 1.4;
      }
      .confirmation-button {
        height: 46px;
        border-radius: 10px;
        background-color: #0c74b1;
        border: none;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        width: 100%;
      }
      .confirmation-button:hover {
        background-color: #0a5d8a;
      }
      .button-text {
        font-family: Inter, -apple-system, Roboto, Helvetica, sans-serif;
        font-weight: 500;
        font-size: 0.875rem;
        line-height: 1.5rem;
        color: #fff;
        display: inline-block;
        padding: 10px 20px;
      }
      .confirmation-url {
        color: #0c74b1;
        text-decoration: none;
        word-break: break-all;
      }
      .email-footer {
        border-radius: 0px 0px 4px 4px;
        background-color: #f7f9fc;
      }
      .social-icon {
        width: 24px;
        height: 24px;
        object-fit: contain;
      }
      .header-section {
        background-color: #f2f5f8;
        padding: 24px 32px;
      }
      .main-content {
        background-color: #fff;
        padding: 32px;
      }
      .footer-section {
        background-color: #f7f9fc;
        padding: 32px;
      }
      @media (max-width: 600px) {
        .email-container {
          width: 100% !important;
          max-width: 100% !important;
        }
        .header-section,
        .main-content,
        .footer-section {
          padding: 20px !important;
        }
      }
    </style>
  </head>
  <body>
    <div class="email-container">
      <header class="header-section">
        <div style="width: 140px; height: 43px" class="position-relative">
          <img src="${url.resourcesPath}/img/blue-logo.svg" alt="BluePay" class="bluepay-logo">
        </div>
      </header>

      <main class="main-content">
        <section class="welcome-message w-100 mb-3">
          Dear ${user.firstName!"Customer"},
          <br /><br />
          Thanks for signing up with Bluepay! To create your account and get started with accepting payments, please confirm your email address.
          <br /><br />
          Click the button below to complete your signup.
        </section>

        <div class="mb-3">
          <a href="${link}" class="confirmation-button d-flex justify-content-center align-items-center" target="_blank">
            <span class="button-text">Confirm your email</span>
          </a>
        </div>

        <section class="instructions-text w-100 mb-3">
          If you're having trouble clicking the button, copy and paste the URL below into your browser:
          <br /><br />
          <a href="${link}" class="confirmation-url">${link}</a>
        </section>

        <section class="instructions-text w-100 mb-3">
          This link will expire in ${linkExpirationFormatter(linkExpiration)}.
        </section>

        <section class="closing-message w-100 mb-3">
          Best regards,<br />
          The Bluepay Team
        </section>

        <section class="copyright-text w-100">
          © Bluepay Ltd. 2025 | Modern Day Payment
        </section>
      </main>

      <footer class="footer-section">
        <div class="d-flex justify-content-start align-items-center" style="gap: 24px;">
          <img
            src="https://api.builder.io/api/v1/image/assets/TEMP/43b1c04489e17e67a511949d8f0f492dee2b0713?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
            alt="Facebook"
            class="social-icon"
          />
          <img
            src="https://api.builder.io/api/v1/image/assets/TEMP/be10376bebdfa825b9403fec672edd8c2421f0d0?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
            alt="Twitter"
            class="social-icon"
          />
          <img
            src="https://api.builder.io/api/v1/image/assets/TEMP/046e600a17197f6544a9d25f1938e4301f677afa?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
            alt="LinkedIn"
            class="social-icon"
          />
        </div>
      </footer>
    </div>
  </body>
</html>

</@layout.emailLayout>
