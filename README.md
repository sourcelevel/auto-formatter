# AutoFormatter

This package have the responsibility to run `mix format`
before **EVERY** commit to ensure that you modified code
is formated.

## Installation

The best way to install this package is install it as a escript:

```bash
mix escript.install hex auto_formatter
```

Otherwise, this package can be installed by adding `auto_formatter` to
your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:auto_formatter, "~> 0.1.0"}
  ]
end
```
Then, run `mix deps.get` on your terminal to download it.

## Usage

All that you need is init it:

```bash
autoformatter init
```

## Documentation

The docs can be found at
[HexDocs](https://hexdocs.pm/auto_formatter).
