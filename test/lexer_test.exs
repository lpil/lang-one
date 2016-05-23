defmodule OneLexerTest do
  use ExUnit.Case

  defmacro code ~> tokens do
    quote do
      assert unquote(tokens) = One.Lexer.tokenize!(unquote(code))
    end
  end

  test "numbers" do
    "1"       ~> [{:num, _, 1}]
    "1.1"     ~> [{:num, _, 1.1}]
    "29.1234" ~> [{:num, _, 29.1234}]
    "0001"    ~> [{:num, _, 1}]
  end
end
