const initFilter = () => {
  console.log('initFilter')
  const filter = document.querySelector('.filter');
  const btn = document.querySelector('#filter-toggle')
  btn.addEventListener('click', (e) => {
    filter.classList.toggle('filter-active')
  })
}

window.addEventListener('DOMContentLoaded', (e) => {
  if (document.querySelector('.filter')) initFilter();
})
