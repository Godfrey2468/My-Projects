defmodule Tsbank.Staffs.Staff do
  use Ecto.Schema
  import Ecto.Changeset

  schema "staffs" do
    field :moreinfo, :string

    timestamps()
  end

  @doc false
  def changeset(staff, attrs) do
    staff
    |> cast(attrs, [:moreinfo])
    |> validate_required([:moreinfo])
  end
end
