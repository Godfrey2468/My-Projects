defmodule Jsontransformer.MixProject do
  use Mix.Project

  def project do
    [
      app: :jsontransformer,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,

      description: "A JSON transformation library for a specific app",
      package: package(),

      deps: deps()
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

      {:jason, "~> 1.4"},
      {:ex_doc, "~> 0.30.7", only: :dev, runtime: false}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
  defp package do
    [
      licenses: ["MIT"],
      links: %{
        # "GitHub" => "https://github.com/yourusername/jsontransformer",
        # "Documentation" => "https://yourusername.github.io/jsontransformer/docs"
      }
    ]
  end

end
