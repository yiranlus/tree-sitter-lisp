/**
 * @file A universal Lisp Treesitter
 * @author Yiran Lu <me@yiranls.cc>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

export default grammar({
  name: "lisp",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => "hello"
  }
});
