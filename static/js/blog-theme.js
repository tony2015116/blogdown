(() => {
  const root = document.documentElement;
  const preference = window.matchMedia("(prefers-color-scheme: dark)");
  const key = "mguo-blog-theme";
  let choice;
  try {
    choice = localStorage.getItem(key);
  } catch {
    // The system preference still works when storage is unavailable.
  }

  function apply(button) {
    const dark = choice === "dark" || (choice !== "light" && preference.matches);
    root.dataset.blogTheme = dark ? "dark" : "light";
    button?.setAttribute("aria-pressed", String(dark));
  }

  apply();
  document.addEventListener("DOMContentLoaded", () => {
    const button = document.querySelector(".blog-theme");
    if (!button) return;
    apply(button);
    button.hidden = false;
    preference.addEventListener("change", () => apply(button));
    button.addEventListener("click", () => {
      choice = root.dataset.blogTheme === "dark" ? "light" : "dark";
      try {
        localStorage.setItem(key, choice);
      } catch {
        // Apply the setting for this page even without persistent storage.
      }
      apply(button);
    });
  });
})();
