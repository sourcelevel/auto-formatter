defmodule AutoFormatter.CLITest do
  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test ".main/1 when receives help prints the usage instructions" do
    assert capture_io(fn ->
             AutoFormatter.CLI.main(["help"])
           end) == "Usage: autoformatter [action] [options]\n"
  end
end
