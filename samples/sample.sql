-- SQL sample — standard SQL with common extensions
-- Exercises: keywords, types, strings, numbers, operators, functions, comments

CREATE TABLE IF NOT EXISTS theme_preview (
  id          INTEGER PRIMARY KEY,
  theme_name  VARCHAR(64) NOT NULL,
  token_name  VARCHAR(32) NOT NULL,
  hex_code    CHAR(7) NOT NULL,
  is_bold     BOOLEAN DEFAULT FALSE,
  created_at  TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO theme_preview (theme_name, token_name, hex_code, is_bold)
VALUES
  ('Nebula Drift: Omega', 'keyword',  '#E8A838', TRUE),
  ('Nebula Drift: Omega', 'string',   '#5AAA88', FALSE),
  ('Nebula Drift: Omega', 'function', '#6AB8C8', FALSE);

UPDATE theme_preview
   SET is_bold = TRUE
 WHERE token_name = 'function'
   AND hex_code = '#6AB8C8';

-- Subquery with CASE expression
SELECT
  token_name,
  hex_code,
  CASE
    WHEN token_name IN ('keyword', 'number')   THEN 'warm'
    WHEN token_name IN ('function', 'type')    THEN 'cool'
    ELSE 'neutral'
  END AS token_family,
  COUNT(*) AS occurrences
FROM theme_preview
WHERE theme_name LIKE 'Nebula%'
GROUP BY token_name, hex_code
HAVING COUNT(*) >= 1
ORDER BY token_name ASC;

-- CTE (Common Table Expression)
WITH recent_tokens AS (
  SELECT token_name, hex_code
    FROM theme_preview
   WHERE created_at >= CURRENT_TIMESTAMP - INTERVAL '7' DAY
)
SELECT * FROM recent_tokens;

-- Transaction block
BEGIN;

DELETE FROM theme_preview
 WHERE token_name = 'string'
   AND hex_code = '#5AAA88';

INSERT INTO theme_preview (theme_name, token_name, hex_code, is_bold)
SELECT 'Nebula Drift: Omega', 'comment', '#7A7060', FALSE
 WHERE NOT EXISTS (
   SELECT 1 FROM theme_preview WHERE token_name = 'comment'
 );

COMMIT;

-- Cleanup
DROP TABLE IF EXISTS theme_preview;
