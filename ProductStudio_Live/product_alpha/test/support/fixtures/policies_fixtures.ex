defmodule ProductAlpha.PoliciesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ProductAlpha.Policies` context.
  """

  @doc """
  Generate a policy.
  """
  def policy_fixture(attrs \\ %{}) do
    {:ok, policy} =
      attrs
      |> Enum.into(%{
        data: %{}
      })
      |> ProductAlpha.Policies.create_policy()

    policy
  end

  @doc """
  Generate a threshold.
  """
  def threshold_fixture(attrs \\ %{}) do
    {:ok, threshold} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Policies.create_threshold()

    threshold
  end

  @doc """
  Generate a trigger.
  """
  def trigger_fixture(attrs \\ %{}) do
    {:ok, trigger} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Policies.create_trigger()

    trigger
  end

  @doc """
  Generate a policystate.
  """
  def policystate_fixture(attrs \\ %{}) do
    {:ok, policystate} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Policies.create_policystate()

    policystate
  end

  @doc """
  Generate a intialservice.
  """
  def intialservice_fixture(attrs \\ %{}) do
    {:ok, intialservice} =
      attrs
      |> Enum.into(%{
        datab: %{}
      })
      |> ProductAlpha.Policies.create_intialservice()

    intialservice
  end
end
