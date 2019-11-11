import { initStarRating } from "../plugins/init_star_rating";

const cardForm = () => {
  const select = document.querySelector("#card_animal");
  select &&
    select.addEventListener("change", e => {
      displayInputs(e);
    });
};

const displayInputs = event => {
  document.querySelectorAll(".inputs").forEach(item => {
    resetInputs();
    item.classList.add("d-none");
    document
      .querySelector(`.${event.target.value}-inputs`)
      .classList.remove("d-none");
  });
};

const resetInputs = () => {
  document.querySelectorAll(".specs select").forEach(select => {
    select.selectedIndex = null;
  });
  document.querySelectorAll("input").forEach(input => {
    input.value = "";
  });
  document.querySelectorAll(".br-selected").forEach(item => {
    item.classList.remove("br-selected");
  });
};

export { cardForm };
