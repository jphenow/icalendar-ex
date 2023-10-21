defmodule ICalendar.Mixfile do
  use Mix.Project

  @source_url "https://github.com/jphenow/icalendar-ex"
  @version "1.1.3"

  def project do
    [
      app: :icalendar,
      name: "ICalendar",
      version: @version,
      elixir: "~> 1.9",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [applications: [:timex]]
  end

  defp deps do
    [
      {:timex, "~> 3.4"},
      {:mix_test_watch, ">= 0.0.0", only: :dev},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      # Temporarily set the manager option for this so it compiles
      # https://elixirforum.com/t/elixir-v1-15-0-released/56584/4?u=axelson
      {:ssl_verify_fun, ">= 0.0.0", manager: :rebar3, override: true}
    ]
  end

  defp package do
    [
      description: "An ICalendar file generator",
      maintainers: ["Jon Phenow"],
      licenses: ["MIT"]
      # links: %{
      #   "Changelog" => "https://hexdocs.pm/icalendar/changelog.html",
      #   "GitHub" => @source_url
      # }
    ]
  end

  defp docs do
    [
      extras: [
        "CHANGELOG.md",
        "LICENSE.md": [title: "License"],
        "README.md": [title: "Overview"]
      ],
      main: "readme",
      source_url: @source_url,
      source_ref: "v#{@version}",
      formatters: ["html"]
    ]
  end
end
