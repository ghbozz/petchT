export const initNavHover = () => {
  const dogButtonCard = document.querySelector(".dog-submenu-card");
  const catButtonCard = document.querySelector(".cat-submenu-card");
  const rodentButtonCard = document.querySelector(".rodent-submenu-card");

  const dogButtonArticle = document.querySelector(".dog-submenu-article");
  const catButtonArticle = document.querySelector(".cat-submenu-article");
  const rodentButtonArticle = document.querySelector(".rodent-submenu-article");

  const allCards = document.querySelectorAll(".submenu-recos-cards");
  const allArticles = document.querySelectorAll(".submenu-recos-articles");

  const dogContentCard = document.querySelector(".submenu-reco-dog-card");
  const catContentCard = document.querySelector(".submenu-reco-cat-card");
  const rodentContentCard = document.querySelector(".submenu-reco-rodent-card");
  const dogContentArticle = document.querySelector(".submenu-reco-dog-article");
  const catContentArticle = document.querySelector(".submenu-reco-cat-article");
  const rodentContentArticle = document.querySelector(
    ".submenu-reco-rodent-article"
  );

  dogButtonCard.addEventListener("mouseenter", () => {
    allCards.forEach(node => {
      node.classList.add("hidden");
    });

    dogContentCard.classList.remove("hidden");
  });
  catButtonCard.addEventListener("mouseenter", () => {
    allCards.forEach(node => {
      node.classList.add("hidden");
    });

    catContentCard.classList.remove("hidden");
  });
  rodentButtonCard.addEventListener("mouseenter", () => {
    allCards.forEach(node => {
      node.classList.add("hidden");
    });

    rodentContentCard.classList.remove("hidden");
  });

  dogButtonArticle.addEventListener("mouseenter", () => {
    allArticles.forEach(node => {
      node.classList.add("hidden");
    });

    dogContentArticle.classList.remove("hidden");
  });
  catButtonArticle.addEventListener("mouseenter", () => {
    allArticles.forEach(node => {
      node.classList.add("hidden");
    });

    catContentArticle.classList.remove("hidden");
  });
  rodentButtonArticle.addEventListener("mouseenter", () => {
    allArticles.forEach(node => {
      node.classList.add("hidden");
    });

    rodentContentArticle.classList.remove("hidden");
  });
};
