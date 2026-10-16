[
 "("
 ")"]
@punctuation.bracket

;; comments

(comment) @comment
((list . (token) @keyword)
 (#eq? @keyword "comment")) @comment

((list . (token) @keyword.operator)
 (#any-of? @keyword.operator
           "%" "*" "+" "-" "->" "->>" "-?>" "-?>>" "." ".." "/" "//"
           ":" "<" "<=" "=" ">" ">=" "^" "~=" "and" "or" "not" "not="))

((list . (token) @keyword.function)
 (#any-of? @keyword.function
           "lambda" "λ" "fn" "macro" "macros"))

((list . (token ) @keyword)
 (#any-of? @keyword
           "do" "doto" "for" "each" "while"
           "if" "when"
           "case" "case-try" "collect" "doc"
           "eval-compiler" "faccumulate" "fcollect"
           "global" "hashfn" "icollect" "import-macros" "include"
           "length" "let" "local" "lua" "macrodebug"
           "match" "match-try" "partial" "pick-args"
           "pick-values" "quote" "require-macros" "set" "set-forcibly!"
           "tset" "var" "with-open"
           "values"))

((token) @module.builtin
         (#any-of? @module.builtin
                   "coroutine" "debug" "io" "math" "os" "package"
                   "string" "table" "utf8"))

((token) @function.builtin
         (#any-of? @function.builtin
                   "assert" "collectgarbage" "dofile" "error"
                   "getmetatable" "ipairs" "load" "loadfile" "next"
                   "pairs" "pcall" "print" "rawequal" "rawget" "rawlen"
                   "rawset" "require" "select" "setmetatable" "tonumber"
                   "tostring" "type" "xpcall"

                   "coroutine.create" "coroutine.isyieldable"
                   "coroutine.resume" "coroutine.running"
                   "coroutine.status" "coroutine.wrap" "coroutine.yield"

                   "debug.debug" "debug.gethook" "debug.getinfo"
                   "debug.getlocal" "debug.getmetatable"
                   "debug.getregistry" "debug.getupvalue"
                   "debug.getuservalue" "debug.sethook" "debug.setlocal"
                   "debug.setmetatable" "debug.setupvalue"
                   "debug.setuservalue" "debug.traceback"
                   "debug.upvalueid" "debug.upvaluejoin"

                   "io.close" "io.flush" "io.input" "io.lines" "io.open"
                   "io.output" "io.popen" "io.read" "io.stderr"
                   "io.stdin" "io.stdout" "io.tmpfile" "io.type"
                   "io.write"

                   "math.abs" "math.acos" "math.asin" "math.atan"
                   "math.ceil" "math.cos" "math.deg" "math.exp"
                   "math.floor" "math.fmod" "math.huge" "math.log"
                   "math.max" "math.maxinteger" "math.min"
                   "math.mininteger" "math.modf" "math.pi" "math.rad"
                   "math.random" "math.randomseed" "math.sin"
                   "math.sqrt" "math.tan" "math.tointeger" "math.type"
                   "math.ult"

                   "os.clock" "os.date" "os.difftime" "os.execute"
                   "os.exit" "os.getenv" "os.remove" "os.rename"
                   "os.setlocale" "os.time" "os.tmpname"

                   "package.config" "package.cpath" "package.loaded"
                   "package.loadlib" "package.path" "package.preload"
                   "package.searchers" "package.searchpath"
                   "string.byte" "string.char" "string.dump"
                   "string.find" "string.format" "string.gmatch"
                   "string.gsub" "string.len" "string.lower"
                   "string.match" "string.pack" "string.packsize"
                   "string.rep" "string.reverse" "string.sub"
                   "string.unpack" "string.upper"

                   "table.concat" "table.insert" "table.move"
                   "table.pack" "table.remove" "table.sort"
                   "table.unpack"

                   "utf8.char" "utf8.charpattern" "utf8.codepoint"
                   "utf8.codes" "utf8.len" "utf8.offset"))

((token) @variable.builtin
         (#any-of? @variable.builtin
                   "_G" "_VERSION"))
