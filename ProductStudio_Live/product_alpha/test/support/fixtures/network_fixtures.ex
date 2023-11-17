defmodule ProductAlpha.NetworkFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Network` context.
  """

  @doc """
  Generate a specification.
  """
  def specification_fixture(attrs \\ %{}) do
    {:ok, specification} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Network.create_specification()

    specification
  end

  @doc """
  Generate a notification.
  """
  def notification_fixture(attrs \\ %{}) do
    {:ok, notification} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Network.create_notification()

    notification
  end

  @doc """
  Generate a resource.
  """
  def resource_fixture(attrs \\ %{}) do
    {:ok, resource} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Network.create_resource()

    resource
  end
end
