To start contributing, first you need to run in your own machine:

## Setup

```
git clone git@github.com:sourcelevel/auto-formatter.git
cd auto-formatter
mix deps.get
mix test
```

## Build

To build `escript` we use [`Mix`](https://hexdocs.pm/mix/master/Mix.Tasks.Escript.Build.html):

```
mix escript.build
```

This will generate a binary file under `_build/autoformatter`.
