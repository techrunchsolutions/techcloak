<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        <title>BluePay Registration</title>
        
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <link rel="stylesheet" href="${url.resourcesPath}/css/register.css">
    <#elseif section = "form">
        <div class="container-fluid px-0">
            <div class="d-flex flex-row">
                <div class="left-panel position-fixed top-0 vh-100">
                    <img src="${url.resourcesPath}/img/logo.svg" class="mt-5 ms-3" alt="BluePay Logo">
                </div>
                
                <div class="d-flex align-items-center right-panel">
                    <div class="form-container">
                        <div class="mb-5">
                            <h2 class="fw-bold darker-text">${msg("Create Your Account")}</h2>
                            <p class="text-muted dark-text input-small-text">${msg("Provide your basic information")}</p>
                        </div>
                        
                        <form id="kc-register-form" action="${url.registrationAction}" method="post">
                            <div class="mb-3">
                                <label class="form-label input-small-text dark-text">${msg("Country")}</label>
                                <select class="form-select input-field select-field" name="user.attributes.country" required>
                                    <option selected>${msg("Nigeria")}</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("Business Name")}</label>
                                <input type="text" class="form-control input-field" name="user.attributes.businessName" required>
                            </div>
                            
                            <div class="row mb-3">
                                <div class="col">
                                    <label class="form-label dark-text input-small-text">${msg("firstName")}</label>
                                    <input type="text" class="form-control input-field" name="firstName" required>
                                </div>
                                <div class="col">
                                    <label class="form-label dark-text input-small-text">${msg("lastName")}</label>
                                    <input type="text" class="form-control input-field" name="lastName" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("phoneNumber")}</label>
                                <div class="input-group">
                                    <span class="input-field custom-span">+234</span>
                                    <input type="text" class="form-control input-field ms-3" name="user.attributes.phoneNumber" required>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label dark-text input-small-text">${msg("email")}</label>
                                <input type="email" class="form-control input-field" name="email" required>
                            </div>
                            
                            <div class="mb-3">
                                <label class="form-label input-small-text dark-text">${msg("Business Type")}</label>
                                <select class="form-select select-field input-field" name="user.attributes.busninessType" required>
                                    <option selected>${msg("selectBusinessType")}</option>
                                    <option>${msg("Unregistered/Starter Business")}</option>
                                    <option>${msg("Business Name Registration")}</option>
                                    <option>${msg("Partnership")}</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label dark-text input-small-text">${msg("password")}</label>
                                <div class="input-group position-relative">
                                    <input type="password" class="form-control input-field" id="password" name="password" required>
                                    <span class="password-toggle" id="togglePassword">
                                        <i class="fa-regular fa-eye"></i>
                                    </span>
                                </div>
                            </div>
                            
                            <div class="mb-3">
                                <label for="confirmPassword" class="form-label dark-text input-small-text">${msg("Confirm Password")}</label>
                                <div class="input-group position-relative">
                                    <input type="password" class="form-control input-field" id="password-confirm" name="password-confirm" required>
                                    <span class="password-toggle" id="toggleConfirmPassword">
                                        <i class="fa-regular fa-eye"></i>
                                    </span>
                                </div>
                                <small id="passwordMatchError" class="text-danger" style="display: none;">Passwords do not match.</small>
                            </div>
                            
                            <div class="mb-3 mt-4">
                                <button type="submit" class="btn btn-primary w-100" id="registerButton">${msg("doRegisterSecurityKey")}</button>
                            </div>
                            
                            <div class="mt-3">
                                <p>By clicking the “Register” button, you agree to <a href="">BluePay’s privacy policy</a> and <a href="">terms of acceptable use and data processing.</a></p>
                                <hr />
                                <p class="text-center">${msg("Already have an account?")} <a href="${url.loginUrl}">${msg("login")}</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="${url.resourcesPath}/js/script.js"></script>
    </#if>
</@layout.registrationLayout>