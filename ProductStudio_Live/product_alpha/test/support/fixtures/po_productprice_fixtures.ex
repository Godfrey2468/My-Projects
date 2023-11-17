defmodule ProductAlpha.PoProductpriceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.PoProductprice` context.
  """

  @doc """
  Generate a wallet.
  """
  def wallet_fixture(attrs \\ %{}) do
    {:ok, wallet} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.PoProductprice.create_wallet()

    wallet
  end
end
