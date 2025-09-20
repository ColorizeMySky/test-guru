document.addEventListener('DOMContentLoaded', function() {
  const timerElement = document.querySelector('#time-left')
  if (!timerElement) return

  let timeLeft = parseInt(timerElement.textContent, 10)

  const interval = setInterval(() => {
    timeLeft -= 1
    timerElement.textContent = timeLeft

    if (timeLeft <= 0) {
      clearInterval(interval)
      const form = document.querySelector('form')
      if (form) form.submit()
    }
  }, 1000)
})
