defmodule AutoFormatter.ActionTest do
  use ExUnit.Case, async: true

  import Mox

  alias AutoFormatter.{Action, HookManagerBehaviourMock}

  setup :verify_on_exit!

  describe ".perform/1" do
    test "when receives init create git hook" do
      expect(HookManagerBehaviourMock, :create, fn _hook_filename, _hook_content ->
        :ok
      end)

      assert Action.perform(:init) == :ok
    end
  end
end
