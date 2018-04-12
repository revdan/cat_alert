defmodule CatAlert.Repo.Migrations.NidConstraint do
  use Ecto.Migration

  def change do
    create unique_index(:cats, [:nid])
  end
end
