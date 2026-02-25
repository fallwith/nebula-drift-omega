from __future__ import annotations

from dataclasses import dataclass
from pathlib import Path
from typing import Iterable


DEFAULT_TIMEOUT = 2.5


@dataclass(slots=True)
class StarSample:
    name: str
    magnitude: float
    tags: list[str]

    def is_visible(self, threshold: float = 5.0) -> bool:
        return self.magnitude <= threshold


def load_lines(path: Path) -> Iterable[str]:
    with path.open("r", encoding="utf-8") as handle:
        for line in handle:
            stripped = line.strip()
            if stripped and not stripped.startswith("#"):
                yield stripped


async def render_preview(items: list[StarSample]) -> dict[str, int]:
    visible = [item for item in items if item.is_visible()]
    return {item.name: len(item.tags) for item in visible}


if __name__ == "__main__":
    sample = StarSample("Rosette", 4.8, ["nebula", "cluster", "h-alpha"])
    print(f"{sample.name}: visible={sample.is_visible()} timeout={DEFAULT_TIMEOUT}s")

    samples = [
        sample,
        StarSample("NGC 2244", 5.4, ["open-cluster"]),
        StarSample("Monoceros", 4.2, ["constellation", "guide-star"]),
    ]

    stats = {"visible": 0, "hidden": 0}
    for item in samples:
        if item.is_visible():
            stats["visible"] += 1
        elif item.magnitude > 6.0:
            continue
        else:
            stats["hidden"] += 1

    match stats:
        case {"visible": v, "hidden": h} if v > h:
            status = "bright"
        case {"visible": 0, "hidden": _}:
            status = "dark"
        case _:
            status = "mixed"

    try:
        names = [name.upper() for name in render_preview.__name__.split("_")]
        assert all(names), "empty token in function name"
    except AssertionError as exc:
        print(f"warning: {exc!s}")
    finally:
        print("mode:", status, "stats:", stats)
