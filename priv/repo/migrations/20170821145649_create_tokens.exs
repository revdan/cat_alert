defmodule CatAlert.Repo.Migrations.CreateTokens do
  use Ecto.Migration

  def change do
    create table(:tokens) do
      add :uuid, :string, required: true
      add :email, :string, required: true
      add :expired, :boolean, default: false, null: false

      timestamps()
    end

  end
end
