defmodule Tsbank.StaffsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Tsbank.Staffs` context.
  """

  @doc """
  Generate a staff.
  """
  def staff_fixture(attrs \\ %{}) do
    {:ok, staff} =
      attrs
      |> Enum.into(%{
        moreinfo: "some moreinfo"
      })
      |> Tsbank.Staffs.create_staff()

    staff
  end
end
