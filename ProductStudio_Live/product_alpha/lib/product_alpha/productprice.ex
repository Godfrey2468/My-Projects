defmodule ProductAlpha.Productprice do
  @moduledoc """
  The Productprice context.
  """

  import Ecto.Query, warn: false
  alias ProductAlpha.Repo

  alias ProductAlpha.Productprice.Wallet

  @doc """
  Returns the list of wallets.

  ## Examples

      iex> list_wallets()
      [%Wallet{}, ...]

  """
  def list_wallets do
    Repo.all(Wallet)
  end

  @doc """
  Gets a single wallet.

  Raises `Ecto.NoResultsError` if the Wallet does not exist.

  ## Examples

      iex> get_wallet!(123)
      %Wallet{}

      iex> get_wallet!(456)
      ** (Ecto.NoResultsError)

  """
  def get_wallet!(id), do: Repo.get!(Wallet, id)

  @doc """
  Creates a wallet.

  ## Examples

      iex> create_wallet(%{field: value})
      {:ok, %Wallet{}}

      iex> create_wallet(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_wallet(attrs \\ %{}) do
    %Wallet{}
    |> Wallet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a wallet.

  ## Examples

      iex> update_wallet(wallet, %{field: new_value})
      {:ok, %Wallet{}}

      iex> update_wallet(wallet, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_wallet(%Wallet{} = wallet, attrs) do
    wallet
    |> Wallet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a wallet.

  ## Examples

      iex> delete_wallet(wallet)
      {:ok, %Wallet{}}

      iex> delete_wallet(wallet)
      {:error, %Ecto.Changeset{}}

  """
  def delete_wallet(%Wallet{} = wallet) do
    Repo.delete(wallet)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking wallet changes.

  ## Examples

      iex> change_wallet(wallet)
      %Ecto.Changeset{data: %Wallet{}}

  """
  def change_wallet(%Wallet{} = wallet, attrs \\ %{}) do
    Wallet.changeset(wallet, attrs)
  end

  alias ProductAlpha.Productprice.Baseprice

  @doc """
  Returns the list of baseprices.

  ## Examples

      iex> list_baseprices()
      [%Baseprice{}, ...]

  """
  def list_baseprices do
    Repo.all(Baseprice)
  end

  @doc """
  Gets a single baseprice.

  Raises `Ecto.NoResultsError` if the Baseprice does not exist.

  ## Examples

      iex> get_baseprice!(123)
      %Baseprice{}

      iex> get_baseprice!(456)
      ** (Ecto.NoResultsError)

  """
  def get_baseprice!(id), do: Repo.get!(Baseprice, id)

  @doc """
  Creates a baseprice.

  ## Examples

      iex> create_baseprice(%{field: value})
      {:ok, %Baseprice{}}

      iex> create_baseprice(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_baseprice(attrs \\ %{}) do
    %Baseprice{}
    |> Baseprice.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a baseprice.

  ## Examples

      iex> update_baseprice(baseprice, %{field: new_value})
      {:ok, %Baseprice{}}

      iex> update_baseprice(baseprice, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_baseprice(%Baseprice{} = baseprice, attrs) do
    baseprice
    |> Baseprice.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a baseprice.

  ## Examples

      iex> delete_baseprice(baseprice)
      {:ok, %Baseprice{}}

      iex> delete_baseprice(baseprice)
      {:error, %Ecto.Changeset{}}

  """
  def delete_baseprice(%Baseprice{} = baseprice) do
    Repo.delete(baseprice)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking baseprice changes.

  ## Examples

      iex> change_baseprice(baseprice)
      %Ecto.Changeset{data: %Baseprice{}}

  """
  def change_baseprice(%Baseprice{} = baseprice, attrs \\ %{}) do
    Baseprice.changeset(baseprice, attrs)
  end

  alias ProductAlpha.Productprice.Subscription

  @doc """
  Returns the list of subscriptions.

  ## Examples

      iex> list_subscriptions()
      [%Subscription{}, ...]

  """
  def list_subscriptions do
    Repo.all(Subscription)
  end

  @doc """
  Gets a single subscription.

  Raises `Ecto.NoResultsError` if the Subscription does not exist.

  ## Examples

      iex> get_subscription!(123)
      %Subscription{}

      iex> get_subscription!(456)
      ** (Ecto.NoResultsError)

  """
  def get_subscription!(id), do: Repo.get!(Subscription, id)

  @doc """
  Creates a subscription.

  ## Examples

      iex> create_subscription(%{field: value})
      {:ok, %Subscription{}}

      iex> create_subscription(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_subscription(attrs \\ %{}) do
    %Subscription{}
    |> Subscription.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a subscription.

  ## Examples

      iex> update_subscription(subscription, %{field: new_value})
      {:ok, %Subscription{}}

      iex> update_subscription(subscription, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_subscription(%Subscription{} = subscription, attrs) do
    subscription
    |> Subscription.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a subscription.

  ## Examples

      iex> delete_subscription(subscription)
      {:ok, %Subscription{}}

      iex> delete_subscription(subscription)
      {:error, %Ecto.Changeset{}}

  """
  def delete_subscription(%Subscription{} = subscription) do
    Repo.delete(subscription)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking subscription changes.

  ## Examples

      iex> change_subscription(subscription)
      %Ecto.Changeset{data: %Subscription{}}

  """
  def change_subscription(%Subscription{} = subscription, attrs \\ %{}) do
    Subscription.changeset(subscription, attrs)
  end

  alias ProductAlpha.Productprice.Discount

  @doc """
  Returns the list of discounts.

  ## Examples

      iex> list_discounts()
      [%Discount{}, ...]

  """
  def list_discounts do
    Repo.all(Discount)
  end

  @doc """
  Gets a single discount.

  Raises `Ecto.NoResultsError` if the Discount does not exist.

  ## Examples

      iex> get_discount!(123)
      %Discount{}

      iex> get_discount!(456)
      ** (Ecto.NoResultsError)

  """
  def get_discount!(id), do: Repo.get!(Discount, id)

  @doc """
  Creates a discount.

  ## Examples

      iex> create_discount(%{field: value})
      {:ok, %Discount{}}

      iex> create_discount(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_discount(attrs \\ %{}) do
    %Discount{}
    |> Discount.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a discount.

  ## Examples

      iex> update_discount(discount, %{field: new_value})
      {:ok, %Discount{}}

      iex> update_discount(discount, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_discount(%Discount{} = discount, attrs) do
    discount
    |> Discount.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a discount.

  ## Examples

      iex> delete_discount(discount)
      {:ok, %Discount{}}

      iex> delete_discount(discount)
      {:error, %Ecto.Changeset{}}

  """
  def delete_discount(%Discount{} = discount) do
    Repo.delete(discount)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking discount changes.

  ## Examples

      iex> change_discount(discount)
      %Ecto.Changeset{data: %Discount{}}

  """
  def change_discount(%Discount{} = discount, attrs \\ %{}) do
    Discount.changeset(discount, attrs)
  end

  alias ProductAlpha.Productprice.Consumption

  @doc """
  Returns the list of consumptions.

  ## Examples

      iex> list_consumptions()
      [%Consumption{}, ...]

  """
  def list_consumptions do
    Repo.all(Consumption)
  end

  @doc """
  Gets a single consumption.

  Raises `Ecto.NoResultsError` if the Consumption does not exist.

  ## Examples

      iex> get_consumption!(123)
      %Consumption{}

      iex> get_consumption!(456)
      ** (Ecto.NoResultsError)

  """
  def get_consumption!(id), do: Repo.get!(Consumption, id)

  @doc """
  Creates a consumption.

  ## Examples

      iex> create_consumption(%{field: value})
      {:ok, %Consumption{}}

      iex> create_consumption(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_consumption(attrs \\ %{}) do
    %Consumption{}
    |> Consumption.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a consumption.

  ## Examples

      iex> update_consumption(consumption, %{field: new_value})
      {:ok, %Consumption{}}

      iex> update_consumption(consumption, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_consumption(%Consumption{} = consumption, attrs) do
    consumption
    |> Consumption.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a consumption.

  ## Examples

      iex> delete_consumption(consumption)
      {:ok, %Consumption{}}

      iex> delete_consumption(consumption)
      {:error, %Ecto.Changeset{}}

  """
  def delete_consumption(%Consumption{} = consumption) do
    Repo.delete(consumption)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking consumption changes.

  ## Examples

      iex> change_consumption(consumption)
      %Ecto.Changeset{data: %Consumption{}}

  """
  def change_consumption(%Consumption{} = consumption, attrs \\ %{}) do
    Consumption.changeset(consumption, attrs)
  end
end
