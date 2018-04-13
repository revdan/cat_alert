defmodule CatAlert.CatAPI do
  require Logger

  alias CatAlert.CatService

  @connection Application.get_env(:cat_alert, :api_service)
  @base_url "https://www.battersea.org.uk"
  @cat_url  "/api/animals/cats"

  def get(type) do
    response = @connection.get!(@cat_url)

    process_cats(response.body, type)
  end

  defp process_cats(%{"animals" => cats}, type) do
    cats
    |> Enum.map(&Task.async(fn -> process_cat(&1, type) end))
    |> Enum.map(&Task.await/1)
  end

  defp process_cats(body, unknown) do
    Logger.info "UNKNOWN ACTION: #{inspect unknown}\n#{inspect body}"
  end

  defp process_cat({_, cat}, type) do
    cat
    |> cat_params()
    |> CatService.process_cat(type)
  end

  defp cat_params(cat) do
    %{
      name: cat["title"],
      nid: cat["nid"],
      url: @base_url <> cat["path"],
      thumb_url: cat["field_animal_thumbnail"],
      dob: cat["field_animal_age"],
      location: cat["field_animal_centre"],
      date_published: cat["field_animal_date_published"],
      size: cat["field_animal_size"],
      breed: cat["field_animal_breed"],
      sex: cat["field_animal_sex"],
      child_suitability: cat["field_animal_child_suitability"],
      cat_suitability: cat["field_animal_cat_suitability"],
      dog_suitability: cat["field_animal_dog_suitability"],
      reserved: cat["field_animal_reserved"],
      rehomed: cat["field_animal_homed"],
      flagged: to_string(cat["flagged"])
    }
  end
end
