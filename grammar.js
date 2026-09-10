/**
 * @file Commonlisp grammar for tree-sitter
 * @author Yiran Lu <me@yiranls.cc>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

export default grammar({
  name: "commonlisp",

  rules: {
    // TODO: add the actual grammar rules
    source_file: $ => "hello"
  }
});
