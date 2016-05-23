Definitions.

Int    = [0-9]+
Float  = [0-9]+\.[0-9]+
WS     = [\n\s\r\t]
String = "([^\\"]|\\.)*"

%"


Rules.

{Int}    : {token, {num, [], int(TokenChars)}}.
{Float}  : {token, {num, [], flt(TokenChars)}}.
{String} : {token, {string, [], str(TokenChars)}}.
{WS}     : skip_token.


Erlang code.

int(S) when is_list(S) ->
  {I, _} = string:to_integer(S),
  I.

flt(S) when is_list(S) ->
  {F, _} = string:to_float(S),
  F.

str(S) when is_list(S) ->
  list_to_binary(tl(lists:droplast(S))).
