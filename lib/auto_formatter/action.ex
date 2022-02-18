defmodule AutoFormatter.Action do
  def perform(:version) do
    AutoFormatter.version()
  end

  def perform(action) do
    IO.inspect("Performing action: #{action}")
  end
end
