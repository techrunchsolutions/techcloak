<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
    <#if section = "header">
        <#-- Header intentionally left blank to hide default Keycloak header -->
    <#elseif section = "form">
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Password Updated - BluePay</title>
            
            <!-- Bootstrap CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" rel="stylesheet">
            <link rel="stylesheet" href="${url.resourcesPath}/css/info.css">
        </head>
        <body class="bg-primary text-white">
            <div class="py-4">
                <!-- BluePay Logo -->
                <div class="row">
                    <div class="col-12 ps-md-5 ps-3">
                        <img src="${url.resourcesPath}/img/logo.svg" alt="BluePay Logo" class="img-fluid" style="max-width: 168px"/>
                    </div>
                </div>

                <div class="row justify-content-center mt-4 mt-md-5">
                    <div class="col-12 col-md-10 col-lg-8 col-xl-6">
                        <!-- Success Card -->
                        <div class="card success-card bg-white">
                            <div class="card-body p-4 p-lg-5 text-center">
                                <!-- Success Icon -->
                                <div class="mb-4">
                                    <i class="bi bi-check-circle-fill success-icon"></i>
                                </div>
                                
                                <!-- Message -->
                                <h2 class="text-secondary fw-bold mb-3">
                                    Password Updated Successfully
                                </h2>
                                
                                <p class="text-body mb-4">${message.summary}</p>
                                
                                <!-- Action Button -->
                                <a href="
    <#if referrer?? && referrer.url??>
        ${referrer.url}
    <#elseif client?? && client.baseUrl??>
        ${client.baseUrl}
    <#else>
        ${url.loginUrl}
    </#if>
" class="btn app-btn px-4 py-2">
                                Back to Application
                                </a>
                            </div>
                        </div>

                        <!-- Footer -->
                        <div class="text-center text-white mt-3">
                            <p class="mb-1 fw-medium" style="font-size: 1.125rem">
                                BluePay Payment Gateway
                            </p>
                            <p class="mb-0" style="font-size: 1rem">
                                Licensed by the Central Bank of Nigeria (CBN)
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </body>
        </html>
    </#if>
</@layout.registrationLayout>