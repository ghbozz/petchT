export const initSticky = () => {
  const bodyHeight = document.body.offsetHeight;
  const recoHeight = document.querySelector(".recomandations").offsetHeight;
  const sticky = document.querySelector(".card-specs-ratings");

  window.addEventListener("scroll", e => {
    const position = e.target.scrollingElement.scrollTop;
    const visible = bodyHeight - (position + recoHeight + window.innerHeight);

    if (visible <= 0) {
      sticky.classList.remove("sticky");
      sticky.classList.add("not-sticky");
    } else {
      sticky.classList.remove("not-sticky");
      sticky.classList.add("sticky");
    }
  });
};
