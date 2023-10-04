defmodule ProductStudio.Productionss.Product do
  use Ecto.Schema
  import Ecto.Changeset

  schema "products" do
    field :description, :string
    field :price, :decimal
    field :stock, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:title, :price, :description, :stock])
    |> validate_required([:title, :price, :description, :stock])
  end
end
