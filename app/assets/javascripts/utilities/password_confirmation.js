const updatePasswordConfirmationIcon = () => {
  const passwordInput = document.querySelector('#password-input')
  const confirmationInput = document.querySelector('#password-confirmation-input')

  if (!passwordInput || !confirmationInput) return

  const icon = document.querySelector('#password-match-icon')
  if (!icon) return

  const icons = icon.children

  const updateIcon = () => {
    const password = passwordInput.value
    const confirmation = confirmationInput.value
const updatePasswordConfirmationIcon = () => {
  const passwordInput = document.querySelector('#password-input')
  const confirmationInput = document.querySelector('#password-confirmation-input')

  if (!passwordInput || !confirmationInput) return

  const icon = document.querySelector('#password-match-icon')
  if (!icon) return

  const icons = icon.children

  const updateIcon = () => {
    const password = passwordInput.value
    const confirmation = confirmationInput.value

    if (!confirmation) {
      icon.classList.add('d-none')
      return
    }
    icon.classList.remove('d-none')

    if (password === confirmation) {
      icons[0].classList.remove('d-none')
      icons[1].classList.add('d-none')
    } else {
      icons[0].classList.add('d-none')
      icons[1].classList.remove('d-none')
    }
  }

  confirmationInput.addEventListener('input', updateIcon)
  passwordInput.addEventListener('input', updateIcon)
}

document.addEventListener('turbolinks:load', updatePasswordConfirmationIcon)

    if (!confirmation) {
      icon.classList.add('d-none')
      return
    }
    icon.classList.remove('d-none')

    if (password === confirmation) {
      icons[0].classList.remove('d-none')
      icons[1].classList.add('d-none')
    } else {
      icons[0].classList.add('d-none')
      icons[1].classList.remove('d-none')
    }
  }

  confirmationInput.addEventListener('input', updateIcon)
  passwordInput.addEventListener('input', updateIcon)
}

document.addEventListener('turbolinks:load', updatePasswordConfirmationIcon)
