defmodule ProductStudio.ProductionssFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductStudio.Productionss` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        description: "some description",
        price: "120.5",
        stock: 42,
        title: "some title"
      })
      |> ProductStudio.Productionss.create_product()

    product
  end
end
