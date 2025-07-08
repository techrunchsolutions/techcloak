document.addEventListener("DOMContentLoaded", function () {
  const backButton = document.getElementById("back-button");
  if (backButton) {
    backButton.addEventListener("click", function () {
      window.history.back();
    });
  }

  const form = document.getElementById("kc-reset-password-form");
  const container = document.getElementById("reset-password-container");
  const emailInput = document.getElementById("username");
  const resetButton = document.getElementById("reset-button");

  if (emailInput && resetButton) {
    function isValidEmail(email) {
      const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
      return emailRegex.test(email);
    }

    function updateButtonStyle() {
      if (isValidEmail(emailInput.value)) {
        resetButton.classList.add("btn-active");
      } else {
        resetButton.classList.remove("btn-active");
      }
    }

    emailInput.addEventListener("input", updateButtonStyle);
    emailInput.addEventListener("change", updateButtonStyle);
    emailInput.addEventListener("blur", updateButtonStyle);
  }

  if (form) {
    form.addEventListener("submit", async function (e) {
      e.preventDefault();

      if (!form.checkValidity()) {
        e.stopPropagation();
        form.classList.add("was-validated");
        return;
      }

      const submitButton = form.querySelector('button[type="submit"]');
      const originalText = submitButton.innerHTML;
      submitButton.disabled = true;
      submitButton.innerHTML =
        '<span class="spinner-border spinner-border-sm me-2"></span> Sending...';

      try {
        const formData = new FormData(form);
        const response = await fetch(form.action, {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: new URLSearchParams(formData),
        });

        if (response.ok) {
          container.innerHTML = `
                        <div class="text-center mb-4">
                            <img src="${form.dataset.emailIconPath}" alt="Email Sent" width="80" class="mb-3"/>
                            <h1 class="text-secondary fw-bold mb-3">Check Your Email</h1>
                            <p class="text-body mb-4">
                                We've sent a password reset link to<br/>
                                <strong>${emailInput.value}</strong>
                            </p>
                            <div class="resend-container">
                                <span class="resend-text">Didn't get email? </span>
                                <button id="resend-button" class="btn-resend-link" disabled>
                                    Resend link in <span id="countdown" class="countdown-timer">2:00</span>
                                </button>
                            </div>
                        </div>
                        <div class="text-center mt-4">
                            <a href="${form.dataset.loginUrl}" class="btn btn-info btn-active w-100 py-3 fw-bold">Back to Login</a>
                        </div>
                    `;

          // Initialize resend functionality
          const resendButton = document.getElementById("resend-button");
          const countdownElement = document.getElementById("countdown");

          if (resendButton && countdownElement) {
            let timeLeft = 120;
            let countdownInterval = setInterval(() => {
              timeLeft--;
              const minutes = Math.floor(timeLeft / 60);
              const seconds = timeLeft % 60;
              countdownElement.textContent = `${minutes}:${seconds
                .toString()
                .padStart(2, "0")}`;

              if (timeLeft <= 0) {
                clearInterval(countdownInterval);
                resendButton.innerHTML = "Resend link";
                resendButton.disabled = false;
                countdownElement.remove();
              }
            }, 1000);

            resendButton.addEventListener("click", async function (e) {
              e.preventDefault();

              if (!resendButton.disabled) {
                resendButton.disabled = true;
                const originalText = resendButton.innerHTML;
                resendButton.innerHTML =
                  '<span class="spinner-border spinner-border-sm me-2"></span> Sending...';

                setTimeout(async () => {
                  try {
                    await fetch(form.action, {
                      method: "POST",
                      headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                      },
                      body: new URLSearchParams(new FormData(form)),
                    });

                    // Reset countdown
                    timeLeft = 120;
                    resendButton.innerHTML =
                      'Resend link in <span id="countdown" class="countdown-timer">2:00</span>';
                    const newCountdown = document.getElementById("countdown");
                    resendButton.disabled = true;

                    countdownInterval = setInterval(() => {
                      timeLeft--;
                      const minutes = Math.floor(timeLeft / 60);
                      const seconds = timeLeft % 60;
                      newCountdown.textContent = `${minutes}:${seconds
                        .toString()
                        .padStart(2, "0")}`;

                      if (timeLeft <= 0) {
                        clearInterval(countdownInterval);
                        resendButton.innerHTML = "Resend link";
                        resendButton.disabled = false;
                        newCountdown.remove();
                      }
                    }, 1000);
                  } finally {
                    // Handled in the countdown logic
                  }
                }, 3000);
              }
            });
          }
        }
      } finally {
        submitButton.innerHTML = originalText;
        submitButton.disabled = false;
      }
    });
  }
});
