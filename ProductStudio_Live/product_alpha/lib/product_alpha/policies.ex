defmodule ProductAlpha.Policies do
  @moduledoc """
  The Policies context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Policies.Policy

  @doc """
  Returns the list of policies.

  ## Examples

      iex> list_policies()
      [%Policy{}, ...]

  """
  def list_policies do
    Repo.all(Policy)
  end

  @doc """
  Gets a single policy.

  Raises `Ecto.NoResultsError` if the Policy does not exist.

  ## Examples

      iex> get_policy!(123)
      %Policy{}

      iex> get_policy!(456)
      ** (Ecto.NoResultsError)

  """
  def get_policy!(id), do: Repo.get!(Policy, id)

  @doc """
  Creates a policy.

  ## Examples

      iex> create_policy(%{field: value})
      {:ok, %Policy{}}

      iex> create_policy(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_policy(attrs \\ %{}) do
    %Policy{}
    |> Policy.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a policy.

  ## Examples

      iex> update_policy(policy, %{field: new_value})
      {:ok, %Policy{}}

      iex> update_policy(policy, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_policy(%Policy{} = policy, attrs) do
    policy
    |> Policy.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a policy.

  ## Examples

      iex> delete_policy(policy)
      {:ok, %Policy{}}

      iex> delete_policy(policy)
      {:error, %Ecto.Changeset{}}

  """
  def delete_policy(%Policy{} = policy) do
    Repo.delete(policy)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking policy changes.

  ## Examples

      iex> change_policy(policy)
      %Ecto.Changeset{data: %Policy{}}

  """
  def change_policy(%Policy{} = policy, attrs \\ %{}) do
    Policy.changeset(policy, attrs)
  end

  alias ProductAlpha.Policies.Threshold

  @doc """
  Returns the list of thresholdss.

  ## Examples

      iex> list_thresholdss()
      [%Threshold{}, ...]

  """
  def list_thresholdss do
    Repo.all(Threshold)
  end

  @doc """
  Gets a single threshold.

  Raises `Ecto.NoResultsError` if the Threshold does not exist.

  ## Examples

      iex> get_threshold!(123)
      %Threshold{}

      iex> get_threshold!(456)
      ** (Ecto.NoResultsError)

  """
  def get_threshold!(id), do: Repo.get!(Threshold, id)

  @doc """
  Creates a threshold.

  ## Examples

      iex> create_threshold(%{field: value})
      {:ok, %Threshold{}}

      iex> create_threshold(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_threshold(product, attrs \\ %{}) do
   # %Threshold{}
    product
    |> Ecto.build_assoc(:threshold)
    |> Threshold.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a threshold.

  ## Examples

      iex> update_threshold(threshold, %{field: new_value})
      {:ok, %Threshold{}}

      iex> update_threshold(threshold, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_threshold(%Threshold{} = threshold, attrs) do
    threshold
    |> Threshold.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a threshold.

  ## Examples

      iex> delete_threshold(threshold)
      {:ok, %Threshold{}}

      iex> delete_threshold(threshold)
      {:error, %Ecto.Changeset{}}

  """
  def delete_threshold(%Threshold{} = threshold) do
    Repo.delete(threshold)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking threshold changes.

  ## Examples

      iex> change_threshold(threshold)
      %Ecto.Changeset{data: %Threshold{}}

  """
  def change_threshold(%Threshold{} = threshold, attrs \\ %{}) do
    Threshold.changeset(threshold, attrs)
  end

  alias ProductAlpha.Policies.Trigger

  @doc """
  Returns the list of triggers.

  ## Examples

      iex> list_triggers()
      [%Trigger{}, ...]

  """
  def list_triggers do
    Repo.all(Trigger)
  end

  @doc """
  Gets a single trigger.

  Raises `Ecto.NoResultsError` if the Trigger does not exist.

  ## Examples

      iex> get_trigger!(123)
      %Trigger{}

      iex> get_trigger!(456)
      ** (Ecto.NoResultsError)

  """
  def get_trigger!(id), do: Repo.get!(Trigger, id)

  @doc """
  Creates a trigger.

  ## Examples

      iex> create_trigger(%{field: value})
      {:ok, %Trigger{}}

      iex> create_trigger(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_trigger(attrs \\ %{}) do
    %Trigger{}
    |> Trigger.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a trigger.

  ## Examples

      iex> update_trigger(trigger, %{field: new_value})
      {:ok, %Trigger{}}

      iex> update_trigger(trigger, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_trigger(%Trigger{} = trigger, attrs) do
    trigger
    |> Trigger.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a trigger.

  ## Examples

      iex> delete_trigger(trigger)
      {:ok, %Trigger{}}

      iex> delete_trigger(trigger)
      {:error, %Ecto.Changeset{}}

  """
  def delete_trigger(%Trigger{} = trigger) do
    Repo.delete(trigger)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking trigger changes.

  ## Examples

      iex> change_trigger(trigger)
      %Ecto.Changeset{data: %Trigger{}}

  """
  def change_trigger(%Trigger{} = trigger, attrs \\ %{}) do
    Trigger.changeset(trigger, attrs)
  end

  alias ProductAlpha.Policies.Policystate

  @doc """
  Returns the list of policystates.

  ## Examples

      iex> list_policystates()
      [%Policystate{}, ...]

  """
  def list_policystates do
    Repo.all(Policystate)
  end

  @doc """
  Gets a single policystate.

  Raises `Ecto.NoResultsError` if the Policystate does not exist.

  ## Examples

      iex> get_policystate!(123)
      %Policystate{}

      iex> get_policystate!(456)
      ** (Ecto.NoResultsError)

  """
  def get_policystate!(id), do: Repo.get!(Policystate, id)

  @doc """
  Creates a policystate.

  ## Examples

      iex> create_policystate(%{field: value})
      {:ok, %Policystate{}}

      iex> create_policystate(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_policystate(attrs \\ %{}) do
    %Policystate{}
    |> Policystate.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a policystate.

  ## Examples

      iex> update_policystate(policystate, %{field: new_value})
      {:ok, %Policystate{}}

      iex> update_policystate(policystate, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_policystate(%Policystate{} = policystate, attrs) do
    policystate
    |> Policystate.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a policystate.

  ## Examples

      iex> delete_policystate(policystate)
      {:ok, %Policystate{}}

      iex> delete_policystate(policystate)
      {:error, %Ecto.Changeset{}}

  """
  def delete_policystate(%Policystate{} = policystate) do
    Repo.delete(policystate)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking policystate changes.

  ## Examples

      iex> change_policystate(policystate)
      %Ecto.Changeset{data: %Policystate{}}

  """
  def change_policystate(%Policystate{} = policystate, attrs \\ %{}) do
    Policystate.changeset(policystate, attrs)
  end

  alias ProductAlpha.Policies.Intialservice

  @doc """
  Returns the list of intialservices.

  ## Examples

      iex> list_intialservices()
      [%Intialservice{}, ...]

  """
  def list_intialservices do
    Repo.all(Intialservice)
  end

  @doc """
  Gets a single intialservice.

  Raises `Ecto.NoResultsError` if the Intialservice does not exist.

  ## Examples

      iex> get_intialservice!(123)
      %Intialservice{}

      iex> get_intialservice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_intialservice!(id), do: Repo.get!(Intialservice, id)

  @doc """
  Creates a intialservice.

  ## Examples

      iex> create_intialservice(%{field: value})
      {:ok, %Intialservice{}}

      iex> create_intialservice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_intialservice(attrs \\ %{}) do
    %Intialservice{}
    |> Intialservice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a intialservice.

  ## Examples

      iex> update_intialservice(intialservice, %{field: new_value})
      {:ok, %Intialservice{}}

      iex> update_intialservice(intialservice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_intialservice(%Intialservice{} = intialservice, attrs) do
    intialservice
    |> Intialservice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a intialservice.

  ## Examples

      iex> delete_intialservice(intialservice)
      {:ok, %Intialservice{}}

      iex> delete_intialservice(intialservice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_intialservice(%Intialservice{} = intialservice) do
    Repo.delete(intialservice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking intialservice changes.

  ## Examples

      iex> change_intialservice(intialservice)
      %Ecto.Changeset{data: %Intialservice{}}

  """
  def change_intialservice(%Intialservice{} = intialservice, attrs \\ %{}) do
    Intialservice.changeset(intialservice, attrs)
  end
end
