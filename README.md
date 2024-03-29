# Jay
Build a JSON decoder with leex and yecc.

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

The headings are mandatory and you'll get an obtuse error if you misspell one or capitalize "code".

Definitions are a mapping of name to regex.

Rules are a mapping of regex to Erlang code. There are special predefined variables that can be used in the code portion.

- `TokenChars`
- `TokenLen`
- `TokenLine`

The code must either be a token literal or return a token. 

- `{token, Token}`
- `{end_token, Token}`
- `skip_token`
- `{error, ErrString}`

Can also push back characters for the next token.

Each block is scoped and can include variables.

## yecc
[Documentation](https://erlang.org/doc/man/yecc.html)

An [LALR-1](https://en.wikipedia.org/wiki/LALR_parser) parser generator for Erlang, similar to yacc. Takes a [Backus-Naur Form](https://en.wikipedia.org/wiki/Backus-Naur_form) grammar definition as input, and produces Erlang code for a parser.

An LALR-1 parser is a Look-Ahead Left to right, Rightmost derivation parser.  The "1" denotes one-token lookahead.

Reads a `.yrl` file. A `.erl` file is generated automatically if placed in the `src` directory.

Generates a `parse/1` function that will transform a list of tokens.

`.yrl` file structure

```
<Header>

Nonterminals <list>.

Terminals <list>.

Rootsymbol <value>.

<Endsymbol <value>>.

<operator declarations>

<grammar rules>

<Erlang code.>
```

The grammar rules are in the form `lhs -> rhs : code` where `lhs` is a non-terminal category, `rhs` is a sequence of one or more symbols, and `code` is zero or more Erlang expressions. The Erlang expressions have access to pseudo variables `'$n'` where `n` is a positive integer relating to the position of the match (indexed starting at 1).

