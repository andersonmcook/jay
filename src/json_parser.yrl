Nonterminals value object pair pairs array list.

Terminals int float string bool null open_curly close_curly comma colon open_square close_square.

Rootsymbol value.

value -> object : '$1'.
value -> array : '$1'.

value -> int : value_of('$1').
value -> float : value_of('$1').
value -> string : value_of('$1').
value -> bool : value_of('$1').
value -> null : value_of('$1').

object -> open_curly pairs close_curly : '$2'.
object -> open_curly close_curly : #{}.

pairs -> pair comma pairs : merge('$1', '$3').
pairs -> pair : put('$1').
pair -> string colon value : {value_of('$1'), '$3'}.

array -> open_square list close_square : '$2'.
array -> open_square close_square : [].

list -> value comma list : ['$1' | '$3'].
list -> value : ['$1'].

Erlang code.
value_of(Token) ->
    element(3, Token).

put({Key, Value}) ->
    maps:put(Key, Value, #{}).

merge(Pair, Map) ->
    maps:merge(put(Pair), Map).
