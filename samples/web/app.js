const palette = [
  ["keyword", "#C43030"],
  ["string", "#E8D080"],
  ["function", "#8AB4E8"],
  ["comment", "#4A3A6A"],
  ["warning", "#C86020"],
  ["type", "#5B8FD4"],
];

const list = document.querySelector("#palette-list");
const button = document.querySelector("#toggle-btn");
const search = document.querySelector("#filter");

function familyOf(name) {
  if (/keyword|warning/.test(name)) return "warm";
  if (/function|type/.test(name)) return "cool";
  return "muted";
}

function render(items) {
  if (!list) return;
  list.innerHTML = "";
  for (const [name, hex] of items) {
    const li = document.createElement("li");
    li.innerHTML = `
      <span class="swatch" style="background:${hex}"></span>
      <code>${name}</code>
      <span>${hex}</span>
      <em>${familyOf(name)}</em>
    `;
    list.append(li);
  }
}

render(palette);

search?.addEventListener("input", (event) => {
  const q = event.target.value.trim().toLowerCase();
  render(palette.filter(([name, hex]) => `${name} ${hex}`.toLowerCase().includes(q)));
});

button?.addEventListener("click", () => {
  document.body.classList.toggle("glow");
});

window.addEventListener("keydown", (event) => {
  if (event.key === "/") {
    event.preventDefault();
    search?.focus();
  } else if (event.key === "Escape" && search) {
    search.value = "";
    render(palette);
    search.blur();
  }
});

Promise.resolve(palette)
  .then((items) => items.map(([name, hex]) => ({ name, hex, family: familyOf(name) })))
  .then((items) => console.debug("palette items", items))
  .catch((error) => console.error("preview error", error));
