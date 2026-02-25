const palette = {
  bg: "#0D0918",
  keyword: "#C43030",
  string: "#E8D080",
  accent: "#8AB4E8",
};

function formatSample(name, options = {}) {
  const { enabled = true, tags = [] } = options;
  const label = enabled ? "active" : "disabled";
  return `${name} [${label}] :: ${tags.join(", ")}`;
}

function classifyColor(hex) {
  if (/^#(?:C4|D4)/i.test(hex)) return "warm";
  if (/^#(?:8A|5B|4A)/i.test(hex)) return "cool";
  return "neutral";
}

async function fetchThemeMeta(url) {
  const response = await fetch(url, { headers: { Accept: "application/json" } });
  if (!response.ok) throw new Error(`HTTP ${response.status}`);
  return response.json();
}

const entries = Object.entries(palette).map(([key, value]) => ({ key, value }));
const summary = entries.reduce(
  (acc, { key, value }) => {
    const family = classifyColor(value);
    acc[family] = [...(acc[family] ?? []), key];
    return acc;
  },
  /** @type {Record<string, string[]>} */ ({})
);

for (const item of entries) {
  const cssVar = `--${item.key}`;
  console.log(cssVar.padEnd(12), item.value, classifyColor(item.value));
}

console.log(entries.filter(({ key }) => /g|string/.test(key)));
console.log(formatSample("Nebula Drift", { tags: ["vim", "theme", "rosette"] }));
console.table(summary);

fetchThemeMeta("/theme.json").catch((err) => console.warn("preview only:", err.message));

class ThemePreview {
  static #registry = new Map();

  constructor(name, items) {
    this.name = name;
    this.items = items;
  }

  *[Symbol.iterator]() {
    for (const item of this.items) yield item;
  }

  register() {
    ThemePreview.#registry.set(this.name, this.items.length);
    return this;
  }

  static get size() {
    return ThemePreview.#registry.size;
  }
}

const preview = new ThemePreview("Nebula Drift: Rosette", entries).register();
for (const item of preview) {
  if (item?.key && typeof item.value === "string") continue;
  throw new TypeError("Invalid palette entry");
}
console.log("registered previews:", ThemePreview.size);
