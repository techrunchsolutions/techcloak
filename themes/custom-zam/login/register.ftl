<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=messagesPerField.exists('global') displayRequiredFields=true; section>
    <#if section == "header">
        <title>Sign Up - NASD ZAM</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet"/>
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css"/>
    <#elseif section == "form">
    <main class="position-relative min-vh-100">
        <!-- Left promotional content -->
        <div class="left-content">
            <div class="background-container">
                <img src="${url.resourcesPath}/img/car4.png" class="carousel-image active"/>
                <img src="${url.resourcesPath}/img/car5.png" class="carousel-image"/>
                <img src="${url.resourcesPath}/img/car6.png" class="carousel-image"/>
            </div>
        </div>

        <!-- Main Registration -->
        <section class="main-content">
            <div class="container-fluid h-100">
                <header class="d-flex justify-content-center align-items-center mb-4" style="margin-top:50px">
                    <div class="d-flex align-items-center gap-2">
                        <img src="${url.resourcesPath}/img/NASD Product logos.png" alt="logo"/>
                        <h1 class="fw-bold fs-4 mb-0 text-dark">NASD ZAM</h1>
                    </div>
                </header>

                <div class="text-center mb-5">
                    <h2 class="fw-bold fs-1 text-dark">Create your account</h2>
                </div>

                <form id="kc-register-form" action="${url.registrationAction}" method="post">
                    <div class="row g-4 mb-4">
                        <div class="col-md-6">
                            <label for="firstName" class="form-label fw-semibold fs-5">First Name</label>
                            <input type="text" id="firstName" name="firstName"
                                   value="${(register.formData.firstName!'')}"
                                   class="form-control form-control-lg bg-light-custom border-custom" required/>
                            <#if messagesPerField.existsError('firstName')>
                                <span class="text-danger">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
                            </#if>
                        </div>
                        <div class="col-md-6">
                            <label for="lastName" class="form-label fw-semibold fs-5">Last Name</label>
                            <input type="text" id="lastName" name="lastName"
                                   value="${(register.formData.lastName!'')}"
                                   class="form-control form-control-lg bg-light-custom border-custom" required/>
                            <#if messagesPerField.existsError('lastName')>
                                <span class="text-danger">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
                            </#if>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="email" class="form-label fw-semibold fs-5">Email</label>
                        <input type="email" id="email" name="email"
                               value="${(register.formData.email!'')}"
                               class="form-control form-control-lg bg-light-custom border-custom" required/>
                        <#if messagesPerField.existsError('email')>
                            <span class="text-danger">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
                        </#if>
                    </div>

                    <div class="mb-4">
                        <label for="password" class="form-label fw-semibold fs-5">Password</label>
                        <input type="password" id="password" name="password"
                               class="form-control form-control-lg bg-light-custom border-custom" required/>
                        <#if messagesPerField.existsError('password')>
                            <span class="text-danger">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                        </#if>
                    </div>

                    <div class="mb-4">
                        <label for="password-confirm" class="form-label fw-semibold fs-5">Confirm Password</label>
                        <input type="password" id="password-confirm" name="password-confirm"
                               class="form-control form-control-lg bg-light-custom border-custom" required/>
                        <#if messagesPerField.existsError('password-confirm')>
                            <span class="text-danger">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                        </#if>
                    </div>

                    <div class="d-grid mb-4">
                        <button type="submit"
                                class="btn bg-primary-custom text-white btn-lg py-3 fs-5 fw-semibold">
                            Create account
                        </button>
                    </div>
                </form>
            </div>
        </section>
    </main>
    </#if>
</@layout.registrationLayout>


