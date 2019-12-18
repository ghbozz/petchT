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
}

const bindBtns = () => {
  $('.brand-form-wrapper').on('cocoon:after-insert', function(e, insertedItem, originalEvent) {
      Array.from(insertedItem).forEach((item) => {
        console.log(item)
        item.querySelectorAll('.file-input').forEach(valueOnChange)
      })
  });
}

export { initFileInputs, bindBtns }
