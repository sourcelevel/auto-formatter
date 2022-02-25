defmodule AutoFormatter.Action do
  @pre_commit_hook_content """
    #!/bin/sh
    set -e
    # Hook from autoformatter 🔎
    autoformatter _format
  """

  @pre_commit_hook_path "./.git/hooks/pre-commit"

  def perform(:version) do
    AutoFormatter.version()
  end

  def perform(:init) do
    case File.write(@pre_commit_hook_path, @pre_commit_hook_content) do
      :ok ->
        File.chmod(@pre_commit_hook_path, 0o755)
      _ ->
        :error
    end
  end

  def perform(action) do
    IO.inspect("Performing action: #{action}")
  end
end
