Definitions.

Int      = [0-9]+
Float    = [0-9]+\.[0-9]+
WS       = [\n\s\r\t]
String   = "([^\\""]|\\.)*"


Rules.

{Int}    : {token, {num, [], int(TokenChars)}}.
{Float}  : {token, {num, [], flt(TokenChars)}}.
{String} : {token, {string, [], strValue(TokenChars)}}.
{WS}     : skip_token.


Erlang code.

int(S) when is_list(S) ->
  {I, _} = string:to_integer(S),
  I.

flt(S) when is_list(S) ->
  {F, _} = string:to_float(S),
  F.

strValue(S) when is_list(S) ->
  Contents  = tl(lists:droplast(S)),
  Unescaped = deescape(Contents),
  list_to_binary(Unescaped).

deescape(S) when is_list(S) ->
  deescape(S, []).

deescape([$\\, C|Tail], Acc) ->
  deescape(Tail, [C|Acc]);
deescape([C|Tail], Acc) ->
  deescape(Tail, [C|Acc]);
deescape([], Acc) ->
  lists:reverse(Acc).
