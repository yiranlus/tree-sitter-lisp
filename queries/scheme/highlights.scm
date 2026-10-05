;; comments
(comment) @comment
((reader_macro) @comment
                (#match? @comment "^#;"))

;; basic data types
((reader_macro) @boolean
         (#any-of? @boolean "#t" "#f" "#true" "#false"))

((token) @string
         (#match? @string "^\".*\"$"))

((token) @number
         (#match? @number "^[+-]?[0-9]+$"))
((reader_macro) @number
                (#match? @number "^#[bB][+-]?[01]+$"))
((reader_macro) @number
                (#match? @number "^#[oO][+-]?[0-7]+$"))
((reader_macro) @number
                (#match? @number "^#[xX][+-]?[0-9a-fA-F]+$"))
((reader_macro) @number
                (#match? @number "^#[0-9a-zA-Z]+R[0-9a-zA-Z]+$"))

((token) @number.float
         (#match? @number.float "^[+-]?([0-9]+)?\.[0-9]+([sSfFdDlLeE][+-]?[0-9]+)?$"))
((token) @number.float
         (#match? @number.float "^[+-]?[0-9]+(\.([0-9]+)?)?[sSfFdDlLeE][+-]?[0-9]+$"))

((reader_macro) @character
                (#match? @character "^#\\\\[a-zA-Z0-9]+$"))

;; conventions
((token) @variable.parameter
         (#match? @variable.parameter "^#:"))

((list . (token) @keyword)
 (#match? @keyword
  "define\\*?((-public|-method|-generic(-procedure)?)|(-syntax|-macro)|-class|-module)?"))

((list . (token) @keyword)
 (#any-of? @keyword
  "begin" "call-with-current-continuation" "call/cc"
  "call-with-input-file" "call-with-output-file"
  "call-with-port"
  "case" "cond"
  "do" "else" "for-each" "if" "lambda" "λ"
  "let" "let*" "let-syntax" "letrec" "letrec-syntax"
  ;; R6RS library subforms.
  "export" "import"
  ;; SRFI 11 usage comes up often enough.
  "let-values" "let*-values"
  ;; Hannes Haug <hannes.haug@student.uni-tuebingen.de> wants:
  "and" "or" "delay" "force"
  ;; Stefan Monnier <stefan.monnier@epfl.ch> says don't bother:
  ;;"quasiquote" "quote" "unquote" "unquote-splicing"
  "map" "syntax" "syntax-rules"
  ;; For R7RS
  "when" "unless" "letrec*" "include" "include-ci" "cond-expand"
  "delay-force" "parameterize" "guard" "case-lambda"
  "syntax-error" "only" "except" "prefix" "rename" "define-values"
  "define-record-type" "define-library"
  "include-library-declarations"
  ;; SRFI-8
  "receive"))
