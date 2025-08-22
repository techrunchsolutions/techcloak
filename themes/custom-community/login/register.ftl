<#import "template.ftl" as layout>
<#import "user-profile-commons.ftl" as userProfileCommons>
<#import "register-commons.ftl" as registerCommons>

<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section = "header">
        <title>Community App — Sign Up</title>
        <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin />
        <link rel="stylesheet" as="style" onload="this.rel='stylesheet'"
              href="https://fonts.googleapis.com/css2?display=swap&amp;family=Noto+Sans%3Awght%40400%3B500%3B700%3B900&amp;family=Spline+Sans%3Awght%40400%3B500%3B700"/>
        <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <#elseif section = "form">
        <!-- Full-page layout -->
        <div class="flex min-h-screen w-full bg-sky-100" style="font-family: 'Spline Sans', 'Noto Sans', sans-serif">
            <!-- Left: Image -->
            <div class="w-1/2 h-screen bg-center bg-no-repeat bg-cover"
                 style="background-image: url('https://img.freepik.com/premium-vector/business-training-illustration-concept-flat-illustration-isolated-white-background_701961-9696.jpg');">
            </div>

            <!-- Right: Registration form -->
            <div class="w-1/2 h-screen flex flex-col justify-center items-center text-slate-900">
                <h2 class="text-sky-700 text-[28px] font-bold leading-tight pb-3">${msg("registerTitle")}</h2>

                <form id="kc-register-form" class="w-3/4" action="${url.registrationAction}" method="post">

                    <!-- Keycloak dynamic profile fields -->
                    <@userProfileCommons.userProfileFormFields; callback, attribute>
                        <#if callback = "beforeField">
                        <#elseif callback = "afterField">
                            <#-- Insert password fields AFTER username/email -->
                            <#if passwordRequired?? && (attribute.name == 'username' || (attribute.name == 'email' && realm.registrationEmailAsUsername))>
                                <div class="mb-4">
                                    <input type="password" id="password" name="password" placeholder="${msg('password')}"
                                           class="form-input w-full rounded-xl text-slate-800 border border-sky-300 bg-white h-14 placeholder:text-slate-400 p-4 text-base focus:outline-none focus:ring-2 focus:ring-sky-500"
                                           autocomplete="new-password"
                                           aria-invalid="<#if messagesPerField.existsError('password')>true</#if>"/>
                                    <#if messagesPerField.existsError('password')>
                                        <span class="text-red-600 text-sm">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                                    </#if>
                                </div>

                                <div class="mb-4">
                                    <input type="password" id="password-confirm" name="password-confirm" placeholder="${msg('passwordConfirm')}"
                                           class="form-input w-full rounded-xl text-slate-800 border border-sky-300 bg-white h-14 placeholder:text-slate-400 p-4 text-base focus:outline-none focus:ring-2 focus:ring-sky-500"
                                           autocomplete="new-password"
                                           aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>"/>
                                    <#if messagesPerField.existsError('password-confirm')>
                                        <span class="text-red-600 text-sm">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                                    </#if>
                                </div>
                            </#if>
                        </#if>
                    </@userProfileCommons.userProfileFormFields>

                    <!-- Terms & Conditions -->
                    <@registerCommons.termsAcceptance/>

                    <!-- reCAPTCHA -->
                    <#if recaptchaRequired??>
                        <div class="mb-4">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}" data-action="${recaptchaAction}"></div>
                        </div>
                    </#if>

                    <!-- Submit Button -->
                    <div>
                        <input class="w-full h-12 bg-white border border-sky-400 hover:bg-sky-200 text-sky-700 font-bold rounded-xl transition-colors duration-200"
                               type="submit" value="${msg('doRegister')}"/>
                    </div>

                    <!-- Back to Login -->
                    <div class="mt-4 text-center">
                        <a href="${url.loginUrl}" class="text-sky-600 hover:underline">${msg('backToLogin')}</a>
                    </div>
                </form>
            </div>
        </div>
    </#if>
</@layout.registrationLayout>
