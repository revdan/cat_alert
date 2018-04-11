defmodule CatAlert.Repo.Migrations.CreateCats do
  use Ecto.Migration

  def change do
    create table(:cats) do
      add :name, :string
      add :nid, :integer
      add :thumb_url, :string
      add :dob, :string
      add :location, :string
      add :date_published, :date
      add :size, :string
      add :breed, :string
      add :sex, :string
      add :child_suitability, :string
      add :cat_suitability, :string
      add :dog_suitability, :string
      add :url, :string
      add :reserved, :string
      add :rehomed, :string
      add :flagged, :string

      timestamps()
    end

  end
end
