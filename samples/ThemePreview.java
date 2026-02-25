import java.time.LocalDate;
import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

record PaletteEntry(String name, String hex, boolean enabled) {}

public class ThemePreview {
    private static String familyOf(PaletteEntry entry) {
        return switch (entry.name()) {
            case "stellar_red", "solar_gold" -> "warm";
            case "celestial_blue", "violet_flame" -> "cool";
            default -> "neutral";
        };
    }

    private static void printRows(List<PaletteEntry> entries) {
        entries.stream()
            .sorted(Comparator.comparing(PaletteEntry::name))
            .forEach(e -> System.out.printf("%-16s %-8s %s%n", e.name(), familyOf(e), e.hex()));
    }

    public static void main(String[] args) {
        List<PaletteEntry> entries = List.of(
            new PaletteEntry("stellar_red", "#C43030", true),
            new PaletteEntry("stardust", "#4A3A6A", false),
            new PaletteEntry("celestial_blue", "#8AB4E8", true),
            new PaletteEntry("violet_flame", "#A06DC8", true)
        );

        Map<Boolean, List<PaletteEntry>> grouped = entries.stream()
            .collect(Collectors.groupingBy(PaletteEntry::enabled));

        String summary = switch (LocalDate.now().getMonthValue()) {
            case 12, 1, 2 -> "winter sky";
            default -> "clear night";
        };

        System.out.println(summary + " => " + grouped);
        printRows(entries);

        long enabled = entries.stream().filter(PaletteEntry::enabled).count();
        System.out.printf("Enabled: %d/%d%n", enabled, entries.size());

        for (PaletteEntry entry : entries) {
            if (!entry.enabled()) {
                continue;
            }
            switch (familyOf(entry)) {
                case "warm" -> System.out.println("Warm accent => " + entry.name());
                case "cool" -> System.out.println("Cool accent => " + entry.name());
                default -> System.out.println("Neutral accent => " + entry.name());
            }
        }

        try {
            String joined = entries.stream()
                .map(PaletteEntry::name)
                .collect(Collectors.joining(", "));
            if (joined.isBlank()) {
                throw new IllegalStateException("No entries configured");
            }
            System.out.println("Tokens: " + joined);
        } catch (RuntimeException ex) {
            System.err.println(ex.getMessage());
        }
    }
}
