<#import "template.ftl" as layout>
<@layout.emailLayout>
<!DOCTYPE html>
<html lang="${locale.language}" dir="${(ltr)?then('ltr','rtl')}">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            margin: 0;
            padding: 0;
            background-color: #f2f5f8;
            font-family: 'Basis Grotesque Pro', -apple-system, Roboto, Helvetica, sans-serif;
        }

        .email-container {
            background-color: rgba(242, 245, 248, 1);
            max-width: 640px;
            margin: 0 auto;
            font-family: 'Basis Grotesque Pro', -apple-system, Roboto, Helvetica, sans-serif;
        }

        .email-body {
            background-color: var(--Background-Default, #fff);
            font-size: 1rem;
            line-height: 1.625;
            font-weight: 400;
        }

        .greeting, .instruction-text, .closing, .copyright-text {
            color: var(--body-primary-color, #313957);
            font-feature-settings: "liga" off, "clig" off;
        }

        .instruction-text {
            text-transform: capitalize;
        }

        .confirm-button {
            background-color: var(--primary-color, #0c74b1);
            color: var(--Text-White, #fff);
            border-radius: 10px;
            min-height: 46px;
            font-family: Inter, -apple-system, Roboto, Helvetica, sans-serif;
            font-size: 0.875rem;
            font-weight: 500;
            line-height: 1.5;
            border: none;
            text-decoration: none;
            display: inline-block;
            padding: 11px 16px;
            width: 100%;
            text-align: center;
            box-sizing: border-box;
        }

        .confirm-button:hover {
            background-color: #0a5d8a;
            color: var(--Text-White, #fff);
            text-decoration: none;
        }

        .confirmation-link {
            line-height: 1.375rem;
            text-transform: capitalize;
            color: rgba(12, 116, 177, 1);
            word-break: break-all;
        }

        .email-footer {
            background-color: rgba(247, 249, 252, 1);
            border-radius: 0px 0px 4px 4px;
        }

        .logo {
            aspect-ratio: 3.26;
            object-fit: contain;
            object-position: center;
            width: 140px;
            max-width: 100%;
        }

        .social-icon {
            aspect-ratio: 1;
            object-fit: contain;
            object-position: center;
            width: 24px;
        }

        .copyright-text {
            line-height: 1.6;
        }

        @media (max-width: 991px) {
            .email-container {
                padding-left: 1.25rem !important;
                padding-right: 1.25rem !important;
            }

            .email-header {
                padding-left: 1.25rem !important;
                padding-right: 1.25rem !important;
            }

            .email-body {
                padding-left: 1.25rem !important;
                padding-right: 1.25rem !important;
            }

            .email-footer {
                padding-left: 1.25rem !important;
                padding-right: 1.25rem !important;
            }
        }
    </style>
</head>
<body>
    <div class="email-container pt-4 px-4">
        <header class="email-header d-flex flex-column align-items-start justify-content-center py-3 px-4">
            <img
                src="https://api.builder.io/api/v1/image/assets/TEMP/b17b76ac6ed6ba0bdf5dfcdebe33d9efcc621d42?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
                alt="Bluepay Logo"
                class="logo"
            />
        </header>

        <main class="email-body w-100 p-4 rounded-top">
            ${kcSanitize(msg("emailVerificationBodyHtml",link, linkExpiration, realmName, linkExpirationFormatter(linkExpiration)))?no_esc}
        </main>

        <footer class="email-footer w-100 d-flex flex-column align-items-stretch justify-content-center p-4 rounded-bottom">
            <div class="footer-content d-flex w-100 flex-column align-items-start">
                <div class="social-media d-flex align-items-center justify-content-start" style="gap: 1.5rem;">
                    <img
                        src="https://api.builder.io/api/v1/image/assets/TEMP/43b1c04489e17e67a511949d8f0f492dee2b0713?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
                        alt="Social Media Icon 1"
                        class="social-icon flex-shrink-0"
                    />
                    <img
                        src="https://api.builder.io/api/v1/image/assets/TEMP/be10376bebdfa825b9403fec672edd8c2421f0d0?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
                        alt="Social Media Icon 2"
                        class="social-icon flex-shrink-0"
                    />
                    <img
                        src="https://api.builder.io/api/v1/image/assets/TEMP/046e600a17197f6544a9d25f1938e4301f677afa?placeholderIfAbsent=true&apiKey=4fc790af8ec944d3b1d1ef4195c80612"
                        alt="Social Media Icon 3"
                        class="social-icon flex-shrink-0"
                    />
                </div>
            </div>
        </footer>
    </div>
</body>
</html>
</@layout.emailLayout>
