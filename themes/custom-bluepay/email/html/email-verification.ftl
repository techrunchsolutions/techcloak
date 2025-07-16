<#import "template.ftl" as layout>
<@layout.emailLayout>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Verify your Bluepay Email</title>
    <style>
      body {
        font-family: "Basis Grotesque Pro", -apple-system, Roboto, Helvetica, sans-serif;
        background-color: #f2f5f8;
        margin: 0;
        padding: 0;
      }

      .email-container {
        width: 640px;
        max-width: 100%;
        background-color: #f2f5f8;
        margin: 0 auto;
        padding: 20px 0;
      }

      .bluepay-logo {
        width: 135px;
        height: 43px;
        object-fit: contain;
      }

      .email-body {
        border-radius: 4px 4px 0px 0px;
        background-color: #fff;
        padding: 40px;
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
        width: 100%;
        cursor: pointer;
        margin: 20px 0;
      }

      .button-text {
        font-family: Inter, -apple-system, Roboto, Helvetica, sans-serif;
        font-weight: 500;
        font-size: 0.875rem;
        line-height: 1.5rem;
        color: white;
      }

      .confirmation-url {
        color: #0c74b1;
        text-decoration: none;
        word-break: break-all;
      }

      .email-footer {
        border-radius: 0px 0px 4px 4px;
        background-color: #f7f9fc;
        padding: 40px;
        text-align: center;
      }

      .social-icon {
        width: 24px;
        height: 24px;
        margin: 0 10px;
      }

      @media (max-width: 640px) {
        .email-body, .email-footer {
          padding: 20px;
        }
        
        .bluepay-logo {
          width: 115px;
          height: 37px;
        }
      }
    </style>
