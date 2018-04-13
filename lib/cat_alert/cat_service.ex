defmodule CatAlert.CatService do
  require Logger

  alias CatAlert.{Cat, Repo, Notifier}

  def process_cat(params, :find_new_cats) do
    case insert_cat(params) do
      {:ok, new_cat} ->
        Notifier.notify(new_cat)

        {:ok, new_cat}
      error ->
        error
    end
  end

  def process_cat(params, :update_cats) do
    case update_cat(params) do
      {:ok, updated_cat} ->
        Logger.info("updated #{inspect updated_cat}")

        {:ok, updated_cat}
      error ->
        Logger.error("skipping update #{params.name} because:\n#{inspect error}")

        error
    end
  end

  defp insert_cat(params) do
    %Cat{}
    |> Cat.changeset(params)
    |> Repo.insert(on_conflict: :raise)
  end

  defp update_cat(params) do
    %Cat{}
    |> Cat.changeset(params)
    |> Repo.insert(on_conflict: :replace_all, conflict_target: [:nid])
  end
end
