
        // Password strength checker
        function checkPasswordStrength(password) {
            const requirements = {
                length: password.length >= 8,
                uppercase: /[A-Z]/.test(password),
                lowercase: /[a-z]/.test(password),
                number: /\d/.test(password)
            };

            // Update requirement indicators
            Object.keys(requirements).forEach(req => {
                const element = document.getElementById('req-' + req);
                const icon = element.querySelector('.requirement-icon');

                if (requirements[req]) {
                    element.classList.add('met');
                    icon.textContent = '✓';
                } else {
                    element.classList.remove('met');
                    icon.textContent = '○';
                }
            });

            // Calculate strength
            const metRequirements = Object.values(requirements).filter(Boolean).length;
            const strengthFill = document.getElementById('strength-fill');

            strengthFill.className = 'strength-fill';

            if (metRequirements === 0) {
                strengthFill.classList.add('strength-weak');
            } else if (metRequirements <= 2) {
                strengthFill.classList.add('strength-weak');
            } else if (metRequirements === 3) {
                strengthFill.classList.add('strength-fair');
            } else if (metRequirements === 4 && password.length >= 12) {
                strengthFill.classList.add('strength-strong');
            } else {
                strengthFill.classList.add('strength-good');
            }

            return metRequirements === 4;
        }

        // Real-time password validation
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const confirmPasswordInput = document.getElementById('password-confirm');

            if (passwordInput) {
                passwordInput.addEventListener('input', function(e) {
                    checkPasswordStrength(e.target.value);
                    validatePasswordMatch();
                });
            }

            if (confirmPasswordInput) {
                confirmPasswordInput.addEventListener('input', validatePasswordMatch);
            }

            function validatePasswordMatch() {
                if (!passwordInput || !confirmPasswordInput) return;

                const password = passwordInput.value;
                const confirmPassword = confirmPasswordInput.value;

                if (confirmPassword && password !== confirmPassword) {
                    confirmPasswordInput.classList.add('is-invalid');
                } else {
                    confirmPasswordInput.classList.remove('is-invalid');
                }
            }
        });