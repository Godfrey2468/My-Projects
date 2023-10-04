defmodule ProductStudio.ProductionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductStudio.Productions` context.
  """

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> ProductStudio.Productions.create_product()

    product
  end
end
