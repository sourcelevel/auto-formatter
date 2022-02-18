defmodule AutoFormatter.CLI do
  alias AutoFormatter.Action

  @actions ~w[init enable disable version]

  def main(args \\ []) do
    IO.inspect(args)
  end
end
