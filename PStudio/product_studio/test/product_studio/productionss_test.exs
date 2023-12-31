defmodule ProductStudio.ProductionssTest do
  use ProductStudio.DataCase

  alias ProductStudio.Productionss

  describe "products" do
    alias ProductStudio.Productionss.Product

    import ProductStudio.ProductionssFixtures

    @invalid_attrs %{description: nil, price: nil, stock: nil, title: nil}

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Productionss.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Productionss.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      valid_attrs = %{description: "some description", price: "120.5", stock: 42, title: "some title"}

      assert {:ok, %Product{} = product} = Productionss.create_product(valid_attrs)
      assert product.description == "some description"
      assert product.price == Decimal.new("120.5")
      assert product.stock == 42
      assert product.title == "some title"
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productionss.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      update_attrs = %{description: "some updated description", price: "456.7", stock: 43, title: "some updated title"}

      assert {:ok, %Product{} = product} = Productionss.update_product(product, update_attrs)
      assert product.description == "some updated description"
      assert product.price == Decimal.new("456.7")
      assert product.stock == 43
      assert product.title == "some updated title"
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Productionss.update_product(product, @invalid_attrs)
      assert product == Productionss.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Productionss.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Productionss.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Productionss.change_product(product)
    end
  end
end
