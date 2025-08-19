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
        background-color: #f2f5f8;
        min-height: 100vh;
      }
      .email-container {
        width: 640px;
        max-width: 100%;
        min-height: 770px;
        background-color: #f2f5f8;
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
    </style>
  </head>
  <body class="d-flex justify-content-center align-items-start py-4 px-3">
    <div class="email-container mx-auto p-4">
      <header class="d-flex flex-column align-items-start gap-4 w-100 py-4 px-5">
        <div style="width: 140px; height: 43px" class="position-relative">
          <img src="${url.resourcesPath}/img/blue-logo.svg" alt="BluePay" class="logo">
        </div>
      </header>

      <main class="email-body d-flex flex-column align-items-start gap-3 w-100 p-5">
        <section class="welcome-message w-100">
          Dear ${user.firstName!"Customer"},
          <br /><br />
          Thanks for signing up with Bluepay! To create your account and get started with accepting payments, please confirm your email address.
          <br /><br />
          Click the button below to complete your signup.
        </section>

        <a href="${link}" class="confirmation-button w-100 px-3 py-2" target="_blank">
          <span class="button-text">Confirm your email</span>
        </a>

        <section class="instructions-text w-100">
          If you’re having trouble clicking the button, copy and paste the URL below into your browser:
          <br /><br />
          <a href="${link}" class="confirmation-url">${link}</a>
        </section>

        <section class="instructions-text w-100">
          This link will expire in ${linkExpirationFormatter(linkExpiration)}.
        </section>

        <section class="closing-message w-100">
          Best regards,<br />
          The Bluepay Team
        </section>

        <section class="copyright-text w-100">
          © Bluepay Ltd. 2025 | Modern Day Payment
        </section>
      </main>

      <footer class="email-footer d-flex flex-column align-items-center gap-3 w-100 p-5">
        <!-- Optional: social icons could go here -->
        <p style="color: #6a7c94; font-size: 0.85rem;">Follow us on social media</p>
      </footer>
    </div>
  </body>
</html>

</@layout.emailLayout>

