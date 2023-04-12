defmodule HttpWrapper.MixProject do
  use Mix.Project

  def project do
    [
      app: :http_wrapper,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mods: mods(Mix.env())
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  defp mods(:test), do: [Intellex.MockServer]
  defp mods(_), do: []

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.8"},
      {:jason, "~> 1.2"},
      {:plug, "~> 1.12", only: :test},
      {:plug_cowboy, "~> 2.5", only: :test}
    ]
  end
end
