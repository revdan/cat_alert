defmodule CatAlert.CatAPI do
  require Logger

  alias CatAlert.{Cat, Repo, Notifier}

  @base_url "https://www.battersea.org.uk"
  @api_url "#{@base_url}/api/animals/cats"

  def get(type) do
    {:ok, response} =
      HTTPoison.get(@api_url,
        [], [ssl: [{:versions, [:'tlsv1.2']}]])

    process_response_body(type, response.body)
  end

  def process_response_body(:find_new_cats, body) do
    response = Poison.decode!(body)

    outstanding_ids =
      response["animals"]
      |> new_ids()
      |> outstanding(existing_ids())

    # TODO async
    Enum.each(response["animals"], &(process_cat(outstanding_ids, &1)))
  end

  def process_response_body(:update_cats, body) do
    response = Poison.decode!(body)

    # TODO async
    Enum.each(response["animals"], &update_cat/1)
  end

  def process_response_body(unknown, body) do
    Logger.info "UNKNOWN ACTION: #{inspect unknown}\n#{inspect body}"
  end

  defp new_ids(cats) do
    Enum.map(cats, fn({_, cat}) -> cat["nid"] end)
  end

  defp existing_ids do
    Cat
    |> Repo.all
    |> Enum.map(&(&1.nid))
  end

  defp outstanding(new, old) do
    new -- old
  end

  defp process_cat(ids, {_, cat}) do
    case cat["nid"] in ids do
      true  -> register_new_cat(cat)
      false -> Logger.info "skipping #{cat["title"]}"
    end
  end

  defp update_cat({_, cat}) do
    params = %{
      url: @base_url <> cat["path"],
      thumb_url: cat["field_animal_thumbnail"],
      dob: cat["field_animal_age"],
      location: cat["field_animal_centre"],
      date_published: cat["field_animal_date_published"],
      reserved: cat["field_animal_reserved"],
      rehomed: cat["field_animal_homed"],
      flagged: to_string(cat["flagged"])
    }

    #TODO upsert
    current_cat = Repo.get_by(Cat, nid: cat["nid"])

    insert_cat(current_cat, params)
  end

  defp register_new_cat(cat) do
    params = %{
      name: cat["title"],
      nid: cat["nid"],
      url: @base_url <>  cat["path"],
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

    Logger.info "WELCOME #{cat["title"]}!"

    {:ok, new_cat} = insert_cat(%Cat{}, params)

    Notifier.notify(new_cat)

    {:ok, new_cat}
  end

  defp insert_cat(cat, params) do
    cat
    |> Cat.changeset(params)
    |> Repo.insert
  end
end
