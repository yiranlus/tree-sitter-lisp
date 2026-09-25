# Overview

This tree-sitter is a very general Lisp parser. It has been tested on Common Lisp and Guile codes.

## Concept

This tree-sitter does not aim to map the Lisp code to a syntaxique structure. Instead, it tries to keep parsed structure as simple as possible. In a parsing, only the following node types will be produced:

```
* program
  * list
    * token (including number (not start with `#`), string, symbol and keywords start with `:`)
    * quote
    * quasiquote
    * unquote
    * unquote_splicing
    * reader_macro
  * reader_macro
```

`reader_macro` always starts with `#`, so numbers like `#x` and `#o` will also be considered to be a `reader_macro`. `reader_macro` can have the following forms:

* `#<symbol>`, e.g., `#this`
* `#<list>`, e.g., `#(1 2 3 4)`
* `#<symbol><list>`, e.g., `#v(1 2 3)`

Besides, `{}` and `[]` are considered to be parenthesis symbol just as `()`. The parenthesis is not stored as named node.

## Compilation

This repository provides a simple way to compile and install it for multiple languages. You will need to install a valid compiler and `make` to do this.

You can compile it using:

```bash
make
```

It will generate a shared library for parsing `lisp` files.

You can also compile it for other languages by giving `LANG` a value. For example, if you want to compile for Scheme:

```bash
make LANG=scheme
```

## Installation for Neovim

If you want to use this tree-sitter for Neovim, you can load the plugin using the following code using `lazy.nvim`:

```lua
{
  "tree-sitter-lisp",
  dir = "~/Projects/tree-sitter-lisp",
  lazy = false,
  build = "./build.sh lisp scheme commonlisp",
},
```

This will build parsers for `lisp`, `scheme`, and `commonlisp`. All of these parsers use the same grammar. If you only want to install it for general Lisp, you can safely remove these options.
