const countdownDuration = 120;
let timeLeft = countdownDuration;

const countdownEl = document.getElementById("countdown");
const resendLinkEl = document.getElementById("resend-link");

// Format time as MM:SS
function formatTime(seconds) {
  const mins = Math.floor(seconds / 60);
  const secs = seconds % 60;
  return `${mins}:${secs < 10 ? "0" : ""}${secs}`;
}

// Initialize countdown display
countdownEl.textContent = formatTime(timeLeft);

// Start countdown interval
const timerId = setInterval(() => {
  timeLeft--;
  if (timeLeft <= 0) {
    clearInterval(timerId);
    countdownEl.style.display = "none";
    resendLinkEl.style.display = "inline";
  } else {
    countdownEl.textContent = formatTime(timeLeft);
  }
}, 1000);
