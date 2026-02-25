#!/usr/bin/env bash
set -euo pipefail

theme_name="Nebula Drift: Rosette"
colors=(stellar_red solar_gold celestial_blue violet_flame stardust nebula_teal)
declare -A hex=(
  [stellar_red]="#C43030"
  [solar_gold]="#D4A020"
  [celestial_blue]="#8AB4E8"
  [violet_flame]="#A06DC8"
  [stardust]="#4A3A6A"
  [nebula_teal]="#4A9090"
)

print_color() {
  local name="$1"
  printf '%-16s %-8s %s\n' "$name" "${2:-enabled}" "${hex[$name]:-#000000}"
}

classify() {
  case "$1" in
    stellar_red|solar_gold) echo "warm" ;;
    celestial_blue|violet_flame|nebula_teal) echo "cool" ;;
    stardust) echo "muted" ;;
    *) echo "unknown" ;;
  esac
}

for color in "${colors[@]}"; do
  state="$(classify "$color")"
  print_color "$color" "$state"
done

warm_count=0
for color in "${colors[@]}"; do
  [[ "$(classify "$color")" == "warm" ]] && ((warm_count+=1))
done

if [[ -n "${1:-}" ]]; then
  echo "Preview file: $1"
fi

printf 'Warm tokens: %d/%d\n' "$warm_count" "${#colors[@]}"
echo "Loaded ${theme_name} at $(date +%H:%M:%S)"

readonly mode="${MODE:-preview}"
case "$mode" in
  preview) echo "Mode: preview" ;;
  export) printf '{"theme":"%s","count":%d}\n' "$theme_name" "${#colors[@]}" ;;
  debug) echo "Bash ${BASH_VERSION:-unknown}" ;;
  *) echo "Unknown MODE=$mode" >&2; exit 2 ;;
esac

mapfile -t cool_colors < <(
  for color in "${colors[@]}"; do
    [[ "$(classify "$color")" == "cool" ]] && printf '%s\n' "$color"
  done
)
printf 'Cool palette entries (%d): %s\n' "${#cool_colors[@]}" "${cool_colors[*]:-none}"
