defmodule AutoFormatter.CommandRunnerBehaviour do
  @callback run(String.t(), nonempty_list(String.t())) :: {atom(), String.t()}
end
