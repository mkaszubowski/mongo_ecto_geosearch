defmodule Mongo.Ecto.GeoSearch.Migration do
  use Ecto.Migration

  def create_2dsphere_index(relation, field) do
    execute [
      createIndexes: relation,
      key: {field, "2dsphere"} ,
      "2dsphereIndexVersion": 3
    ]
  end
end
