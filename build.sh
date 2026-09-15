#!/usr/bin/bash

# ensure the script is run under the correct directory
cd "$(dirname "$(readlink -f "$0")")" || (echo "Failed to change directory to script location" && exit 1)

rm -r parser/
mkdir -p parser/

tree-sitter generate

case "$OSTYPE" in
  darwin*) SOEXT=dylib ;;
  linux*) SOEXT=so ;;
  *) echo "Unsupported OS: $OSTYPE" && exit 1 ;;
esac

for lang in "$@"; do
  if [ "$lang" != "lisp" ]; then
    echo "Building $lang parser"

    rm -r "src-$lang"
    mkdir -p "src-$lang"

    cp "src/grammar.json" "src-$lang/grammar.json"
    cp "src/parser.c" "src-$lang/parser.c"
    ln -s "../src/tree_sitter/" "src-$lang/tree_sitter"

    sed -i "s/lisp/$lang/g" "src-$lang/grammar.json" "src-$lang/parser.c"
  fi

  make LANG="$lang"
  cp "libtree-sitter-$lang.$SOEXT" "parser/$lang.$SOEXT"
  make LANG="$lang" clean
done
