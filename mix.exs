defmodule Ghoul.Mixfile do
  use Mix.Project

  @version "0.1.1"
  @repo_url "https://github.com/meyercm/ghoul"

  def project do
    [app: :ghoul,
     version: @version,
     elixir: "~> 1.9",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     preferred_cli_env: [espec: :test],
     deps: deps(),
     package: hex_package(),
     description: "An undead cleanup crew for your processes",
     name: "Ghoul",
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger],
     mod: {Ghoul.Application, []}]
  end

  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:earmark, ">= 0.0.0", only: :dev},
      {:espec, "~> 1.8", only: :test},
      {:gproc, "~> 0.9"},
      {:pattern_tap, "~> 0.4"},
      {:shorter_maps, "~> 2.2"},
    ]
  end

  defp hex_package do
    [maintainers: ["Chris Meyer"],
     licenses: ["MIT"],
     links: %{"GitHub" => @repo_url}]
  end
end
