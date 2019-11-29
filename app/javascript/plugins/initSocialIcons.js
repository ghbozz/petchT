const toggleSocial = (item) => {
  item.addEventListener('click', e => {
    document.querySelector(`.ssb-${Array.from(item.classList).pop()}`).click();
  })
}

const initSocialIcons = () => {
  const icons = document.querySelectorAll('.socials-btns i')
  icons.forEach((item) => {
    toggleSocial(item)
  })
}

export { initSocialIcons }
