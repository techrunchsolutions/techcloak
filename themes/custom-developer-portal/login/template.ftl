<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false displayWide=false showAnotherWayIfPresent=true>
<!DOCTYPE html>
<html lang="en" class="${properties.kcHtmlClass!}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>

    <title>${msg("loginTitle",(realm.displayName!''))}</title>

    <link rel="icon" href="${url.resourcesPath}/img/favicon.ico" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&display=swap" rel="stylesheet">

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>

    <style>
        /* JustJava Custom Styles for Keycloak */
        :root {
            --background-color: #0F172A;
            --surface-color: #1E293B;
            --primary-color: #3B82F6;
            --primary-hover-color: #2563EB;
            --text-primary: #E2E8F0;
            --text-secondary: #94A3B8;
            --border-color: #334155;
            --input-background: #334155;
            --input-border: #475569;
            --error-color: #EF4444;
            --success-color: #10B981;
        }

        body {
            font-family: 'Inter', sans-serif;
            background-color: var(--background-color);
            color: var(--text-primary);
            margin: 0;
            padding: 0;
        }

        .taskify-page {
            background-color: var(--background-color);
            min-height: 100vh;
        }

        .main-section {
            background: url("${url.resourcesPath}/img/justjava-bg.png") lightgray center / cover no-repeat;
            padding-top: 6.25rem;
            min-height: 100vh;
            position: relative;
        }

        /* Background decoration */
        .main-section::before {
            content: '';
            position: absolute;
            inset: 0;
            background: linear-gradient(45deg, rgba(255, 128, 181, 0.3), rgba(144, 137, 252, 0.3));
            filter: blur(100px);
            z-index: 0;
        }

        .site-header {
            height: 6.25rem;
            backdrop-filter: blur(20px);
        }

        .company-logo {
            width: 5rem;
            height: 2.5rem;
            margin-right: 0.75rem;
        }

        .nav-text {
            font-size: 1.125rem;
            font-weight: 400;
            transition: color 0.3s ease;
        }

        .nav-text:hover {
            color: var(--primary-color) !important;
        }

        .auth-container {
            background: rgba(30, 41, 59, 0.95);
            backdrop-filter: blur(20px);
            border-radius: 1.5rem;
            border: 1px solid var(--border-color);
            box-shadow: 0px 8px 32px 0px rgba(59, 130, 246, 0.15);
            max-width: 600px;
            position: relative;
            z-index: 1;
        }

        .auth-title {
            color: #fff;
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .auth-subtitle {
            color: var(--text-secondary);
            font-size: 1rem;
            font-weight: 400;
            margin-bottom: 2rem;
        }

        .form-label {
            color: #fff;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 0.5rem;
        }

        .form-control {
            background: var(--input-background);
            border: 1px solid var(--input-border);
            border-radius: 0.75rem;
            color: #fff;
            font-size: 1rem;
            padding: 0.875rem 1rem;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: var(--primary-color);
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
            color: #fff;
        }

        .form-control::placeholder {
            color: var(--text-secondary);
        }

        .form-control.is-invalid {
            border-color: var(--error-color);
        }

        .form-check-input {
            background: rgba(255, 255, 255, 0.05);
            border-color: var(--border-color);
        }

        .form-check-input:checked {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .form-check-input:focus {
            box-shadow: 0 0 0 0.2rem rgba(59, 130, 246, 0.25);
        }

        .submit-button {
            border-radius: 0.75rem;
            background: linear-gradient(180deg, #1d4ed8 0%, #3b82f6 100%);
            box-shadow: 0px 2px 8px 0px rgba(29, 78, 216, 0.15);
            border: none;
            color: #fff;
            font-weight: 500;
            font-size: 1rem;
            padding: 0.875rem 2rem;
            transition: all 0.3s ease;
            width: 100%;
            cursor: pointer;
        }

        .submit-button:hover {
            background: linear-gradient(180deg, #1e40af 0%, #2563eb 100%);
            transform: translateY(-2px);
            color: #fff;
        }

        .submit-button:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        .auth-link {
            color: var(--primary-color);
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s ease;
        }

        .auth-link:hover {
            color: var(--primary-hover-color);
            text-decoration: underline;
        }

        .divider {
            color: #64748b;
            font-size: 0.875rem;
            position: relative;
        }

        .divider::before,
        .divider::after {
            content: '';
            position: absolute;
            top: 50%;
            width: 45%;
            height: 1px;
            background: rgba(100, 116, 139, 0.3);
        }

        .divider::before {
            left: 0;
        }

        .divider::after {
            right: 0;
        }

        .alert {
            border-radius: 0.75rem;
            border: none;
            margin-bottom: 1rem;
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.1);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
        }

        .alert-warning {
            background: rgba(245, 158, 11, 0.1);
            border: 1px solid rgba(245, 158, 11, 0.3);
            color: #fcd34d;
        }

        .alert-success {
            background: rgba(34, 197, 94, 0.1);
            border: 1px solid rgba(34, 197, 94, 0.3);
            color: #86efac;
        }

        .alert-info {
            background: rgba(59, 130, 246, 0.1);
            border: 1px solid rgba(59, 130, 246, 0.3);
            color: #93c5fd;
        }

        .field-error {
            color: #fca5a5;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }

        /* Responsive adjustments */
        @media (max-width: 991px) {
            .main-section {
                padding-top: 5rem;
            }
        }

        @media (max-width: 640px) {
            .site-header {
                height: 5rem;
            }

            .auth-title {
                font-size: 1.5rem;
            }

            .auth-container {
                margin: 1rem;
            }

            .company-logo {
                width: 3rem;
                height: 1.5rem;
            }
        }
    </style>
</head>

<body class="taskify-page">
    <div class="d-flex w-100 min-vh-100 justify-content-center align-items-center position-relative">
        <div class="w-100 min-vh-100 position-relative">
            <section class="main-section w-100 min-vh-100 position-relative d-flex align-items-center">
                <header class="site-header w-100 position-fixed top-0 start-0 d-flex align-items-center justify-content-between px-5" style="z-index: 1000;">
                    <a href="${url.loginUrl}" class="text-decoration-none d-flex align-items-center">
                        <img
                            src="${url.resourcesPath}/img/justjava-logo.svg"
                            alt="JustJava Logo"
                            class="company-logo"
                        />
                        <span style="color: white; font-weight: bold; font-size: 1.5rem;">JustJava</span>
                    </a>
                </header>

                <div class="container d-flex justify-content-center align-items-center min-vh-100">
                    <div class="auth-container p-5">
                        <#nested "header">

                        <#if displayMessage && message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                            <div class="alert alert-${message.type}">
                                <#if message.type = 'success'><span class="pficon pficon-ok"></span></#if>
                                <#if message.type = 'warning'><span class="pficon pficon-warning-triangle-o"></span></#if>
                                <#if message.type = 'error'><span class="pficon pficon-error-circle-o"></span></#if>
                                <#if message.type = 'info'><span class="pficon pficon-info"></span></#if>
                                <span class="kc-feedback-text">${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>

                        <#nested "form">

                        <#if auth?has_content && auth.showTryAnotherWayLink() && showAnotherWayIfPresent>
                            <form id="kc-select-try-another-way-form" action="${url.loginAction}" method="post">
                                <div class="text-center mt-3">
                                    <input type="hidden" name="tryAnotherWay" value="on"/>
                                    <a href="#" id="try-another-way" onclick="document.forms['kc-select-try-another-way-form'].submit();return false;" class="auth-link">${msg("doTryAnotherWay")}</a>
                                </div>
                            </form>
                        </#if>

                        <#if displayInfo>
                            <div class="text-center mt-4">
                                <#nested "info">
                            </div>
                        </#if>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
</body>
</html>
</#macro>

