defmodule AutoFormatter.HookManager do
  alias AutoFormatter.HookManagerBehaviour

  @hooks_path "./.git/hooks"
  @execution_permission 0o755

  @behaviour HookManagerBehaviour

  @impl HookManagerBehaviour
  def create(hook_filename, hook_content) do
    hook_path = "#{@hooks_path}/#{hook_filename}"

    case File.write(hook_path, hook_content) do
      :ok ->
        make_executable(hook_path)

        :ok

      _ ->
        :error
    end
  end

  defp make_executable(hook_path), do: File.chmod(hook_path, @execution_permission)
end
