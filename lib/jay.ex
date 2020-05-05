defmodule Jay do
  @moduledoc """
  Documentation for `Jay`.
  """

  @doc """
  Uses leex and yecc to compile parsing strategy and rules.
  """
  def ly_parse(string) when is_binary(string) do
    string
    |> String.to_charlist()
    |> ly_parse()
  end

  def ly_parse(charlist) do
    charlist
    |> :json_lexer.string()
    |> case do
      {:ok, tokens, _end_line} ->
        :json_parser.parse(tokens)

      error ->
        error
    end
  end

  @doc """
  Parses more than it explodes.
  """
  def ly_parse!(parsable) do
    parsable
    |> ly_parse()
    |> case do
      {:ok, parsed} -> parsed
      {:error, reason} -> raise inspect(reason)
    end
  end
end
