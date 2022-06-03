defmodule AutoFormatter.HookManagerBehaviour do
  @callback create(String.t(), String.t()) :: atom()
end
