const initFilter = () => {
  console.log('initFilter')
  const filter = document.querySelector('.filter');
  const btn = document.querySelector('#filter-toggle')
  btn.addEventListener('click', (e) => {
    filter.classList.toggle('filter-active')
    wrapperShrink();
  })
}

const initAnimals = () => {
  const btns = document.querySelectorAll('.animals-filter label')
  btns.forEach((btn) => {
    btn.addEventListener('click', toggleBtn)
  })
}

const initThemes = () => {
  const btns = document.querySelectorAll('.themes-filter label')
  btns.forEach((btn) => {
    btn.addEventListener('click', toggleBtn)
  })
}

const toggleBtn = (event) => {
  event.currentTarget.classList.toggle('label-active')
}

const wrapperShrink = () => {
  const wrapper = document.querySelector('.articles-wrapper')
  wrapper.classList.toggle('shrink')
}

window.addEventListener('DOMContentLoaded', (e) => {
  if (document.querySelector('.filter')) {
    initFilter();
    initAnimals();
    initThemes();
  }
})
