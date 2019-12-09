const initFilter = () => {
  const form = document.querySelector(".filter-form form");
  const btn = document.querySelector(".filter-form .filter-btn");

  form.addEventListener("change", e => {
    btn.click();
  });
};

export { initFilter };
