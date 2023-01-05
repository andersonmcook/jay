defmodule Jay do
  @moduledoc """
  Documentation for `Jay`.
  """

  @doc """
  Uses leex and yecc to compile parsing strategy and rules.
  """
  def parse(string) when is_binary(string) do
    string
    |> String.to_charlist()
    |> parse()
  end

  def parse(charlist) do
    with {:ok, tokens, _end_line} <- :json_lexer.string(charlist) do
      :json_parser.parse(tokens)
    end
  end

  @doc """
  Parses more than it explodes.
  """
  def parse!(parsable) do
    case parse(parsable) do
      {:ok, parsed} -> parsed
      {:error, reason} -> raise inspect(reason)
    end
  end
end
