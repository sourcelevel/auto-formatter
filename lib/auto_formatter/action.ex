defmodule AutoFormatter.Action do
  @pre_commit_hook_content """
    #!/bin/sh
    set -e
    # Hook from autoformatter 🔎
    autoformatter _format
  """

  alias AutoFormatter.HookManager

  def perform(:version) do
    AutoFormatter.version()
  end

  def perform(:init) do
    HookManager.create("pre-commit", @pre_commit_hook_content)
  end

  def perform(:_format) do
    {output, 0} = System.cmd("git", ["diff", "--name-only"])

    files_list =
      output
      |> String.split("\n")
      |> Enum.reverse()
      |> tl()
      |> Enum.reverse()

    {_output, 0} = System.cmd("mix", ["format" | files_list])

    "Formatted successfully"
  end

  def perform(action) do
    IO.inspect("Performing action: #{action}")
  end
end
