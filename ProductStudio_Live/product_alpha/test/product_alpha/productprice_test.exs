defmodule ProductAlpha.ProductpriceTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Productprice

  describe "wallets" do
    alias ProductAlpha.Productprice.Wallet

    import ProductAlpha.ProductpriceFixtures

    @invalid_attrs %{datab: nil}

    test "list_wallets/0 returns all wallets" do
      wallet = wallet_fixture()
      assert Productprice.list_wallets() == [wallet]
    end

    test "get_wallet!/1 returns the wallet with given id" do
      wallet = wallet_fixture()
      assert Productprice.get_wallet!(wallet.id) == wallet
    end

    test "create_wallet/1 with valid data creates a wallet" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Wallet{} = wallet} = Productprice.create_wallet(valid_attrs)
      assert wallet.datab == %{}
    end

    test "create_wallet/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productprice.create_wallet(@invalid_attrs)
    end

    test "update_wallet/2 with valid data updates the wallet" do
      wallet = wallet_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Wallet{} = wallet} = Productprice.update_wallet(wallet, update_attrs)
      assert wallet.datab == %{}
    end

    test "update_wallet/2 with invalid data returns error changeset" do
      wallet = wallet_fixture()
      assert {:error, %Ecto.Changeset{}} = Productprice.update_wallet(wallet, @invalid_attrs)
      assert wallet == Productprice.get_wallet!(wallet.id)
    end

    test "delete_wallet/1 deletes the wallet" do
      wallet = wallet_fixture()
      assert {:ok, %Wallet{}} = Productprice.delete_wallet(wallet)
      assert_raise Ecto.NoResultsError, fn -> Productprice.get_wallet!(wallet.id) end
    end

    test "change_wallet/1 returns a wallet changeset" do
      wallet = wallet_fixture()
      assert %Ecto.Changeset{} = Productprice.change_wallet(wallet)
    end
  end

  describe "baseprices" do
    alias ProductAlpha.Productprice.Baseprice

    import ProductAlpha.ProductpriceFixtures

    @invalid_attrs %{datab: nil}

    test "list_baseprices/0 returns all baseprices" do
      baseprice = baseprice_fixture()
      assert Productprice.list_baseprices() == [baseprice]
    end

    test "get_baseprice!/1 returns the baseprice with given id" do
      baseprice = baseprice_fixture()
      assert Productprice.get_baseprice!(baseprice.id) == baseprice
    end

    test "create_baseprice/1 with valid data creates a baseprice" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Baseprice{} = baseprice} = Productprice.create_baseprice(valid_attrs)
      assert baseprice.datab == %{}
    end

    test "create_baseprice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productprice.create_baseprice(@invalid_attrs)
    end

    test "update_baseprice/2 with valid data updates the baseprice" do
      baseprice = baseprice_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Baseprice{} = baseprice} = Productprice.update_baseprice(baseprice, update_attrs)
      assert baseprice.datab == %{}
    end

    test "update_baseprice/2 with invalid data returns error changeset" do
      baseprice = baseprice_fixture()
      assert {:error, %Ecto.Changeset{}} = Productprice.update_baseprice(baseprice, @invalid_attrs)
      assert baseprice == Productprice.get_baseprice!(baseprice.id)
    end

    test "delete_baseprice/1 deletes the baseprice" do
      baseprice = baseprice_fixture()
      assert {:ok, %Baseprice{}} = Productprice.delete_baseprice(baseprice)
      assert_raise Ecto.NoResultsError, fn -> Productprice.get_baseprice!(baseprice.id) end
    end

    test "change_baseprice/1 returns a baseprice changeset" do
      baseprice = baseprice_fixture()
      assert %Ecto.Changeset{} = Productprice.change_baseprice(baseprice)
    end
  end

  describe "subscriptions" do
    alias ProductAlpha.Productprice.Subscription

    import ProductAlpha.ProductpriceFixtures

    @invalid_attrs %{datab: nil}

    test "list_subscriptions/0 returns all subscriptions" do
      subscription = subscription_fixture()
      assert Productprice.list_subscriptions() == [subscription]
    end

    test "get_subscription!/1 returns the subscription with given id" do
      subscription = subscription_fixture()
      assert Productprice.get_subscription!(subscription.id) == subscription
    end

    test "create_subscription/1 with valid data creates a subscription" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Subscription{} = subscription} = Productprice.create_subscription(valid_attrs)
      assert subscription.datab == %{}
    end

    test "create_subscription/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productprice.create_subscription(@invalid_attrs)
    end

    test "update_subscription/2 with valid data updates the subscription" do
      subscription = subscription_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Subscription{} = subscription} = Productprice.update_subscription(subscription, update_attrs)
      assert subscription.datab == %{}
    end

    test "update_subscription/2 with invalid data returns error changeset" do
      subscription = subscription_fixture()
      assert {:error, %Ecto.Changeset{}} = Productprice.update_subscription(subscription, @invalid_attrs)
      assert subscription == Productprice.get_subscription!(subscription.id)
    end

    test "delete_subscription/1 deletes the subscription" do
      subscription = subscription_fixture()
      assert {:ok, %Subscription{}} = Productprice.delete_subscription(subscription)
      assert_raise Ecto.NoResultsError, fn -> Productprice.get_subscription!(subscription.id) end
    end

    test "change_subscription/1 returns a subscription changeset" do
      subscription = subscription_fixture()
      assert %Ecto.Changeset{} = Productprice.change_subscription(subscription)
    end
  end

  describe "discounts" do
    alias ProductAlpha.Productprice.Discount

    import ProductAlpha.ProductpriceFixtures

    @invalid_attrs %{datab: nil}

    test "list_discounts/0 returns all discounts" do
      discount = discount_fixture()
      assert Productprice.list_discounts() == [discount]
    end

    test "get_discount!/1 returns the discount with given id" do
      discount = discount_fixture()
      assert Productprice.get_discount!(discount.id) == discount
    end

    test "create_discount/1 with valid data creates a discount" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Discount{} = discount} = Productprice.create_discount(valid_attrs)
      assert discount.datab == %{}
    end

    test "create_discount/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productprice.create_discount(@invalid_attrs)
    end

    test "update_discount/2 with valid data updates the discount" do
      discount = discount_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Discount{} = discount} = Productprice.update_discount(discount, update_attrs)
      assert discount.datab == %{}
    end

    test "update_discount/2 with invalid data returns error changeset" do
      discount = discount_fixture()
      assert {:error, %Ecto.Changeset{}} = Productprice.update_discount(discount, @invalid_attrs)
      assert discount == Productprice.get_discount!(discount.id)
    end

    test "delete_discount/1 deletes the discount" do
      discount = discount_fixture()
      assert {:ok, %Discount{}} = Productprice.delete_discount(discount)
      assert_raise Ecto.NoResultsError, fn -> Productprice.get_discount!(discount.id) end
    end

    test "change_discount/1 returns a discount changeset" do
      discount = discount_fixture()
      assert %Ecto.Changeset{} = Productprice.change_discount(discount)
    end
  end

  describe "consumptions" do
    alias ProductAlpha.Productprice.Consumption

    import ProductAlpha.ProductpriceFixtures

    @invalid_attrs %{datab: nil}

    test "list_consumptions/0 returns all consumptions" do
      consumption = consumption_fixture()
      assert Productprice.list_consumptions() == [consumption]
    end

    test "get_consumption!/1 returns the consumption with given id" do
      consumption = consumption_fixture()
      assert Productprice.get_consumption!(consumption.id) == consumption
    end

    test "create_consumption/1 with valid data creates a consumption" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Consumption{} = consumption} = Productprice.create_consumption(valid_attrs)
      assert consumption.datab == %{}
    end

    test "create_consumption/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productprice.create_consumption(@invalid_attrs)
    end

    test "update_consumption/2 with valid data updates the consumption" do
      consumption = consumption_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Consumption{} = consumption} = Productprice.update_consumption(consumption, update_attrs)
      assert consumption.datab == %{}
    end

    test "update_consumption/2 with invalid data returns error changeset" do
      consumption = consumption_fixture()
      assert {:error, %Ecto.Changeset{}} = Productprice.update_consumption(consumption, @invalid_attrs)
      assert consumption == Productprice.get_consumption!(consumption.id)
    end

    test "delete_consumption/1 deletes the consumption" do
      consumption = consumption_fixture()
      assert {:ok, %Consumption{}} = Productprice.delete_consumption(consumption)
      assert_raise Ecto.NoResultsError, fn -> Productprice.get_consumption!(consumption.id) end
    end

    test "change_consumption/1 returns a consumption changeset" do
      consumption = consumption_fixture()
      assert %Ecto.Changeset{} = Productprice.change_consumption(consumption)
    end
  end
end