</head>
<body>
    <div class="email-container">
      <header style="padding: 20px 40px;">
        <div style="width: 140px; height: 43px">
          <img
            src="https://api.builder.io/api/v1/image/assets/TEMP/34bd38628526155a31c7dd31263d8fb3c6d508bc?width=271"
            alt="Bluepay Logo"
            class="bluepay-logo"
          />
        </div>
      </header>

      <main class="email-body">
        <section class="welcome-message">
          Dear User,
          <br /><br />
          Thanks for signing up with Bluepay! To create your account and get
          started with accepting payments on Bluepay, we need you to confirm
          your email address.
          <br /><br />
          Please click the button below to complete your signup.
        </section>

        <a href="${link}" class="confirmation-button" style="text-decoration: none; display: block;">
          <div style="display: flex; justify-content: center; align-items: center; height: 100%;">
            <span class="button-text">Confirm your email</span>
          </div>
        </a>

        <section class="instructions-text">
          If you have any trouble clicking the button above, please copy and
          paste the URL below into your web browser.
          <br /><br />
          <a href="${link}" class="confirmation-url">${link}</a>
          <br /><br />
          This link will expire within ${linkExpirationFormatter(linkExpiration)}.
        </section>

        <section class="closing-message">
          <br />
          Best Regards,
          <br />
          Bluepay
        </section>

        <section class="copyright-text">
          <br />
          © Bluepay Ltd. ${.now?string('yyyy')} | Modern Day Payment
        </section>
      </main>

      <footer class="email-footer">
        <div style="margin-bottom: 20px;">
          <a href="#" aria-label="Follow us on Twitter" style="margin: 0 10px;">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="#6A7C94" xmlns="http://www.w3.org/2000/svg" class="social-icon">
              <path d="M22.1624 5.65593C21.399 5.99362 20.5894 6.2154 19.7604 6.31393C20.6342 5.79136 21.2881 4.96894 21.6004 3.99993C20.7804 4.48793 19.8814 4.82993 18.9444 5.01493C18.315 4.34151 17.4808 3.89489 16.5714 3.74451C15.662 3.59413 14.7284 3.74842 13.9157 4.18338C13.103 4.61834 12.4568 5.30961 12.0775 6.14972C11.6983 6.98983 11.6072 7.93171 11.8184 8.82893C10.1555 8.74558 8.52875 8.31345 7.04371 7.56059C5.55866 6.80773 4.24855 5.75097 3.19842 4.45893C2.82671 5.09738 2.63137 5.82315 2.63242 6.56193C2.63242 8.01193 3.37042 9.29293 4.49242 10.0429C3.82843 10.022 3.17905 9.84271 2.59842 9.51993V9.57193C2.59862 10.5376 2.93279 11.4735 3.54427 12.221C4.15575 12.9684 5.0069 13.4814 5.95342 13.6729C5.33703 13.84 4.69073 13.8646 4.06342 13.7449C4.33029 14.5762 4.85043 15.3031 5.55101 15.824C6.2516 16.3449 7.09755 16.6337 7.97042 16.6499C7.1029 17.3313 6.1096 17.8349 5.0473 18.1321C3.985 18.4293 2.87455 18.5142 1.77942 18.3819C3.69112 19.6114 5.91652 20.264 8.18942 20.2619C15.8824 20.2619 20.0894 13.8889 20.0894 8.36193C20.0894 8.18193 20.0844 7.99993 20.0764 7.82193C20.8953 7.23009 21.602 6.49695 22.1634 5.65693L22.1624 5.65593Z"/>
            </svg>
          </a>
          <a href="#" aria-label="Follow us on Facebook" style="margin: 0 10px;">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="#6A7C94" xmlns="http://www.w3.org/2000/svg" class="social-icon">
              <path d="M15.4021 21V14.034H17.7351L18.0841 11.326H15.4021V9.598C15.4021 8.814 15.6201 8.279 16.7441 8.279H18.1781V5.857C17.4839 5.78334 16.7862 5.74762 16.0881 5.75C14.0211 5.75 12.6061 7.012 12.6061 9.33V11.326H10.2681V14.034H12.6061V21H4.00012C3.73491 21 3.48055 20.8946 3.29302 20.7071C3.10548 20.5196 3.00012 20.2652 3.00012 20V4C3.00012 3.73478 3.10548 3.48043 3.29302 3.29289C3.48055 3.10536 3.73491 3 4.00012 3H20.0001C20.2653 3 20.5197 3.10536 20.7072 3.29289C20.8948 3.48043 21.0001 3.73478 21.0001 4V20C21.0001 20.2652 20.8948 20.5196 20.7072 20.7071C20.5197 20.8946 20.2653 21 20.0001 21H15.4021Z"/>
            </svg>
          </a>
          <a href="#" aria-label="Connect with us on LinkedIn" style="margin: 0 10px;">
            <svg width="24" height="24" viewBox="0 0 24 24" fill="#6A7C94" xmlns="http://www.w3.org/2000/svg" class="social-icon">
              <path d="M18.3351 18.339H15.6701V14.162C15.6701 13.166 15.6501 11.884 14.2801 11.884C12.8911 11.884 12.6791 12.968 12.6791 14.089V18.339H10.0131V9.75H12.5731V10.92H12.6081C12.9661 10.246 13.8361 9.533 15.1361 9.533C17.8361 9.533 18.3361 11.311 18.3361 13.624V18.339H18.3351ZM7.00312 8.575C6.79968 8.57526 6.59818 8.53537 6.41019 8.45761C6.22219 8.37984 6.05139 8.26574 5.90758 8.12184C5.76377 7.97793 5.64977 7.80706 5.57213 7.61901C5.49449 7.43097 5.45473 7.22944 5.45512 7.026C5.45532 6.71983 5.5463 6.4206 5.71656 6.16615C5.88682 5.91169 6.12872 5.71343 6.41165 5.59645C6.69459 5.47947 7.00586 5.44902 7.3061 5.50894C7.60635 5.56886 7.88208 5.71648 8.09843 5.93311C8.31478 6.14974 8.46204 6.42566 8.52157 6.72598C8.58111 7.0263 8.55025 7.33753 8.4329 7.62032C8.31556 7.9031 8.11699 8.14474 7.86231 8.31467C7.60764 8.4846 7.30829 8.5752 7.00212 8.575H7.00312ZM8.33912 18.339H5.66612V9.75H8.34012V18.339H8.33912ZM19.6701 3H4.32912C3.59312 3 3.00012 3.58 3.00012 4.297V19.703C3.00012 20.42 3.59412 21 4.32812 21H19.6661C20.4001 21 21.0001 20.42 21.0001 19.703V4.297C21.0001 3.58 20.4001 3 19.6661 3H19.6691H19.6701Z"/>
            </svg>
          </a>
        </div>
      </footer>
    </div>
</body>
</html>
</@layout.emailLayout>
