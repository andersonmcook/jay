defmodule Jay.Parser do
  import NimbleParsec

  # Ignore whitespace
  whitespace =
    [?\n, ?\r, ?\s, ?\t]
    |> ascii_char()
    |> ignore()
    |> repeat()

  # Number

  # Integer

  # Float
end
