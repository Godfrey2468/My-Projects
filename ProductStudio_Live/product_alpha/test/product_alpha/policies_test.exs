defmodule ProductAlpha.PoliciesTest do
  use ProductAlpha.DataCase

  alias ProductAlpha.Policies

  describe "policies" do
    alias ProductAlpha.Policies.Policy

    import ProductAlpha.PoliciesFixtures

    @invalid_attrs %{data: nil}

    test "list_policies/0 returns all policies" do
      policy = policy_fixture()
      assert Policies.list_policies() == [policy]
    end

    test "get_policy!/1 returns the policy with given id" do
      policy = policy_fixture()
      assert Policies.get_policy!(policy.id) == policy
    end

    test "create_policy/1 with valid data creates a policy" do
      valid_attrs = %{data: %{}}

      assert {:ok, %Policy{} = policy} = Policies.create_policy(valid_attrs)
      assert policy.data == %{}
    end

    test "create_policy/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Policies.create_policy(@invalid_attrs)
    end

    test "update_policy/2 with valid data updates the policy" do
      policy = policy_fixture()
      update_attrs = %{data: %{}}

      assert {:ok, %Policy{} = policy} = Policies.update_policy(policy, update_attrs)
      assert policy.data == %{}
    end

    test "update_policy/2 with invalid data returns error changeset" do
      policy = policy_fixture()
      assert {:error, %Ecto.Changeset{}} = Policies.update_policy(policy, @invalid_attrs)
      assert policy == Policies.get_policy!(policy.id)
    end

    test "delete_policy/1 deletes the policy" do
      policy = policy_fixture()
      assert {:ok, %Policy{}} = Policies.delete_policy(policy)
      assert_raise Ecto.NoResultsError, fn -> Policies.get_policy!(policy.id) end
    end

    test "change_policy/1 returns a policy changeset" do
      policy = policy_fixture()
      assert %Ecto.Changeset{} = Policies.change_policy(policy)
    end
  end

  describe "thresholdss" do
    alias ProductAlpha.Policies.Threshold

    import ProductAlpha.PoliciesFixtures

    @invalid_attrs %{datab: nil}

    test "list_thresholdss/0 returns all thresholdss" do
      threshold = threshold_fixture()
      assert Policies.list_thresholdss() == [threshold]
    end

    test "get_threshold!/1 returns the threshold with given id" do
      threshold = threshold_fixture()
      assert Policies.get_threshold!(threshold.id) == threshold
    end

    test "create_threshold/1 with valid data creates a threshold" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Threshold{} = threshold} = Policies.create_threshold(valid_attrs)
      assert threshold.datab == %{}
    end

    test "create_threshold/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Policies.create_threshold(@invalid_attrs)
    end

    test "update_threshold/2 with valid data updates the threshold" do
      threshold = threshold_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Threshold{} = threshold} = Policies.update_threshold(threshold, update_attrs)
      assert threshold.datab == %{}
    end

    test "update_threshold/2 with invalid data returns error changeset" do
      threshold = threshold_fixture()
      assert {:error, %Ecto.Changeset{}} = Policies.update_threshold(threshold, @invalid_attrs)
      assert threshold == Policies.get_threshold!(threshold.id)
    end

    test "delete_threshold/1 deletes the threshold" do
      threshold = threshold_fixture()
      assert {:ok, %Threshold{}} = Policies.delete_threshold(threshold)
      assert_raise Ecto.NoResultsError, fn -> Policies.get_threshold!(threshold.id) end
    end

    test "change_threshold/1 returns a threshold changeset" do
      threshold = threshold_fixture()
      assert %Ecto.Changeset{} = Policies.change_threshold(threshold)
    end
  end

  describe "triggers" do
    alias ProductAlpha.Policies.Trigger

    import ProductAlpha.PoliciesFixtures

    @invalid_attrs %{datab: nil}

    test "list_triggers/0 returns all triggers" do
      trigger = trigger_fixture()
      assert Policies.list_triggers() == [trigger]
    end

    test "get_trigger!/1 returns the trigger with given id" do
      trigger = trigger_fixture()
      assert Policies.get_trigger!(trigger.id) == trigger
    end

    test "create_trigger/1 with valid data creates a trigger" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Trigger{} = trigger} = Policies.create_trigger(valid_attrs)
      assert trigger.datab == %{}
    end

    test "create_trigger/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Policies.create_trigger(@invalid_attrs)
    end

    test "update_trigger/2 with valid data updates the trigger" do
      trigger = trigger_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Trigger{} = trigger} = Policies.update_trigger(trigger, update_attrs)
      assert trigger.datab == %{}
    end

    test "update_trigger/2 with invalid data returns error changeset" do
      trigger = trigger_fixture()
      assert {:error, %Ecto.Changeset{}} = Policies.update_trigger(trigger, @invalid_attrs)
      assert trigger == Policies.get_trigger!(trigger.id)
    end

    test "delete_trigger/1 deletes the trigger" do
      trigger = trigger_fixture()
      assert {:ok, %Trigger{}} = Policies.delete_trigger(trigger)
      assert_raise Ecto.NoResultsError, fn -> Policies.get_trigger!(trigger.id) end
    end

    test "change_trigger/1 returns a trigger changeset" do
      trigger = trigger_fixture()
      assert %Ecto.Changeset{} = Policies.change_trigger(trigger)
    end
  end

  describe "policystates" do
    alias ProductAlpha.Policies.Policystate

    import ProductAlpha.PoliciesFixtures

    @invalid_attrs %{datab: nil}

    test "list_policystates/0 returns all policystates" do
      policystate = policystate_fixture()
      assert Policies.list_policystates() == [policystate]
    end

    test "get_policystate!/1 returns the policystate with given id" do
      policystate = policystate_fixture()
      assert Policies.get_policystate!(policystate.id) == policystate
    end

    test "create_policystate/1 with valid data creates a policystate" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Policystate{} = policystate} = Policies.create_policystate(valid_attrs)
      assert policystate.datab == %{}
    end

    test "create_policystate/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Policies.create_policystate(@invalid_attrs)
    end

    test "update_policystate/2 with valid data updates the policystate" do
      policystate = policystate_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Policystate{} = policystate} = Policies.update_policystate(policystate, update_attrs)
      assert policystate.datab == %{}
    end

    test "update_policystate/2 with invalid data returns error changeset" do
      policystate = policystate_fixture()
      assert {:error, %Ecto.Changeset{}} = Policies.update_policystate(policystate, @invalid_attrs)
      assert policystate == Policies.get_policystate!(policystate.id)
    end

    test "delete_policystate/1 deletes the policystate" do
      policystate = policystate_fixture()
      assert {:ok, %Policystate{}} = Policies.delete_policystate(policystate)
      assert_raise Ecto.NoResultsError, fn -> Policies.get_policystate!(policystate.id) end
    end

    test "change_policystate/1 returns a policystate changeset" do
      policystate = policystate_fixture()
      assert %Ecto.Changeset{} = Policies.change_policystate(policystate)
    end
  end

  describe "intialservices" do
    alias ProductAlpha.Policies.Intialservice

    import ProductAlpha.PoliciesFixtures

    @invalid_attrs %{datab: nil}

    test "list_intialservices/0 returns all intialservices" do
      intialservice = intialservice_fixture()
      assert Policies.list_intialservices() == [intialservice]
    end

    test "get_intialservice!/1 returns the intialservice with given id" do
      intialservice = intialservice_fixture()
      assert Policies.get_intialservice!(intialservice.id) == intialservice
    end

    test "create_intialservice/1 with valid data creates a intialservice" do
      valid_attrs = %{datab: %{}}

      assert {:ok, %Intialservice{} = intialservice} = Policies.create_intialservice(valid_attrs)
      assert intialservice.datab == %{}
    end

    test "create_intialservice/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Policies.create_intialservice(@invalid_attrs)
    end

    test "update_intialservice/2 with valid data updates the intialservice" do
      intialservice = intialservice_fixture()
      update_attrs = %{datab: %{}}

      assert {:ok, %Intialservice{} = intialservice} = Policies.update_intialservice(intialservice, update_attrs)
      assert intialservice.datab == %{}
    end

    test "update_intialservice/2 with invalid data returns error changeset" do
      intialservice = intialservice_fixture()
      assert {:error, %Ecto.Changeset{}} = Policies.update_intialservice(intialservice, @invalid_attrs)
      assert intialservice == Policies.get_intialservice!(intialservice.id)
    end

    test "delete_intialservice/1 deletes the intialservice" do
      intialservice = intialservice_fixture()
      assert {:ok, %Intialservice{}} = Policies.delete_intialservice(intialservice)
      assert_raise Ecto.NoResultsError, fn -> Policies.get_intialservice!(intialservice.id) end
    end

    test "change_intialservice/1 returns a intialservice changeset" do
      intialservice = intialservice_fixture()
      assert %Ecto.Changeset{} = Policies.change_intialservice(intialservice)
    end
  end
end
