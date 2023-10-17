defmodule TsbankWeb.UserJSON do
  alias Tsbank.Users.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      email: user.email,
      password: user.password,
      isActive: user.isActive,
      lastLoginDate: user.lastLoginDate
    }
  end

  def showD(%{user: user, token: token}) do
    %{
      id: user.id,
      email: user.email,
      token: token
    }
  end
end
