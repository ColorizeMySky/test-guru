document.addEventListener('turbolinks:load', () => {
  const progressBar = document.querySelector('.progress-bar')

  if (!progressBar) return

  const current = parseInt(progressBar.dataset.currentQuestion, 10)
  const total = parseInt(progressBar.dataset.totalQuestions, 10)
  const percent = total > 0 ? (current / total) * 100 : 0

  progressBar.style.width = `${percent}%`
  progressBar.setAttribute('aria-valuenow', current)
})
