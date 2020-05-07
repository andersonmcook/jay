Definitions.

Whitespace   =  [\s\t]
Terminator   =  \n|\r\n|\r
Comma        =  ,

Digit        =  [0-9]
PosDigit     =  [1-9]
Minus        =  [\-]
Fraction     =  \.{Digit}+
OpenSquare   =  \[
CloseSquare  =  \]
OpenCurly    =  \{
CloseCurly   =  \}
Colon        =  :
String       =  "([^\"\\]|\\.)*"
True         =  true
False        =  false
Null         =  null

IntegerPart   =  {Minus}?0|{Minus}?{PosDigit}{Digit}*
IntegerValue  =  {IntegerPart}
FloatValue    =  {IntegerPart}{Fraction}|{IntegerPart}

Rules.
{Whitespace}    :  skip_token.
{Terminator}    :  skip_token.
{Comma}         :  atom_token(comma, TokenLine, TokenChars).
{IntegerValue}  :  {token, {int, TokenLine, list_to_integer(TokenChars)}}.
{FloatValue}    :  {token, {float, TokenLine, list_to_float(TokenChars)}}.
{String}        :  {token, {string, TokenLine, list_to_binary(string:trim(TokenChars, both, "\""))}}.
{True}          :  {token, {bool, TokenLine, true}}.
{False}         :  {token, {bool, TokenLine, false}}.
{Null}          :  {token, {null, TokenLine, nil}}.
{OpenCurly}     :  atom_token(open_curly, TokenLine, TokenChars).
{CloseCurly}    :  atom_token(close_curly, TokenLine, TokenChars).
{OpenSquare}    :  atom_token(open_square, TokenLine, TokenChars).
{CloseSquare}   :  atom_token(close_square, TokenLine, TokenChars).
{Colon}         :  atom_token(colon, TokenLine, TokenChars).

Erlang code.
atom_token(Atom, TokenLine, TokenChars) ->
    {token, {Atom, TokenLine, list_to_atom(TokenChars)}}.
