defmodule ProductAlpha.ServiceproviderFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Serviceprovider` context.
  """

  @doc """
  Generate a serviceproviders.
  """
  def serviceproviders_fixture(attrs \\ %{}) do
    {:ok, serviceproviders} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Serviceprovider.create_serviceproviders()

    serviceproviders
  end
end
