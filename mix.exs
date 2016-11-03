defmodule MongoEctoGeoSearch.Mixfile do
  use Mix.Project

  def project do
    [app: :mongo_ecto_geosearch,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  def application do
    [applications: [:logger, :ecto, :mongodb_ecto]]
  end

  defp deps do
    [
      {:ecto, "~> 1.1"},
      {:mongodb, github: "appunite/mongodb", branch: "master", override: true},
      {:mongodb_ecto, "~> 0.1", github: "appunite/mongodb_ecto", branch: "ecto_update"}
    ]
  end
end
