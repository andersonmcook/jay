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
{Comma}         :  {token,      {comma,         TokenLine,  list_to_atom(TokenChars)}}.
{IntegerValue}  :  {token,      {int,           TokenLine,  list_to_integer(TokenChars)}}.
{FloatValue}    :  {token,      {float,         TokenLine,  list_to_float(TokenChars)}}.
{String}        :  {token,      {string,        TokenLine,  list_to_binary(string:trim(TokenChars,  both,  "\""))}}.
{True}          :  {token,      {bool,          TokenLine,  true}}.
{False}         :  {token,      {bool,          TokenLine,  false}}.
{Null}          :  {token,      {null,          TokenLine,  nil}}.
{OpenCurly}     :  {token,      {open_curly,    TokenLine,  list_to_atom(TokenChars)}}.
{CloseCurly}    :  {token,      {close_curly,   TokenLine,  list_to_atom(TokenChars)}}.
{OpenSquare}    :  {token,      {open_square,   TokenLine,  list_to_atom(TokenChars)}}.
{CloseSquare}   :  {token,      {close_square,  TokenLine,  list_to_atom(TokenChars)}}.
{Colon}         :  {token,      {colon,         TokenLine,  list_to_atom(TokenChars)}}.

Erlang code.
