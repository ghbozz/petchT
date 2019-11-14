const initNewCardForm = () => {
  const form = document.querySelector('#init_card')
  const labels = form.querySelectorAll('label')
  console.log(labels)
  labels.forEach(bindBtn)
}

const bindBtn = (btn) => {
  btn.addEventListener('click', toggleActive)
}

const toggleActive = (event) => {
  removeActive();
  event.currentTarget.classList.toggle('label-active')
}

const removeActive = () => {
  const form = document.querySelector('#init_card')
  const labels = form.querySelectorAll('label')

  labels.forEach((label) => {
    label.classList.remove('label-active')
  })
}

export { initNewCardForm }
