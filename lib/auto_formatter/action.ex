defmodule AutoFormatter.Action do
  @pre_commit_hook_content """
    #!/bin/sh
    set -e
    # Hook from autoformatter 🔎
    autoformatter _format
  """

  alias AutoFormatter.{CommandRunner, HookManager}

  @elixir_extensions [".ex", ".exs"]

  def perform(:version) do
    AutoFormatter.version()
  end

  def perform(:init) do
    hook_manager().create("pre-commit", @pre_commit_hook_content)
  end

  def perform(:_format) do
    {:ok, output} = command_runner().run("git", ["diff", "--name-only"])

    files_list =
      output
      |> String.split("\n")
      |> Enum.filter(&String.contains?(&1, @elixir_extensions))
      |> Enum.reverse()
      |> tl()
      |> Enum.reverse()

    {:ok, _output} = command_runner().run("mix", ["format" | files_list])

    "Formatted successfully"
  end

  def perform(action) do
    IO.puts("Performing action: #{action}")
  end

  defp hook_manager do
    Application.get_env(:auto_formatter, :hook_manager, HookManager)
  end

  defp command_runner do
    Application.get_env(:auto_formatter, :command_runner, CommandRunner)
  end
end
