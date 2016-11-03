defmodule Mongo.Ecto.GeoSearch.Migration do
  use Ecto.Migration

  def create_2dsphere_index(relation, field, opts \\ %{})
  def create_2dsphere_index(relation, field, opts) when is_atom(field) do
    do_create_index(relation, field, opts)
  end
  def create_2dsphere_index(relation, field, opts) do
    atom_field = String.to_atom(field)
    do_create_index(relation, atom_field, opts)
  end

  defp do_create_index(relation, field, opts) do
    execute [
      createIndexes: relation,
      indexes: [
        [
          key: [{field, "2dsphere"}],
          name: name(field, opts),
          "2dsphereIndexVersion": index_version(opts)
        ]
      ]
    ]
  end

  defp name(field, opts) do
    opts[:name] || "#{field}_2dsphere"
  end

  defp index_version(opts), do: opts[:index_version] || 3
end
