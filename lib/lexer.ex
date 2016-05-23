defmodule One.Lexer do
  def tokenize!(code) when is_binary(code) do
    {:ok, tokens, _} = code |> to_char_list |> :one_lexer.string
    tokens
  end
end
