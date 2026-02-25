use std::collections::HashMap;

#[derive(Debug, Clone)]
struct PaletteEntry {
    name: String,
    hex: String,
    enabled: bool,
}

fn collect_enabled(entries: &[PaletteEntry]) -> HashMap<String, String> {
    entries
        .iter()
        .filter(|e| e.enabled)
        .map(|e| (e.name.clone(), e.hex.clone()))
        .collect()
}

fn main() {
    let entries = vec![
        PaletteEntry { name: "stellar_red".into(), hex: "#C43030".into(), enabled: true },
        PaletteEntry { name: "stardust".into(), hex: "#4A3A6A".into(), enabled: false },
        PaletteEntry { name: "celestial_blue".into(), hex: "#8AB4E8".into(), enabled: true },
    ];

    let enabled = collect_enabled(&entries);
    match enabled.get("stellar_red") {
        Some(hex) => println!("stellar_red = {hex}"),
        None => eprintln!("missing palette entry"),
    }

    for entry in &entries {
        let family = match entry.name.as_str() {
            "stellar_red" => "warm",
            "celestial_blue" => "cool",
            _ if entry.enabled => "neutral",
            _ => "disabled",
        };
        println!("{:<16} {:<8} {}", entry.name, family, entry.hex);
    }

    let visible_count = entries.iter().filter(|e| e.enabled).count();
    if visible_count == 0 {
        eprintln!("no visible entries");
    } else {
        println!("visible = {visible_count}/{}", entries.len());
    }

    let labels: Vec<&str> = entries
        .iter()
        .map(|e| if e.enabled { "active" } else { "disabled" })
        .collect();
    println!("labels = {:?}", labels);

    if let Some(first) = entries.first() {
        println!("first token {} {}", first.name, first.hex);
    }
}
