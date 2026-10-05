[
 "("
 ")"
 ] @punctuation.bracket

;; comments

(comment) @comment

;; basic data types
((token) @boolean
         (#match? @boolean "^(t|nil)$"))

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
((token) @constant
         (#match? @constant "^\\+.*\\+$"))
((token) @variable
         (#match? @variable "^\\*.*\\*$"))
((token) @variable.parameter
         (#match? @variable.parameter "^#?:"))

((token) @function
         (#match? @function "^#'"))

((token) @keyword.function
         (#any-of? @keyword.function
          "lambda"
          "defun"
          "defgeneric" "defmethod"
          "defmacro"
          "defsubst"
          "defsetf"
          "define-method-combination"
          "define-setf-expander"
          "define-compiler-macro" "define-modify-macro"))

((token) @keyword.type
         (#any-of? @keyword.type
          "defstruct" "deftype" "defclass"
          "define-condition"
          "defpackage"))

((token) @keyword.debug
         (#any-of? @keyword.debug
          "assert" "check-type"))

((token) @keyword.exception
         (#any-of? @keyword.exception
          "warn" "error" "signal"
          "abort" "cerror"))

((token) @keyword.conditional
         (#any-of? @keyword.conditional
          "cond" "if" "while" "when" "unless"
          "case" "ccase"
          "etypecase" "typecase" "ecase"))

((token) @keyword.return
         (#any-of? @keyword.return "return" "return-from"))

((token) @keyword
         (#any-of? @keyword
          "define-symbol-macro"
          "defvar" "defparameter" "defconst"

          "let" "let*" "progn" "prog1"
          "prog2" "lambda" "unwind-protect"
          "with-output-to-string" "handler-bind"
          "ignore-errors" "dotimes" "dolist" "declare"

          "block" "break" "compiler-let"
          "declaim" "destructuring-bind" "do" "do*"
          "eval-when" "flet" "flet*" "condition-case"
          "go" "handler-case" "in-package" ;; "inline"
          "labels" "letf" "locally" "loop"
          "macrolet" "multiple-value-bind" "multiple-value-prog1"
          "proclaim" "prog" "prog*" "progv"
          "restart-case" "restart-bind"
          "symbol-macrolet" "tagbody" "the"
          "with-accessors" "with-compilation-unit"
          "with-condition-restarts" "with-hash-table-iterator"
          "with-input-from-string" "with-open-file"
          "with-open-stream" "with-package-iterator"
          "with-simple-restart" "with-slots" "with-standard-io-syntax"))

