-module(lexer_test).
-include_lib("eunit/include/eunit.hrl").

-define(assertTokens(Code, Tokens),
        ?assertMatch(Tokens, one_lexer:tokenizeX(Code))).

numbers_test() ->
  ?assertTokens("1",     [{num, _, 1}]),
  ?assertTokens("1.1",   [{num, _, 1.1}]),
  ?assertTokens("29.12", [{num, _, 29.12}]),
  ?assertTokens("0007",  [{num, _, 7}]) .

strings_test() ->
  ?assertTokens("\"Hi\"",     [{string, _, <<"Hi">>}]),
  ?assertTokens("\"\"",       [{string, _, <<"">>}]),
  ?assertTokens("\" \\\\ \"", [{string, _, <<" \\ ">>}]),
  ?assertTokens("\" \\\" \"", [{string, _, <<" \" ">>}]).

char_list_test() ->
  ?assertTokens("'Hi'",     [{char_list, _, <<"Hi">>}]),
  ?assertTokens("''",       [{char_list, _, <<"">>}]),
  ?assertTokens("' \\\\ '", [{char_list, _, <<" \\ ">>}]),
  ?assertTokens("' \\' '",  [{char_list, _, <<" ' ">>}]).

atom_test() ->
  ?assertTokens(":hi",         [{atom, _, hi}]),
  ?assertTokens(":123",        [{atom, _, '123'}]),
  ?assertTokens(":WHAT_UP?",   [{atom, _, 'WHAT_UP?'}]),
  ?assertTokens(":Hey-there!", [{atom, _, 'Hey-there!'}]).

quoted_atom_test() ->
  ?assertTokens(":\"hi\"",     [{atom, _, hi}]),
  ?assertTokens(":\"\"",       [{atom, _, ''}]),
  ?assertTokens(":\" \\\\ \"", [{atom, _, ' \\ '}]),
  ?assertTokens(":\" \\\" \"",  [{atom, _, ' " '}]).
