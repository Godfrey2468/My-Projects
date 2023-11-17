defmodule ProductAlpha.ServiceproviderTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Serviceprovider

  describe "serviceprovides" do
    alias ProductAlpha.Serviceprovider.Serviceproviders

    import ProductAlpha.ServiceproviderFixtures

    @invalid_attrs %{datab: nil}

    test "list_serviceprovides/0 returns all serviceprovides" do
      serviceproviders = serviceproviders_fixture()
      assert Serviceprovider.list_serviceprovides() == [serviceproviders]
    end

    test "get_serviceproviders!/1 returns the serviceproviders with given id" do
      serviceproviders = serviceproviders_fixture()
      assert Serviceprovider.get_serviceproviders!(serviceproviders.id) == serviceproviders
    end

    test "create_serviceproviders/1 with valid data creates a serviceproviders" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Serviceproviders{} = serviceproviders} = Serviceprovider.create_serviceproviders(valid_attrs)
      assert serviceproviders.datab == %{}
    end

    test "create_serviceproviders/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Serviceprovider.create_serviceproviders(@invalid_attrs)
    end

    test "update_serviceproviders/2 with valid data updates the serviceproviders" do
      serviceproviders = serviceproviders_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Serviceproviders{} = serviceproviders} = Serviceprovider.update_serviceproviders(serviceproviders, update_attrs)
      assert serviceproviders.datab == %{}
    end

    test "update_serviceproviders/2 with invalid data returns error changeset" do
      serviceproviders = serviceproviders_fixture()
      assert {:error, %Ecto.Changeset{}} = Serviceprovider.update_serviceproviders(serviceproviders, @invalid_attrs)
      assert serviceproviders == Serviceprovider.get_serviceproviders!(serviceproviders.id)
    end

    test "delete_serviceproviders/1 deletes the serviceproviders" do
      serviceproviders = serviceproviders_fixture()
      assert {:ok, %Serviceproviders{}} = Serviceprovider.delete_serviceproviders(serviceproviders)
      assert_raise Ecto.NoResultsError, fn -> Serviceprovider.get_serviceproviders!(serviceproviders.id) end
    end

    test "change_serviceproviders/1 returns a serviceproviders changeset" do
      serviceproviders = serviceproviders_fixture()
      assert %Ecto.Changeset{} = Serviceprovider.change_serviceproviders(serviceproviders)
    end
  end
end
