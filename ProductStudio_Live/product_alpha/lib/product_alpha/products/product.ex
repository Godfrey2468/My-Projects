defmodule ProductAlpha.Products.Product do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "products" do
    field :currency_id, :string
    field :name, :string
    field :order, :string
    has_many :provider, ProductAlpha.Providers.Provider
    has_many :interaccount, ProductAlpha.Interaccounts.Interaccount
    has_many :threshold, ProductAlpha.Policies.Threshold
    has_many :trigger, ProductAlpha.Policies.Trigger
    has_many :policystate, ProductAlpha.Policies.Policystate
    has_many :intialservice, ProductAlpha.Policies.Intialservice
    has_many :subscription, ProductAlpha.Productprice.Subscription
    has_many :baseprice,ProductAlpha.Productprice.Baseprice
    has_many :consumption,ProductAlpha.Productprice.Consumption
    has_many :discount, ProductAlpha.Productprice.Discount
    has_many :wallet, ProductAlpha.Productprice.Wallet
    has_many :notification, ProductAlpha.Network.Notification
    has_many :specification, ProductAlpha.Network.Specification
    has_many :resource, ProductAlpha.Network.Resource
    has_many :datamap, ProductAlpha.Recharge.Datamap
    has_many :defaultmap, ProductAlpha.Recharge.Defaultmap
    has_many :defaultrec, ProductAlpha.Recharge.Defaultrec
    has_many :smsmap, ProductAlpha.Recharge.Smsmap
    has_many :voicemap, ProductAlpha.Recharge.Voicemap

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :order, :currency_id])
    |> validate_required([:name, :order, :currency_id])
  end
end
