defmodule ProductAlpha.RechargeFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Recharge` context.
  """

  @doc """
  Generate a defaultrec.
  """
  def defaultrec_fixture(attrs \\ %{}) do
    {:ok, defaultrec} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Recharge.create_defaultrec()

    defaultrec
  end

  @doc """
  Generate a smsmap.
  """
  def smsmap_fixture(attrs \\ %{}) do
    {:ok, smsmap} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Recharge.create_smsmap()

    smsmap
  end

  @doc """
  Generate a datamap.
  """
  def datamap_fixture(attrs \\ %{}) do
    {:ok, datamap} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Recharge.create_datamap()

    datamap
  end

  @doc """
  Generate a voicemap.
  """
  def voicemap_fixture(attrs \\ %{}) do
    {:ok, voicemap} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Recharge.create_voicemap()

    voicemap
  end

  @doc """
  Generate a defaultmap.
  """
  def defaultmap_fixture(attrs \\ %{}) do
    {:ok, defaultmap} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Recharge.create_defaultmap()

    defaultmap
  end
end
