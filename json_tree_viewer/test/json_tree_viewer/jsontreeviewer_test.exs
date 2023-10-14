defmodule JsonTreeViewer.JsontreeviewerTest do
  use JsonTreeViewer.DataCase

  alias JsonTreeViewer.Jsontreeviewer

  describe "json" do
    alias JsonTreeViewer.Jsontreeviewer.Json

    import JsonTreeViewer.JsontreeviewerFixtures

    @invalid_attrs %{jsondata: nil, jsons: nil}

    test "list_json/0 returns all json" do
      json = json_fixture()
      assert Jsontreeviewer.list_json() == [json]
    end

    test "get_json!/1 returns the json with given id" do
      json = json_fixture()
      assert Jsontreeviewer.get_json!(json.id) == json
    end

    test "create_json/1 with valid data creates a json" do
      valid_attrs = %{jsondata: "some jsondata", jsons: "some jsons"}

      assert {:ok, %Json{} = json} = Jsontreeviewer.create_json(valid_attrs)
      assert json.jsondata == "some jsondata"
      assert json.jsons == "some jsons"
    end

    test "create_json/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jsontreeviewer.create_json(@invalid_attrs)
    end

    test "update_json/2 with valid data updates the json" do
      json = json_fixture()
      update_attrs = %{jsondata: "some updated jsondata", jsons: "some updated jsons"}

      assert {:ok, %Json{} = json} = Jsontreeviewer.update_json(json, update_attrs)
      assert json.jsondata == "some updated jsondata"
      assert json.jsons == "some updated jsons"
    end

    test "update_json/2 with invalid data returns error changeset" do
      json = json_fixture()
      assert {:error, %Ecto.Changeset{}} = Jsontreeviewer.update_json(json, @invalid_attrs)
      assert json == Jsontreeviewer.get_json!(json.id)
    end

    test "delete_json/1 deletes the json" do
      json = json_fixture()
      assert {:ok, %Json{}} = Jsontreeviewer.delete_json(json)
      assert_raise Ecto.NoResultsError, fn -> Jsontreeviewer.get_json!(json.id) end
    end

    test "change_json/1 returns a json changeset" do
      json = json_fixture()
      assert %Ecto.Changeset{} = Jsontreeviewer.change_json(json)
    end
  end

  describe "jsons" do
    alias JsonTreeViewer.Jsontreeviewer.Json

    import JsonTreeViewer.JsontreeviewerFixtures

    @invalid_attrs %{}

    test "list_jsons/0 returns all jsons" do
      json = json_fixture()
      assert Jsontreeviewer.list_jsons() == [json]
    end

    test "get_json!/1 returns the json with given id" do
      json = json_fixture()
      assert Jsontreeviewer.get_json!(json.id) == json
    end

    test "create_json/1 with valid data creates a json" do
      valid_attrs = %{}

      assert {:ok, %Json{} = json} = Jsontreeviewer.create_json(valid_attrs)
    end

    test "create_json/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Jsontreeviewer.create_json(@invalid_attrs)
    end

    test "update_json/2 with valid data updates the json" do
      json = json_fixture()
      update_attrs = %{}

      assert {:ok, %Json{} = json} = Jsontreeviewer.update_json(json, update_attrs)
    end

    test "update_json/2 with invalid data returns error changeset" do
      json = json_fixture()
      assert {:error, %Ecto.Changeset{}} = Jsontreeviewer.update_json(json, @invalid_attrs)
      assert json == Jsontreeviewer.get_json!(json.id)
    end

    test "delete_json/1 deletes the json" do
      json = json_fixture()
      assert {:ok, %Json{}} = Jsontreeviewer.delete_json(json)
      assert_raise Ecto.NoResultsError, fn -> Jsontreeviewer.get_json!(json.id) end
    end

    test "change_json/1 returns a json changeset" do
      json = json_fixture()
      assert %Ecto.Changeset{} = Jsontreeviewer.change_json(json)
    end
  end
end
