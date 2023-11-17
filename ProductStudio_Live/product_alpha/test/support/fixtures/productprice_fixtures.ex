defmodule ProductAlpha.ProductpriceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Productprice` context.
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
      |> ProductAlpha.Productprice.create_wallet()

    wallet
  end

  @doc """
  Generate a baseprice.
  """
  def baseprice_fixture(attrs \\ %{}) do
    {:ok, baseprice} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Productprice.create_baseprice()

    baseprice
  end

  @doc """
  Generate a subscription.
  """
  def subscription_fixture(attrs \\ %{}) do
    {:ok, subscription} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Productprice.create_subscription()

    subscription
  end

  @doc """
  Generate a discount.
  """
  def discount_fixture(attrs \\ %{}) do
    {:ok, discount} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Productprice.create_discount()

    discount
  end

  @doc """
  Generate a consumption.
  """
  def consumption_fixture(attrs \\ %{}) do
    {:ok, consumption} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Productprice.create_consumption()

    consumption
  end
end
