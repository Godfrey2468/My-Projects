defmodule ProductStudio.Auth.Session do
  use Ecto.Schema
  import Ecto.Changeset

  schema "session" do
    field :new, :string

    timestamps()
  end

  @doc false
  def changeset(session, attrs) do
    session
    |> cast(attrs, [:new])
    |> validate_required([:new])
  end
end
