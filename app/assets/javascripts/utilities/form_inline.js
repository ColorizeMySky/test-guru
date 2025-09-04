document.addEventListener('turbolinks:load', () => {
  const controls = document.querySelectorAll('.form-inline-link')

  controls.forEach(control => control.addEventListener('click', formInlineLinkHandler))

  const errors = document.querySelector('.resource-errors')
  errors?.dataset?.resourceId && formInlineHandler(errors.dataset.resourceId)
})

const formInlineLinkHandler = (event) => {
  event.preventDefault()

  const testId = event.currentTarget.dataset.testId
  formInlineHandler(testId)
}

const formInlineHandler = (testId) => {
  const link = document.querySelector(`.form-inline-link[data-test-id="${testId}"]`)
  const testTitle = document.querySelector(`.test-title[data-test-id="${testId}"]`)
  const formInline = document.querySelector(`.form-inline[data-test-id="${testId}"]`)

  if (formInline.classList.contains('d-none')) {
    testTitle.classList.add('d-none')
    formInline.classList.remove('d-none')
    link.textContent = 'Отмена'
  } else {
    testTitle.classList.remove('d-none')
    formInline.classList.add('d-none')
    link.textContent = 'Редактировать'
  }
}
