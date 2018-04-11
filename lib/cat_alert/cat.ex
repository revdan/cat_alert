defmodule CatAlert.Cat do
  use Ecto.Schema
  import Ecto.Changeset
  alias CatAlert.Cat

  @cat_params ~w(
    name nid thumb_url dob location date_published
    dog_suitability child_suitability cat_suitability
    size breed sex url reserved rehomed flagged)a

  schema "cats" do
    field :breed, :string
    field :cat_suitability, :string
    field :child_suitability, :string
    field :date_published, :date
    field :dob, :string
    field :dog_suitability, :string
    field :flagged, :string
    field :location, :string
    field :name, :string
    field :nid, :integer
    field :rehomed, :string
    field :reserved, :string
    field :sex, :string
    field :size, :string
    field :thumb_url, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(%Cat{} = cat, attrs) do
    cat
    |> cast(attrs, @cat_params)
    |> unique_constraint(:nid)
    |> validate_required([:name, :nid])
  end
end
