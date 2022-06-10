defmodule AutoFormatter.CommandRunner do
  alias AutoFormatter.CommandRunnerBehaviour

  @behaviour CommandRunnerBehaviour

  @impl CommandRunnerBehaviour
  def run(command, args \\ [""]) do
    case System.cmd(command, args) do
      {output, 0} -> {:ok, output}
      {output, _exit_status} -> {:error, output}
    end
  end
end
