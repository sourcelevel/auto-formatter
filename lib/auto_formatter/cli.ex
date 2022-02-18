defmodule AutoFormatter.CLI do
  alias AutoFormatter.Action

  @actions ~w[init enable disable version]

  def main(args \\ []) do
    args
    |> parse_args()
    |> execute()
    |> output()
  end

  defp parse_args([action]) when action in @actions, do: String.to_atom(action)
  defp parse_args(_args), do: :help

  defp execute(:help) do
    "Usage: autoformatter [action] [options]"
  end

  defp execute(action), do: Action.perform(action)

  defp output(message), do: IO.puts(message)
end
