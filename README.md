# Jay


## leex
[Documentation](https://erlang.org/doc/man/leex.html)

A regular expression based lexical analyzer generator for Erlang, similar to lex or flex.

Reads a `.xrl` file with Definitions, Rules, and Erlang code headings. A `.erl` file is generated automatically if placed in the `src` directory.

Generates a `string/1` function that will return a list of tokens.

`.xrl` file structure
```
<Header>

Definitions.

<Macro Definitions>

Rules.

<Token Rules>

Erlang code.

<Erlang code>
```

