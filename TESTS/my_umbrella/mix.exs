defmodule MyUmbrella.MixProject do
  use Mix.Project

  def project do
    [
      apps_path: "apps",
      version: "0.1.0",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end


  defp apps(:child1), do: [app: :child_app1]
  defp apps(:child2), do: [app: :child_app2]


def application do
  [
    extra_applications: [:logger],
    applications: [:child_app1, :child_app2]
  ]
end


  # Dependencies listed here are available only for this
  # project and cannot be accessed from applications inside
  # the apps folder.
  #
  # Run "mix help deps" for examples and options.
  defp deps do
    []
  end
end
