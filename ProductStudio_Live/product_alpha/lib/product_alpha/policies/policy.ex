defmodule ProductAlpha.Policies.Policy do
  use Ecto.Schema
  import Ecto.Changeset

  schema "policies" do
    field :data, :map

    timestamps()
  end

  @doc false
  def changeset(policy, attrs) do
    policy
    |> cast(attrs, [:data])
    |> validate_required([:data])
  end
end
