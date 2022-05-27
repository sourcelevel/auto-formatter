import Config

config :auto_formatter,
  hook_manager: AutoFormatter.HookManager

import_config "#{Mix.env()}.exs"
