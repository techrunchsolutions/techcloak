<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Password Reset - Bluepay</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <style>
      body {
        background-color: #f5f5f5;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
      }

      .email-container {
        max-width: 600px;
        border-radius: 4px 4px 0 0;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
      }

      .text-bluepay {
        color: #313957;
      }

      .btn-bluepay {
        background-color: #0c74b1;
        color: white;
        border: none;
        border-radius: 10px;
        font-weight: 500;
        transition: background-color 0.2s ease;
        display: inline-block;
        padding: 12px 24px;
        text-align: center;
        text-decoration: none;
        font-family: "Inter", -apple-system, Roboto, Helvetica, sans-serif;
      }

      .btn-bluepay:hover {
        background-color: #095d8f;
        color: white;
      }

      .email-link {
        color: #0c74b1;
        text-decoration: none;
      }

      .email-link:hover {
        text-decoration: underline;
      }

   .ii a[href] {
    text-decoration:none;
}

      .font-basis {
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica,
          sans-serif;
      }
    </style>
  </head>
  <body>
    <article class="email-container bg-white p-4 p-md-5 w-100">
      <section class="mb-3">
        <p class="text-bluepay font-basis mb-0">
          Dear ${user.firstName!""},
        </p>
        <p class="text-bluepay font-basis mt-3">
          You have requested to reset the password to your account on Bluepay.
          Click the button below to get started.
        </p>
      </section>

      <p style="text-align: center; text-decoration:none;">
        <a href="${link}" class="btn-bluepay">Reset My Password</a>
      </p>

      <footer class="text-bluepay font-basis">
        <p>
          If you did not initiate this request, reply to this email or write to
          <a href="mailto:help@bluepay.com" class="email-link">help@bluepay.com</a>
          so we can look into a possible attempt to breach your account.
        </p>
        <p class="mb-0">Best Regards,</p>
        <p>Bluepay</p>
        <p class="mt-3">© Bluepay Ltd. 2025 | Modern Day Payment</p>
      </footer>
    </article>
  </body>
</html>
