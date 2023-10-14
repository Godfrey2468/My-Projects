defmodule Tsbank.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field :email, :string
    field :isActive, :boolean, default: false
    field :lastLoginDate, :naive_datetime
    field :password, :string
    has_many :customer, Tsbank.Customers.Customer

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :isActive, :lastLoginDate])
    |> validate_required([:email, :password])
    |> validate_format(:email, ~r/^[^\s]+@[^\s]+$/, message: "must have the @ sign and no spaces") # email validation
    |> validate_length(:email, max: 100) # 100 chracters
    |> unique_constraint(:email) # making our email to be unique
    |> put_password_hash()
  end

  defp put_password_hash(%Ecto.Changeset{valid?: true, changes: %{password: password}}  = changeset ) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  # if our changeset is not valid we just do this
  defp put_password_hash(changeset), do: changeset
end
