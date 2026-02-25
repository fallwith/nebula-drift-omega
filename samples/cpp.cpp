#include <algorithm>
#include <iostream>
#include <optional>
#include <string>
#include <vector>

struct Token {
    std::string kind;
    std::string text;
    int line {};
};

std::optional<Token> find_first(const std::vector<Token>& tokens, std::string kind) {
    auto it = std::find_if(tokens.begin(), tokens.end(), [&](const Token& t) {
        return t.kind == kind;
    });
    if (it == tokens.end()) return std::nullopt;
    return *it;
}

int main() {
    const std::vector<Token> tokens{
        {"keyword", "auto", 1},
        {"identifier", "themeName", 1},
        {"string", "\"Rosette\"", 1},
    };

    if (auto token = find_first(tokens, "string")) {
        std::cout << token->text << " @ line " << token->line << '\n';
    }

    for (const auto& token : tokens) {
        if (token.kind == "keyword") {
            std::cout << "[kw] ";
        } else if (token.kind == "identifier") {
            std::cout << "[id] ";
        } else {
            std::cout << "[other] ";
        }
        std::cout << token.text << '\n';
    }

    auto count_on_line = [&tokens](int line) -> std::size_t {
        return static_cast<std::size_t>(std::count_if(tokens.begin(), tokens.end(), [line](const Token& t) {
            return t.line == line;
        }));
    };

    std::cout << "line 1 token count = " << count_on_line(1) << '\n';
}
