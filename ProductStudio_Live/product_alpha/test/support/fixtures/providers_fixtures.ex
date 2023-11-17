defmodule ProductAlpha.ProvidersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Providers` context.
  """

  @doc """
  Generate a provider.
  """
  def provider_fixture(attrs \\ %{}) do
    {:ok, provider} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Providers.create_provider()

    provider
  end
end
