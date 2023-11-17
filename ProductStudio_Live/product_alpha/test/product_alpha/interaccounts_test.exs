defmodule ProductAlpha.InteraccountsTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Interaccounts

  describe "interaccounts" do
    alias ProductAlpha.Interaccounts.Interaccount

    import ProductAlpha.InteraccountsFixtures

    @invalid_attrs %{datab: nil}

    test "list_interaccounts/0 returns all interaccounts" do
      interaccount = interaccount_fixture()
      assert Interaccounts.list_interaccounts() == [interaccount]
    end

    test "get_interaccount!/1 returns the interaccount with given id" do
      interaccount = interaccount_fixture()
      assert Interaccounts.get_interaccount!(interaccount.id) == interaccount
    end

    test "create_interaccount/1 with valid data creates a interaccount" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Interaccount{} = interaccount} = Interaccounts.create_interaccount(valid_attrs)
      assert interaccount.datab == %{}
    end

    test "create_interaccount/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Interaccounts.create_interaccount(@invalid_attrs)
    end

    test "update_interaccount/2 with valid data updates the interaccount" do
      interaccount = interaccount_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Interaccount{} = interaccount} = Interaccounts.update_interaccount(interaccount, update_attrs)
      assert interaccount.datab == %{}
    end

    test "update_interaccount/2 with invalid data returns error changeset" do
      interaccount = interaccount_fixture()
      assert {:error, %Ecto.Changeset{}} = Interaccounts.update_interaccount(interaccount, @invalid_attrs)
      assert interaccount == Interaccounts.get_interaccount!(interaccount.id)
    end

    test "delete_interaccount/1 deletes the interaccount" do
      interaccount = interaccount_fixture()
      assert {:ok, %Interaccount{}} = Interaccounts.delete_interaccount(interaccount)
      assert_raise Ecto.NoResultsError, fn -> Interaccounts.get_interaccount!(interaccount.id) end
    end

    test "change_interaccount/1 returns a interaccount changeset" do
      interaccount = interaccount_fixture()
      assert %Ecto.Changeset{} = Interaccounts.change_interaccount(interaccount)
    end
  end
end
