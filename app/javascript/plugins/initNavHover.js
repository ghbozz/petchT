export const initNavHover = () => {
  const desktopLinks = document.querySelectorAll('.nav-link-desktop-menu');
  const desktopSubmenus = document.querySelectorAll('.nav-submenu');

  desktopLinks.forEach((link) => {
    link.addEventListener('mouseenter', (e) => {
      desktopSubmenus.forEach((menu) => {
        menu.classList.add('hidden');
      });

      document.getElementById(`nav-submenu-${e.target.id.replace('nav-link-', '')}`).classList.remove('hidden');
    });
  });

  desktopSubmenus.forEach((menu) => {
    menu.addEventListener('mouseleave', (e) => {
      e.target.classList.add('hidden');
    });
  })
};
