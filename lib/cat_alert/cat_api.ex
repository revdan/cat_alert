defmodule CatAlert.CatAPI do
  require Logger

  alias CatAlert.{APIConnection, Cat, Repo, Notifier}

  @base_url "https://www.battersea.org.uk"
  @cat_url  "/api/animals/cats"

  def process_cats(type) do
    response = APIConnection.get!(@cat_url)

    process_cats(type, response.body)
  end

  def process_cats(type, %{"animals" => cats}) do
    Enum.each(cats, fn(cat) -> process_cat(type, cat) end)
  end

  def process_cats(unknown, body) do
    Logger.info "UNKNOWN ACTION: #{inspect unknown}\n#{inspect body}"
  end

  defp process_cat(type, {_, cat}) do
    cat
    |> cat_params
    |> try_write(type)
  end

  defp try_write(params, :find_new_cats) do
    case insert_cat(params) do
      {:ok, new_cat} ->
        Notifier.notify(new_cat)

        {:ok, new_cat}
      error ->
        Logger.error("skipping upsert #{params.name} because:\n#{inspect error}")
    end
  end

  defp try_write(params, :update_cats) do
    case update_cat(params) do
      {:ok, updated_cat} ->
        Logger.info("updated #{inspect updated_cat}")
      error ->
        Logger.error("skipping update #{params.name} because:\n#{inspect error}")
    end
  end

  defp try_write(unknown_type, params) do
    Logger.error("received #{unknown_type} with #{inspect params}")
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

  defp insert_cat(params) do
    %Cat{}
    |> Cat.changeset(params)
    |> Repo.insert(on_conflict: :raise)
  end

  defp update_cat(params) do
    %Cat{}
    |> Cat.changeset(params)
    |> Repo.insert(on_conflict: :replace_all,
                   conflict_target: [:nid])
  end
end
