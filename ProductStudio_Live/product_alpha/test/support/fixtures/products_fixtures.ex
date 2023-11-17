defmodule ProductAlpha.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Products` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        currency_id: "some currency_id",
        name: "some name",
        order: "some order"
      })
      |> ProductAlpha.Products.create_product()

    product
  end
end
