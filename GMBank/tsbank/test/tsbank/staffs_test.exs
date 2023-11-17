defmodule Tsbank.StaffsTest do
  use Tsbank.DataCase

  alias Tsbank.Staffs

  describe "staffs" do
    alias Tsbank.Staffs.Staff

    import Tsbank.StaffsFixtures

    @invalid_attrs %{moreinfo: nil}

    test "list_staffs/0 returns all staffs" do
      staff = staff_fixture()
      assert Staffs.list_staffs() == [staff]
    end

    test "get_staff!/1 returns the staff with given id" do
      staff = staff_fixture()
      assert Staffs.get_staff!(staff.id) == staff
    end

    test "create_staff/1 with valid data creates a staff" do
      valid_attrs = %{moreinfo: "some moreinfo"}

      assert {:ok, %Staff{} = staff} = Staffs.create_staff(valid_attrs)
      assert staff.moreinfo == "some moreinfo"
    end

    test "create_staff/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Staffs.create_staff(@invalid_attrs)
    end

    test "update_staff/2 with valid data updates the staff" do
      staff = staff_fixture()
      update_attrs = %{moreinfo: "some updated moreinfo"}

      assert {:ok, %Staff{} = staff} = Staffs.update_staff(staff, update_attrs)
      assert staff.moreinfo == "some updated moreinfo"
    end

    test "update_staff/2 with invalid data returns error changeset" do
      staff = staff_fixture()
      assert {:error, %Ecto.Changeset{}} = Staffs.update_staff(staff, @invalid_attrs)
      assert staff == Staffs.get_staff!(staff.id)
    end

    test "delete_staff/1 deletes the staff" do
      staff = staff_fixture()
      assert {:ok, %Staff{}} = Staffs.delete_staff(staff)
      assert_raise Ecto.NoResultsError, fn -> Staffs.get_staff!(staff.id) end
    end

    test "change_staff/1 returns a staff changeset" do
      staff = staff_fixture()
      assert %Ecto.Changeset{} = Staffs.change_staff(staff)
    end
  end
end
