const initFormValidation = () => {
  const inputs = document.querySelectorAll('.check')
  inputs.forEach(validates)
  formCheck();
}

const validates = (input) => {
  input.addEventListener('change', e => {
    formCheck();
  })
}

const formCheck = (e) => {
  const inputs = document.querySelectorAll('.check')
  const emptys = Array.from(inputs).filter(input => input.value === '')

  if (emptys.length === 0) {
    document.querySelector('#fake-submit').disabled = false
    showHints(inputs)
  } else {
    document.querySelector('#fake-submit').disabled = true
    showHints(inputs)
  }
}

const showHints = (inputs) => {
  inputs.forEach((input) => {
    if (input.value === '') {
      input.classList.add('required-input')
      console.log('nop')
    } else {
      input.classList.remove('required-input')
    }
  })
}

export { initFormValidation }
