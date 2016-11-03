defmodule Mongo.Ecto.GeoSearch.Query do
  import Ecto.Query

  @default_opts %{
    max_distance: 1000
  }

  def near_sphere(query, field, params, opts \\ @default_opts)
  def near_sphere(query, field, %{"lat" => lat, "lng" => lng}, opts) do
    do_near_sphere(query, field, lat, lng, opts)
  end
  def near_sphere(query, field, %{"lat" => lat, "lng" => lng}, opts) do
    do_near_sphere(query, field, lat, lng, opts)
  end
  def near_sphere(query, field, %{lat: lat, lng: lng}, opts) do
    do_near_sphere(query, field, lat, lng, opts)
  end
  def near_sphere(query, field, %{lat: lat, lng: lng}, opts) do
    do_near_sphere(query, field, lat, lng, opts)
  end
  def near_sphere(query, _, _, _), do: query

  defp do_near_sphere(query, field, lat, lng, opts) do
    near_sphere = [
      "$nearSphere": [
        "$geometry": [
          "type": "Point",
          "coordinates": [to_float(lng), to_float(lat)]
        ],
        "$maxDistance": opts[:max_distance]
      ]]
    expr = [{field, near_sphere}]
    from(x in query, where: fragment(^expr))
  end

  defp to_float(f) when is_float(f), do: f
  defp to_float(s), do: Float.parse(s) |> elem(0)
end
