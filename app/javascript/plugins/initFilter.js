// const initFilter = () => {
//   const filter = document.querySelector(".filter");
//   const btn = document.querySelector("#filter-toggle");
//   btn.addEventListener("click", e => {
//     filter.classList.toggle("filter-active");
//     wrapperShrink();
//   });
// };

const initAnimals = () => {
  const btns = document.querySelectorAll(".animals-filter label");
  btns.forEach(btn => {
    btn.addEventListener("click", e => {
      toggleBtn(e);
      cleanSearch();
    });
  });
};

const initThemes = () => {
  const btns = document.querySelectorAll(".themes-filter label");
  btns.forEach(btn => {
    btn.addEventListener("click", toggleBtn);
  });
};

const toggleBtn = event => {
  event.currentTarget.classList.toggle("label-active");
  autoSubmit();
};

const wrapperShrink = () => {
  const wrapper = document.querySelector(".articles-wrapper");
  wrapper.classList.toggle("shrink");
};

const resetFilter = () => {
  const checked = document.querySelectorAll("input:checked");
  checked.forEach(check => {
    check.checked = false;
  });
  cleanFilter();
};

const cleanFilter = () => {
  document.querySelectorAll(".label-active").forEach(item => {
    item.classList.remove("label-active");
  });
};

const cleanSearch = () => {
  document.querySelector("#search-form").reset();
};

const initSearch = () => {
  document.querySelector("#search-form").addEventListener("change", e => {
    resetFilter();
  });
};

const initTagFilter = () => {
  document.querySelectorAll(".tag-filter .form-check-label").forEach(tag => {
    bindTag(tag);
  });
};

const bindTag = tag => {
  tag.addEventListener("click", toggleTag);
};

const toggleTag = event => {
  const allTags = document.querySelectorAll(".tag-filter .form-check-label");

  if (
    Object.values(event.currentTarget.classList).filter(c => c === "tag-active")
      .length === 0
  ) {
    allTags.forEach(tag => {
      tag.classList.remove("tag-active");
    });
    event.currentTarget.classList.add("tag-active");
  } else {
    event.currentTarget.classList.toggle("tag-active");
  }
  resetFilter();
  autoSubmit();
};

const autoSubmit = () => {
  setTimeout(() => {
    document.querySelector(".filter-btn").click();
  }, 25);
};

window.addEventListener("DOMContentLoaded", e => {
  if (document.querySelector(".filter")) {
    // initFilter();
    initAnimals();
    initThemes();
    initSearch();
    initTagFilter();
  }
});
