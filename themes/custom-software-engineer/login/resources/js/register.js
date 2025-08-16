function togglePasswordVisibility(fieldId) {
                var passwordField = document.getElementById(fieldId);
                var eyeOpen = document.getElementById(fieldId + '-eye-open');
                var eyeClosed = document.getElementById(fieldId + '-eye-closed');

                if (passwordField.type === 'password') {
                    passwordField.type = 'text';
                    eyeOpen.classList.add('hidden');
                    eyeClosed.classList.remove('hidden');
                } else {
                    passwordField.type = 'password';
                    eyeOpen.classList.remove('hidden');
                    eyeClosed.classList.add('hidden');
                }
            }

            function validatePassword(password) {
                var lengthRequirement = password.length >= 8;
                var mixRequirement = /^(?=.*[a-zA-Z])(?=.*\d)/.test(password);

                return {
                    length: lengthRequirement,
                    mix: mixRequirement,
                    valid: lengthRequirement && mixRequirement
                };
            }

            function updatePasswordRequirements(validation) {
                var lengthItem = document.getElementById('password-length');
                var mixItem = document.getElementById('password-mix');

                if (validation.length) {
                    lengthItem.className = 'requirement-item requirement-met';
                    lengthItem.querySelector('.requirement-icon').textContent = '✓';
                } else {
                    lengthItem.className = 'requirement-item requirement-failed';
                    lengthItem.querySelector('.requirement-icon').textContent = '○';
                }

                if (validation.mix) {
                    mixItem.className = 'requirement-item requirement-met';
                    mixItem.querySelector('.requirement-icon').textContent = '✓';
                } else {
                    mixItem.className = 'requirement-item requirement-failed';
                    mixItem.querySelector('.requirement-icon').textContent = '○';
                }
            }

            function validatePasswordMatch() {
                var password = document.getElementById('password').value;
                var confirmPassword = document.getElementById('password-confirm').value;
                var matchMessage = document.getElementById('password-match-message');
                var matchSuccess = document.getElementById('password-match-success');
                var confirmField = document.getElementById('password-confirm');

                if (confirmPassword === '') {
                    matchMessage.classList.add('hidden');
                    matchSuccess.classList.add('hidden');
                    confirmField.classList.remove('input-error', 'input-success');
                    return null;
                }

                if (password === confirmPassword) {
                    matchMessage.classList.add('hidden');
                    matchSuccess.classList.remove('hidden');
                    confirmField.classList.remove('input-error');
                    confirmField.classList.add('input-success');
                    return true;
                } else {
                    matchMessage.classList.remove('hidden');
                    matchSuccess.classList.add('hidden');
                    confirmField.classList.remove('input-success');
                    confirmField.classList.add('input-error');
                    return false;
                }
            }

            function validateForm() {
                var firstName = document.getElementById('firstName').value.trim();
                var lastName = document.getElementById('lastName').value.trim();
                var email = document.getElementById('email').value.trim();
                var usernameField = document.getElementById('username');
                var username = usernameField ? usernameField.value.trim() : 'valid';
                var password = document.getElementById('password').value;
                var confirmPassword = document.getElementById('password-confirm').value;

                var passwordValidation = validatePassword(password);
                var passwordsMatch = validatePasswordMatch();

                var allFieldsFilled = firstName && lastName && email && username && password && confirmPassword;
                var allRequirementsMet = passwordValidation.valid && passwordsMatch === true;

                var registerButton = document.getElementById('register-button');
                registerButton.disabled = !(allFieldsFilled && allRequirementsMet);
            }

            document.addEventListener('DOMContentLoaded', function() {
                var passwordField = document.getElementById('password');
                var confirmPasswordField = document.getElementById('password-confirm');
                var allInputs = document.querySelectorAll('input[required]');

                passwordField.addEventListener('input', function() {
                    var validation = validatePassword(this.value);
                    updatePasswordRequirements(validation);

                    if (this.value === '') {
                        this.classList.remove('input-error', 'input-success');
                    } else if (validation.valid) {
                        this.classList.remove('input-error');
                        this.classList.add('input-success');
                    } else {
                        this.classList.remove('input-success');
                        this.classList.add('input-error');
                    }

                    validateForm();
                });

                confirmPasswordField.addEventListener('input', function() {
                    validatePasswordMatch();
                    validateForm();
                });

                for (var i = 0; i < allInputs.length; i++) {
                    allInputs[i].addEventListener('input', validateForm);
                }

                validateForm();
            });
