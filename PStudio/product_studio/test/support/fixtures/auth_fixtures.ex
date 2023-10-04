defmodule ProductStudio.AuthFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductStudio.Auth` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password: "some password"
      })
      |> ProductStudio.Auth.create_user()

    user
  end

  @doc """
  Generate a session.
  """
  def session_fixture(attrs \\ %{}) do
    {:ok, session} =
      attrs
      |> Enum.into(%{
        new: "some new"
      })
      |> ProductStudio.Auth.create_session()

    session
  end
end
