defmodule AutoFormatter.MixProject do
  use Mix.Project

  def project do
    [
      app: :auto_formatter,
      description: "Mix escript to run mix format on precommit git hook",
      version: "0.1.1",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      escript: escript(),
      # Docs
      name: "AutoFormatter",
      source_url: "https://github.com/sourcelevel/auto-formatter",
      homepage_url: "https://hex.pm/packages/auto_formatter/",
      docs: docs()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:mox, "~> 1.0", only: :test}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      name: "auto_formatter",
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/sourcelevel/auto-formatter"}
    ]
  end

  defp escript do
    [
      name: "autoformatter",
      main_module: AutoFormatter.CLI,
      path: "autoformatter"
    ]
  end

  defp docs do
    [
      main: "AutoFormatter",
      extras: ~w(README.md)
    ]
  end
end
