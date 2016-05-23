defmodule One.Mixfile do
  use Mix.Project

  def project do
    [
      app: :lang_one,
      version: "0.0.1",
      elixir: "~> 1.2",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      deps: deps,
    ]
  end

  def application do
    [applications: []]
  end

  defp deps do
    [
      # Code style linter
      {:dogma, "~> 0.0", only: ~w(dev test)a},
      # Automatic test runner
      {:mix_test_watch, github: "lpil/mix-test.watch", only: :dev},
    ]
  end
end
