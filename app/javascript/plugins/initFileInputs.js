const valueOnChange = (fileInput) => {
  fileInput.addEventListener('change', e => {
    let value = formatValue(e.target.value)
    if (fileInput.querySelector('.file-upload-value')) {
      fileInput.querySelector('.file-upload-value').innerText = value
    }
  })
}

const formatValue = (value) => {
  return value.split('\\')[value.split('\\').length - 1].split('').slice(0, 20).join('') + '...'
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

  $(".brand-form-wrapper").on('click',"a.remove_fields",function(){
    return confirm("Do you want to delete this?") ;
  });
}

export { initFileInputs, bindBtns }
