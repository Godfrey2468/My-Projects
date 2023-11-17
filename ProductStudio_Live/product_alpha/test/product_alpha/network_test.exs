defmodule ProductAlpha.NetworkTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Network

  describe "specifications" do
    alias ProductAlpha.Network.Specification

    import ProductAlpha.NetworkFixtures

    @invalid_attrs %{datab: nil}

    test "list_specifications/0 returns all specifications" do
      specification = specification_fixture()
      assert Network.list_specifications() == [specification]
    end

    test "get_specification!/1 returns the specification with given id" do
      specification = specification_fixture()
      assert Network.get_specification!(specification.id) == specification
    end

    test "create_specification/1 with valid data creates a specification" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Specification{} = specification} = Network.create_specification(valid_attrs)
      assert specification.datab == %{}
    end

    test "create_specification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Network.create_specification(@invalid_attrs)
    end

    test "update_specification/2 with valid data updates the specification" do
      specification = specification_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Specification{} = specification} = Network.update_specification(specification, update_attrs)
      assert specification.datab == %{}
    end

    test "update_specification/2 with invalid data returns error changeset" do
      specification = specification_fixture()
      assert {:error, %Ecto.Changeset{}} = Network.update_specification(specification, @invalid_attrs)
      assert specification == Network.get_specification!(specification.id)
    end

    test "delete_specification/1 deletes the specification" do
      specification = specification_fixture()
      assert {:ok, %Specification{}} = Network.delete_specification(specification)
      assert_raise Ecto.NoResultsError, fn -> Network.get_specification!(specification.id) end
    end

    test "change_specification/1 returns a specification changeset" do
      specification = specification_fixture()
      assert %Ecto.Changeset{} = Network.change_specification(specification)
    end
  end

  describe "notifications" do
    alias ProductAlpha.Network.Notification

    import ProductAlpha.NetworkFixtures

    @invalid_attrs %{datab: nil}

    test "list_notifications/0 returns all notifications" do
      notification = notification_fixture()
      assert Network.list_notifications() == [notification]
    end

    test "get_notification!/1 returns the notification with given id" do
      notification = notification_fixture()
      assert Network.get_notification!(notification.id) == notification
    end

    test "create_notification/1 with valid data creates a notification" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Notification{} = notification} = Network.create_notification(valid_attrs)
      assert notification.datab == %{}
    end

    test "create_notification/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Network.create_notification(@invalid_attrs)
    end

    test "update_notification/2 with valid data updates the notification" do
      notification = notification_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Notification{} = notification} = Network.update_notification(notification, update_attrs)
      assert notification.datab == %{}
    end

    test "update_notification/2 with invalid data returns error changeset" do
      notification = notification_fixture()
      assert {:error, %Ecto.Changeset{}} = Network.update_notification(notification, @invalid_attrs)
      assert notification == Network.get_notification!(notification.id)
    end

    test "delete_notification/1 deletes the notification" do
      notification = notification_fixture()
      assert {:ok, %Notification{}} = Network.delete_notification(notification)
      assert_raise Ecto.NoResultsError, fn -> Network.get_notification!(notification.id) end
    end

    test "change_notification/1 returns a notification changeset" do
      notification = notification_fixture()
      assert %Ecto.Changeset{} = Network.change_notification(notification)
    end
  end

  describe "resources" do
    alias ProductAlpha.Network.Resource

    import ProductAlpha.NetworkFixtures

    @invalid_attrs %{datab: nil}

    test "list_resources/0 returns all resources" do
      resource = resource_fixture()
      assert Network.list_resources() == [resource]
    end

    test "get_resource!/1 returns the resource with given id" do
      resource = resource_fixture()
      assert Network.get_resource!(resource.id) == resource
    end

    test "create_resource/1 with valid data creates a resource" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Resource{} = resource} = Network.create_resource(valid_attrs)
      assert resource.datab == %{}
    end

    test "create_resource/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Network.create_resource(@invalid_attrs)
    end

    test "update_resource/2 with valid data updates the resource" do
      resource = resource_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Resource{} = resource} = Network.update_resource(resource, update_attrs)
      assert resource.datab == %{}
    end

    test "update_resource/2 with invalid data returns error changeset" do
      resource = resource_fixture()
      assert {:error, %Ecto.Changeset{}} = Network.update_resource(resource, @invalid_attrs)
      assert resource == Network.get_resource!(resource.id)
    end

    test "delete_resource/1 deletes the resource" do
      resource = resource_fixture()
      assert {:ok, %Resource{}} = Network.delete_resource(resource)
      assert_raise Ecto.NoResultsError, fn -> Network.get_resource!(resource.id) end
    end

    test "change_resource/1 returns a resource changeset" do
      resource = resource_fixture()
      assert %Ecto.Changeset{} = Network.change_resource(resource)
    end
  end
end
