<?php
declare(strict_types=1);

enum Visibility: string {
    case Public = 'public';
    case Private = 'private';
}

final class PaletteEntry
{
    public function __construct(
        public readonly string $name,
        public readonly string $hex,
        public readonly Visibility $visibility = Visibility::Public,
    ) {}
}

function render_entry(PaletteEntry $entry): string
{
    $label = strtoupper($entry->name);
    return sprintf("%s => %s (%s)\n", $label, $entry->hex, $entry->visibility->value);
}

$entries = [
    new PaletteEntry('stellar_red', '#C43030'),
    new PaletteEntry('celestial_blue', '#8AB4E8'),
];

foreach ($entries as $entry) {
    echo render_entry($entry);
}

$hexMap = array_reduce(
    $entries,
    function (array $carry, PaletteEntry $entry): array {
        $carry[$entry->name] = $entry->hex;
        return $carry;
    },
    []
);

foreach ($hexMap as $name => $hex) {
    if (str_starts_with($name, 'stellar')) {
        echo "warm:";
    } elseif (str_contains($name, 'blue')) {
        echo " cool:";
    } else {
        echo " neutral:";
    }
    echo " {$name}={$hex}\n";
}

try {
    $json = json_encode($hexMap, JSON_THROW_ON_ERROR | JSON_PRETTY_PRINT);
    echo $json . PHP_EOL;
} catch (JsonException $e) {
    fwrite(STDERR, $e->getMessage() . PHP_EOL);
}
