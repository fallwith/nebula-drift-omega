package main

import (
	"encoding/json"
	"fmt"
	"log"
	"strings"
	"time"
)

type PaletteEntry struct {
	Name    string `json:"name"`
	Hex     string `json:"hex"`
	Enabled bool   `json:"enabled"`
}

func (p PaletteEntry) Label() string {
	state := "off"
	if p.Enabled {
		state = "on"
	}
	return fmt.Sprintf("%s (%s)", strings.ToUpper(p.Name), state)
}

func main() {
	entry := PaletteEntry{Name: "nebula_teal", Hex: "#4A9090", Enabled: true}
	entries := []PaletteEntry{
		entry,
		{Name: "stellar_red", Hex: "#C43030", Enabled: true},
		{Name: "stardust", Hex: "#4A3A6A", Enabled: false},
	}
	raw, err := json.MarshalIndent(entry, "", "  ")
	if err != nil {
		log.Fatal(err)
	}

	fmt.Printf("%s @ %s\n%s\n", entry.Label(), time.Now().Format(time.RFC3339), raw)

	counts := map[string]int{"warm": 0, "cool": 0, "neutral": 0}
	for _, e := range entries {
		switch {
		case strings.Contains(e.Name, "red"):
			counts["warm"]++
		case strings.Contains(e.Name, "teal"):
			counts["cool"]++
		default:
			counts["neutral"]++
		}
		if !e.Enabled {
			continue
		}
		fmt.Printf("%-14s => %s\n", e.Name, e.Hex)
	}

	for kind, n := range counts {
		fmt.Printf("%s=%d ", kind, n)
	}
	fmt.Println()
}
