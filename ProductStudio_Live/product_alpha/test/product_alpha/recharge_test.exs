defmodule ProductAlpha.RechargeTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Recharge

  describe "defaultrecs" do
    alias ProductAlpha.Recharge.Defaultrec

    import ProductAlpha.RechargeFixtures

    @invalid_attrs %{datab: nil}

    test "list_defaultrecs/0 returns all defaultrecs" do
      defaultrec = defaultrec_fixture()
      assert Recharge.list_defaultrecs() == [defaultrec]
    end

    test "get_defaultrec!/1 returns the defaultrec with given id" do
      defaultrec = defaultrec_fixture()
      assert Recharge.get_defaultrec!(defaultrec.id) == defaultrec
    end

    test "create_defaultrec/1 with valid data creates a defaultrec" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Defaultrec{} = defaultrec} = Recharge.create_defaultrec(valid_attrs)
      assert defaultrec.datab == %{}
    end

    test "create_defaultrec/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recharge.create_defaultrec(@invalid_attrs)
    end

    test "update_defaultrec/2 with valid data updates the defaultrec" do
      defaultrec = defaultrec_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Defaultrec{} = defaultrec} = Recharge.update_defaultrec(defaultrec, update_attrs)
      assert defaultrec.datab == %{}
    end

    test "update_defaultrec/2 with invalid data returns error changeset" do
      defaultrec = defaultrec_fixture()
      assert {:error, %Ecto.Changeset{}} = Recharge.update_defaultrec(defaultrec, @invalid_attrs)
      assert defaultrec == Recharge.get_defaultrec!(defaultrec.id)
    end

    test "delete_defaultrec/1 deletes the defaultrec" do
      defaultrec = defaultrec_fixture()
      assert {:ok, %Defaultrec{}} = Recharge.delete_defaultrec(defaultrec)
      assert_raise Ecto.NoResultsError, fn -> Recharge.get_defaultrec!(defaultrec.id) end
    end

    test "change_defaultrec/1 returns a defaultrec changeset" do
      defaultrec = defaultrec_fixture()
      assert %Ecto.Changeset{} = Recharge.change_defaultrec(defaultrec)
    end
  end

  describe "smsmaps" do
    alias ProductAlpha.Recharge.Smsmap

    import ProductAlpha.RechargeFixtures

    @invalid_attrs %{datab: nil}

    test "list_smsmaps/0 returns all smsmaps" do
      smsmap = smsmap_fixture()
      assert Recharge.list_smsmaps() == [smsmap]
    end

    test "get_smsmap!/1 returns the smsmap with given id" do
      smsmap = smsmap_fixture()
      assert Recharge.get_smsmap!(smsmap.id) == smsmap
    end

    test "create_smsmap/1 with valid data creates a smsmap" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Smsmap{} = smsmap} = Recharge.create_smsmap(valid_attrs)
      assert smsmap.datab == %{}
    end

    test "create_smsmap/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recharge.create_smsmap(@invalid_attrs)
    end

    test "update_smsmap/2 with valid data updates the smsmap" do
      smsmap = smsmap_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Smsmap{} = smsmap} = Recharge.update_smsmap(smsmap, update_attrs)
      assert smsmap.datab == %{}
    end

    test "update_smsmap/2 with invalid data returns error changeset" do
      smsmap = smsmap_fixture()
      assert {:error, %Ecto.Changeset{}} = Recharge.update_smsmap(smsmap, @invalid_attrs)
      assert smsmap == Recharge.get_smsmap!(smsmap.id)
    end

    test "delete_smsmap/1 deletes the smsmap" do
      smsmap = smsmap_fixture()
      assert {:ok, %Smsmap{}} = Recharge.delete_smsmap(smsmap)
      assert_raise Ecto.NoResultsError, fn -> Recharge.get_smsmap!(smsmap.id) end
    end

    test "change_smsmap/1 returns a smsmap changeset" do
      smsmap = smsmap_fixture()
      assert %Ecto.Changeset{} = Recharge.change_smsmap(smsmap)
    end
  end

  describe "datamaps" do
    alias ProductAlpha.Recharge.Datamap

    import ProductAlpha.RechargeFixtures

    @invalid_attrs %{datab: nil}

    test "list_datamaps/0 returns all datamaps" do
      datamap = datamap_fixture()
      assert Recharge.list_datamaps() == [datamap]
    end

    test "get_datamap!/1 returns the datamap with given id" do
      datamap = datamap_fixture()
      assert Recharge.get_datamap!(datamap.id) == datamap
    end

    test "create_datamap/1 with valid data creates a datamap" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Datamap{} = datamap} = Recharge.create_datamap(valid_attrs)
      assert datamap.datab == %{}
    end

    test "create_datamap/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recharge.create_datamap(@invalid_attrs)
    end

    test "update_datamap/2 with valid data updates the datamap" do
      datamap = datamap_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Datamap{} = datamap} = Recharge.update_datamap(datamap, update_attrs)
      assert datamap.datab == %{}
    end

    test "update_datamap/2 with invalid data returns error changeset" do
      datamap = datamap_fixture()
      assert {:error, %Ecto.Changeset{}} = Recharge.update_datamap(datamap, @invalid_attrs)
      assert datamap == Recharge.get_datamap!(datamap.id)
    end

    test "delete_datamap/1 deletes the datamap" do
      datamap = datamap_fixture()
      assert {:ok, %Datamap{}} = Recharge.delete_datamap(datamap)
      assert_raise Ecto.NoResultsError, fn -> Recharge.get_datamap!(datamap.id) end
    end

    test "change_datamap/1 returns a datamap changeset" do
      datamap = datamap_fixture()
      assert %Ecto.Changeset{} = Recharge.change_datamap(datamap)
    end
  end

  describe "voicemaps" do
    alias ProductAlpha.Recharge.Voicemap

    import ProductAlpha.RechargeFixtures

    @invalid_attrs %{datab: nil}

    test "list_voicemaps/0 returns all voicemaps" do
      voicemap = voicemap_fixture()
      assert Recharge.list_voicemaps() == [voicemap]
    end

    test "get_voicemap!/1 returns the voicemap with given id" do
      voicemap = voicemap_fixture()
      assert Recharge.get_voicemap!(voicemap.id) == voicemap
    end

    test "create_voicemap/1 with valid data creates a voicemap" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Voicemap{} = voicemap} = Recharge.create_voicemap(valid_attrs)
      assert voicemap.datab == %{}
    end

    test "create_voicemap/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recharge.create_voicemap(@invalid_attrs)
    end

    test "update_voicemap/2 with valid data updates the voicemap" do
      voicemap = voicemap_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Voicemap{} = voicemap} = Recharge.update_voicemap(voicemap, update_attrs)
      assert voicemap.datab == %{}
    end

    test "update_voicemap/2 with invalid data returns error changeset" do
      voicemap = voicemap_fixture()
      assert {:error, %Ecto.Changeset{}} = Recharge.update_voicemap(voicemap, @invalid_attrs)
      assert voicemap == Recharge.get_voicemap!(voicemap.id)
    end

    test "delete_voicemap/1 deletes the voicemap" do
      voicemap = voicemap_fixture()
      assert {:ok, %Voicemap{}} = Recharge.delete_voicemap(voicemap)
      assert_raise Ecto.NoResultsError, fn -> Recharge.get_voicemap!(voicemap.id) end
    end

    test "change_voicemap/1 returns a voicemap changeset" do
      voicemap = voicemap_fixture()
      assert %Ecto.Changeset{} = Recharge.change_voicemap(voicemap)
    end
  end

  describe "defaultmaps" do
    alias ProductAlpha.Recharge.Defaultmap

    import ProductAlpha.RechargeFixtures

    @invalid_attrs %{datab: nil}

    test "list_defaultmaps/0 returns all defaultmaps" do
      defaultmap = defaultmap_fixture()
      assert Recharge.list_defaultmaps() == [defaultmap]
    end

    test "get_defaultmap!/1 returns the defaultmap with given id" do
      defaultmap = defaultmap_fixture()
      assert Recharge.get_defaultmap!(defaultmap.id) == defaultmap
    end

    test "create_defaultmap/1 with valid data creates a defaultmap" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Defaultmap{} = defaultmap} = Recharge.create_defaultmap(valid_attrs)
      assert defaultmap.datab == %{}
    end

    test "create_defaultmap/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Recharge.create_defaultmap(@invalid_attrs)
    end

    test "update_defaultmap/2 with valid data updates the defaultmap" do
      defaultmap = defaultmap_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Defaultmap{} = defaultmap} = Recharge.update_defaultmap(defaultmap, update_attrs)
      assert defaultmap.datab == %{}
    end

    test "update_defaultmap/2 with invalid data returns error changeset" do
      defaultmap = defaultmap_fixture()
      assert {:error, %Ecto.Changeset{}} = Recharge.update_defaultmap(defaultmap, @invalid_attrs)
      assert defaultmap == Recharge.get_defaultmap!(defaultmap.id)
    end

    test "delete_defaultmap/1 deletes the defaultmap" do
      defaultmap = defaultmap_fixture()
      assert {:ok, %Defaultmap{}} = Recharge.delete_defaultmap(defaultmap)
      assert_raise Ecto.NoResultsError, fn -> Recharge.get_defaultmap!(defaultmap.id) end
    end

    test "change_defaultmap/1 returns a defaultmap changeset" do
      defaultmap = defaultmap_fixture()
      assert %Ecto.Changeset{} = Recharge.change_defaultmap(defaultmap)
    end
  end
end
