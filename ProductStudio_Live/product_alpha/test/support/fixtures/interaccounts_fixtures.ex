defmodule ProductAlpha.InteraccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Interaccounts` context.
  """

  @doc """
  Generate a interaccount.
  """
  def interaccount_fixture(attrs \\ %{}) do
    {:ok, interaccount} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Interaccounts.create_interaccount()

    interaccount
  end
end
