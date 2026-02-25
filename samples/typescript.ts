type TokenKind = "keyword" | "string" | "comment" | "identifier";

interface HighlightToken {
  kind: TokenKind;
  text: string;
  line: number;
}

type ThemeMap = Record<TokenKind, `#${string}`>;

const theme: ThemeMap = {
  keyword: "#C43030",
  string: "#E8D080",
  comment: "#4A3A6A",
  identifier: "#8AB4E8",
};

function groupByLine(tokens: HighlightToken[]): Map<number, HighlightToken[]> {
  const map = new Map<number, HighlightToken[]>();
  for (const token of tokens) {
    const bucket = map.get(token.line) ?? [];
    bucket.push(token);
    map.set(token.line, bucket);
  }
  return map;
}

function colorFor(kind: TokenKind): string {
  return theme[kind] satisfies string;
}

const sampleTokens: HighlightToken[] = [
  { kind: "keyword", text: "const", line: 1 },
  { kind: "identifier", text: "name", line: 1 },
  { kind: "string", text: '"Rosette"', line: 1 },
];

console.log(groupByLine(sampleTokens), colorFor("keyword"));

enum Severity {
  Info = "info",
  Warn = "warn",
  Error = "error",
}

type Diagnostic =
  | { severity: Severity.Info; message: string; line: number }
  | { severity: Severity.Warn; message: string; line: number; code?: string }
  | { severity: Severity.Error; message: string; line: number; fatal: true };

function formatDiagnostic(diagnostic: Diagnostic): string {
  switch (diagnostic.severity) {
    case Severity.Info:
      return `INFO:${diagnostic.line} ${diagnostic.message}`;
    case Severity.Warn:
      return `WARN:${diagnostic.line} ${diagnostic.code ?? "GEN"} ${diagnostic.message}`;
    case Severity.Error:
      return `ERROR:${diagnostic.line} fatal=${diagnostic.fatal} ${diagnostic.message}`;
    default: {
      const _exhaustive: never = diagnostic;
      return _exhaustive;
    }
  }
}

const diag: Diagnostic = { severity: Severity.Warn, message: "low contrast token", line: 12 };
console.log(formatDiagnostic(diag));
