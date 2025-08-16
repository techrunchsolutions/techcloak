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
