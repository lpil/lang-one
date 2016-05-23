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

  test "strings" do
    ~S("Hi") ~> [{:string, _, "Hi"}]
    ~S("")   ~> [{:string, _, ""}]
    ~S("\\") ~> [{:string, _, ~S(\\)}]
    ~S("\"") ~> [{:string, _, ~S(\")}]
  end
end
