defmodule ProductAlpha.Recharge.Smsmap do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "smsmaps" do
    field :datab, :map
    #field :product_id, :id
    belongs_to :product, ProductAlpha.Products.Product

    timestamps()
  end

  @doc false
  def changeset(smsmap, attrs) do
    smsmap
    |> cast(attrs, [:product_id,:datab])
    |> validate_required([:product_id,:datab])
  end
end
