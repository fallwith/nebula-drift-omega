#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAX_COLORS 8

typedef struct {
    const char *name;
    const char *hex;
    int enabled;
} ColorEntry;

static void print_entry(const ColorEntry *entry) {
    printf("%-16s %s %s\n",
           entry->name,
           entry->hex,
           entry->enabled ? "[on]" : "[off]");
}

int main(void) {
    ColorEntry colors[MAX_COLORS] = {
        {"stellar_red", "#C43030", 1},
        {"solar_gold", "#D4A020", 1},
        {"stardust", "#4A3A6A", 0},
    };

    size_t count = 3U;
    for (size_t i = 0; i < count; ++i) {
        print_entry(&colors[i]);
    }

    size_t enabled = 0U;
    for (size_t i = 0; i < count; ++i) {
        switch (colors[i].enabled) {
            case 0:
                continue;
            case 1:
                enabled++;
                break;
            default:
                fprintf(stderr, "invalid enabled state for %s\n", colors[i].name);
                return EXIT_FAILURE;
        }
    }

    const char *label = (enabled == count) ? "all-on" : (enabled == 0U ? "all-off" : "mixed");
    printf("summary: %zu/%zu enabled (%s)\n", enabled, count, label);

    if (strstr(colors[0].hex, "#") != colors[0].hex) {
        return EXIT_FAILURE;
    }

    return EXIT_SUCCESS;
}
