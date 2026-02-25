#lang racket

(require racket/match
         racket/string)

(struct token (kind text line) #:transparent)

(define sample
  (list (token 'keyword "define" 1)
        (token 'identifier "theme-name" 1)
        (token 'string "\"Rosette\"" 1)))

(define palette
  (hash 'keyword "#C43030"
        'string "#E8D080"
        'comment "#4A3A6A"
        'function "#8AB4E8"))

(define (render t)
  (match t
    [(token 'keyword txt line) (format "~a @~a [kw]" txt line)]
    [(token kind txt line) (format "~a @~a [~a]" txt line kind)]))

(define (classify hex)
  (cond
    [(regexp-match? #px"^#(?:C4|D4)" hex) 'warm]
    [(regexp-match? #px"^#(?:8A|5B|4A)" hex) 'cool]
    [else 'neutral]))

(define (palette->report table)
  (for/list ([(k v) (in-hash table)])
    (format "~a => ~a (~a)" k v (classify v))))

(for ([t sample])
  (displayln (string-upcase (render t))))

(displayln "---")
(for ([line (in-list (sort (palette->report palette) string<?))])
  (displayln line))

(for ([t sample])
  (match-define (token kind txt line) t)
  (printf "~a line=~a severity=~a~n"
          txt
          line
          (case kind
            [(keyword) 'high]
            [(identifier function) 'medium]
            [(comment) 'low]
            [else 'normal])))
