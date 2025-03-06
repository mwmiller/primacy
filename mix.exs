defmodule Primacy.MixProject do
  use Mix.Project

  def project do
    [
      app: :primacy,
      version: "0.1.0",
      elixir: "~> 1.10",
      name: "Primacy",
      source_url: "https://hithub/mwmiller/primacy",
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    []
  end

  defp deps do
    [
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    Primacy - prime checking and generation
    """
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "LICENSE*"],
      maintainers: ["Matt Miller"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/mwmiller/primacy"
      }
    ]
  end
end
