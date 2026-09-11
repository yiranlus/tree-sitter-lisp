package tree_sitter_lisp_test

import (
	"testing"

	tree_sitter "github.com/tree-sitter/go-tree-sitter"
	tree_sitter_lisp "github.com/yiranlus/tree-sitter-lisp/bindings/go"
)

func TestCanLoadGrammar(t *testing.T) {
	language := tree_sitter.NewLanguage(tree_sitter_lisp.Language())
	if language == nil {
		t.Errorf("Error loading Lisp grammar")
	}
}
