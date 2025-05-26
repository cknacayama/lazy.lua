(comment) @comment

(number_literal) @constant.builtin
(integer_literal) @constant.builtin
(boolean_literal) @boolean
(escape_sequence) @string.escape
(string_literal) @string
(character_literal) @string

(identifier) @variable
((identifier) @type
 (#lua-match? @type "^[A-Z]"))
(root_identifier) @variable
((root_identifier) @constructor
 (#lua-match? @constructor "^[A-Z]"))
(module_identifier) @namespace
((module_identifier) @type
 (#lua-match? @type "^[A-Z]"))

(path_identifier
  (path_identifier (root_identifier) @namespace)
    member: (_)
      (#lua-match? @namespace "^[a-z_]"))
(path_identifier
  (path_identifier member: (identifier) @namespace)
    (#lua-match? @namespace "^[a-z_]"))
(import_identifier
  (path_identifier (root_identifier) @namespace)
      (#lua-match? @namespace "^[a-z_]"))

(let_definition
  name: (identifier) @function
  parameter: _)
(let_definition
  parameter: (path_identifier (root_identifier) @variable.parameter)
    (#lua-match? @variable.parameter "^[a-z_]"))
(let_definition
  name: (identifier) @function
  bind: (lambda_expression))
(call_expression
  callee: (path_identifier (root_identifier) @function)
    (#lua-match? @function "^[a-z_]"))
(call_expression
  callee: (path_identifier
    member: (identifier) @function)
      (#lua-match? @function "^[a-z_]"))
(lambda_expression
  parameter: (path_identifier (root_identifier) @variable.parameter)
    (#lua-match? @variable.parameter "^[a-z_]"))

(value_definition
	name: (identifier) @function
    value_type: (function_type))

[
  "type"
  "alias"
  "let"
  "match"
  "if"
  "then"
  "else"
  "in"
  "with"
  "module"
  "val"
  "class"
  "instance"
  "infix"
  "infixl"
  "infixr"
  "prefix"
] @keyword

[
  "-"
  "..="
  ".."
] @operator

(operator) @operator

[
  "("
  ")"
  "{"
  "}"
  "["
  "]"
] @punctuation.bracket

[
  "="
  "@"
  ";"
  "|"
  ","
  "->"
  "=>"
  ":"
  "::"
  "\\"
] @punctuation.delimiter

(int_type) @type.builtin
(bool_type) @type.builtin
(char_type) @type.builtin
(real_type) @type.builtin

"_" @constant.builtin
