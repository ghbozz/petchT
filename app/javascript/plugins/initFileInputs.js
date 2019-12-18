const valueOnChange = (fileInput) => {
  fileInput.addEventListener('change', e => {
    let value = formatValue(e.target.value)
    if (fileInput.querySelector('.file-upload-value')) {
      fileInput.querySelector('.file-upload-value').innerText = value
    }
  })
}

const formatValue = (value) => {
  return value.split('\\')[value.split('\\').length - 1]
}

const initFileInputs = () => {
  const inputs = document.querySelectorAll('.file-input')
  inputs.forEach(valueOnChange)
  // inputs.forEach(loadValue)
}

export { initFileInputs }
