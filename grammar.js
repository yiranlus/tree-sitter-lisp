/**
 * @file A universal Lisp Treesitter
 * @author Yiran Lu <me@yiranls.cc>
 * @license MIT
 */

/// <reference types="tree-sitter-cli/dsl" />
// @ts-check

const PREC = {
  first: ($) => prec(100, $),
  last: ($) => prec(-100, $),
};

const common = {
  whitespace: /[ \r\n\t\f\v\p{Zs}\p{Zl}\p{Zp}]/,
  intra_whitespace: /[\t\p{Zs}]/,
  line_ending: /[\n\r\u{2028}\u{0085}]|(\r\n)|(\r\u{0085})/,
  any_char: /.|[\r\n\u{85}\u{2028}\u{2029}]/,

  symbol_char: /[^ \r\n\t\f\v\p{Zs}\p{Zl}\p{Zp}#;"'`,\(\)|]/,
};

export default grammar({
  name: "lisp",

  rules: {
    program: $ => repeat($._expression),

    _expression: $ => choice($._intertoken, $._s_expr),

    // intertoken is a token that can appear between datums, such as whitespace and comments.
    _intertoken: $ => choice(
      token(repeat1(common.whitespace)),
      $.comment,
    ),

    comment: $ => choice($._line_comment, $._block_comment),

    _line_comment: _ => /;.*/,

    _block_comment: $ => seq(
      "#|",
      repeat(
        choice(
          PREC.first($._block_comment),
          common.any_char)),
      PREC.first("|#")
    ),

    // a datum is basically S-expr
    _s_expr: $ => choice(
      $.token,
      $.list,
      $.reader_macro,
      $.quote,
      $.quasiquote,
      $.unquote,
      $.unquote_splicing,
    ),

    _string: _ => token(
      seq(
        '"',
        repeat(
          choice(
            seq('\\', /./),
            '\\\n',
            /[^"\\]+/
          )
        ),
        '"'
      )
    ),

    // a symbol here includes identifiers, and operands
    _pure_token: $ => token(
      choice(
        repeat1(common.symbol_char),
        seq("|",
          repeat(
            choice(
              '\\\n',
              /[^|]+/
            )
          ),
          "|"),
      )
    ),
    token: $ => choice($._pure_token, $._string),

    list: $ => seq("(", repeat($._expression), ")"),

    reader_macro: $ => seq(
      "#",
      choice(
        seq("\\", /[#;"'`,\(\)]/),
        $.list, // vector
        seq("'", repeat($._intertoken), choice($._pure_token, $.list)), // quote
        PREC.first(seq($._pure_token, choice($._string, $.list))),
        PREC.last($._pure_token)
      )
    ),

    quote: $ => seq("'", repeat($._intertoken), $._s_expr),
    quasiquote: $ => seq("`", repeat($._intertoken), $._s_expr),
    unquote: $ => seq(",", repeat($._intertoken), $._s_expr),
    unquote_splicing: $ => seq(",@", repeat($._intertoken), $._s_expr),
  },
});
