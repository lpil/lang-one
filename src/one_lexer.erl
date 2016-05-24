-module(one_lexer).
-export([tokenizeX/1]).

tokenizeX(Code) when is_binary(Code) ->
  Chars = binary_to_list(Code),
  tokenizeX(Chars);

tokenizeX(Chars) when is_list(Chars) ->
  {ok, Tokens, _} = one_yacc_lexer:string(Chars),
  Tokens.
