<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <#if messageHeader??>
            ${kcSanitize(msg("${messageHeader}"))?no_esc}
        <#else>
            ${msg("registerTitle")}
        </#if>
    <#elseif section = "form">
        <style>
            body { font-family: 'Spline Sans', 'Noto Sans', sans-serif; }
            .register-container { min-height: 100vh; width: 100%; background-color: #e0f2fe; display: flex; }
            .left-panel { 
                width: 50%; height: 100vh; 
                background-image: url('https://img.freepik.com/premium-vector/business-training-illustration-concept-flat-illustration-isolated-white-background_701961-9696.jpg');
                background-size: cover; background-position: center; background-repeat: no-repeat;
            }
            .right-panel { 
                width: 50%; height: 100vh; display: flex; flex-direction: column; 
                justify-content: center; align-items: center; color: #0f172a; 
                padding: 32px 16px; overflow-y: auto;
            }
            .form-title { color: #0369a1; font-size: 28px; font-weight: bold; margin-bottom: 24px; text-align: center; }
            .form-wrapper { width: 75%; max-width: 400px; }
            .custom-input { 
                width: 100%; border-radius: 12px; color: #1e293b; border: 1px solid #7dd3fc; 
                background-color: white; height: 56px; padding: 16px; font-size: 16px; 
                margin-bottom: 16px; box-sizing: border-box;
            }
            .custom-input:focus { border-color: #0ea5e9; box-shadow: 0 0 0 2px rgba(14, 165, 233, 0.2); outline: none; }
            .register-button { 
                width: 100%; height: 48px; background-color: white; border: 1px solid #60a5fa; 
                color: #0369a1; font-weight: bold; border-radius: 12px; cursor: pointer; 
                font-size: 16px; margin-top: 8px;
            }
            .register-button:hover { background-color: #bae6fd; }
            .back-link { margin-top: 20px; text-align: center; }
            .back-link a { color: #0369a1; text-decoration: underline; }
            .error-message { color: #dc2626; font-size: 14px; margin-top: 6px; display: block; }
            @media (max-width: 768px) {
                .register-container { flex-direction: column; }
                .left-panel, .right-panel { width: 100%; }
                .left-panel { height: 200px; }
                .right-panel { height: auto; min-height: calc(100vh - 200px); }
                .form-wrapper { width: 90%; }
            }
        </style>

        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?display=swap&family=Noto+Sans:wght@400;500;700;900&family=Spline+Sans:wght@400;500;700" />

        <div class="register-container">
            <div class="left-panel"></div>
            <div class="right-panel">
                <h2 class="form-title">Sign Up</h2>
                <div class="form-wrapper">
                    <form id="kc-register-form" action="${url.registrationAction}" method="post">
                        
                        <@userProfileCommons.userProfileFormFields; callback, attribute>
                            <#if callback = "afterField">
                                <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                    <div style="margin-bottom: 16px;">
                                        <input type="password" id="password" name="password" class="custom-input" 
                                               placeholder="${msg("password")}" autocomplete="new-password" />
                                        <#if messagesPerField.existsError('password')>
                                            <span class="error-message">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                                        </#if>
                                    </div>
                                    
                                    <div style="margin-bottom: 16px;">
                                        <input type="password" id="password-confirm" name="password-confirm" class="custom-input"
                                               placeholder="${msg("passwordConfirm")}" autocomplete="new-password" />
                                        <#if messagesPerField.existsError('password-confirm')>
                                            <span class="error-message">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                                        </#if>
                                    </div>
                                </#if>
                            </#if>
                        </@userProfileCommons.userProfileFormFields>

                        <@registerCommons.termsAcceptance/>

                        <#if recaptchaRequired?? && (recaptchaVisible!false)>
                            <div style="margin: 16px 0; text-align: center;">
                                <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                            </div>
                        </#if>

                        <input type="submit" class="register-button" value="${msg("doRegister")}" />
                        
                        <div class="back-link">
                            <a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <script>
            // Apply styling to user profile inputs
            document.addEventListener('DOMContentLoaded', function() {
                const inputs = document.querySelectorAll('#kc-register-form input:not([type="submit"]):not([type="checkbox"]):not([type="radio"])');
                inputs.forEach(function(input) {
                    if (!input.classList.contains('custom-input')) {
                        input.classList.add('custom-input');
                    }
                });
            });
        </script>
    </#if>
</@layout.registrationLayout>
