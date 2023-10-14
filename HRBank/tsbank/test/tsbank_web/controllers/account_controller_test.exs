defmodule TsbankWeb.AccountControllerTest do
  use TsbankWeb.ConnCase

  import Tsbank.AccountsFixtures

  alias Tsbank.Accounts.Account

  @create_attrs %{
    accountNumber: "some accountNumber",
    branchCode: "some branchCode",
    interestRate: 120.5,
    lastTransactionDate: ~D[2023-08-29],
    overdraftLimit: 42,
    status: "some status",
    type: "some type"
  }
  @update_attrs %{
    accountNumber: "some updated accountNumber",
    branchCode: "some updated branchCode",
    interestRate: 456.7,
    lastTransactionDate: ~D[2023-08-30],
    overdraftLimit: 43,
    status: "some updated status",
    type: "some updated type"
  }
  @invalid_attrs %{accountNumber: nil, branchCode: nil, interestRate: nil, lastTransactionDate: nil, overdraftLimit: nil, status: nil, type: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all accounts", %{conn: conn} do
      conn = get(conn, ~p"/api/accounts")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create account" do
    test "renders account when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/accounts", account: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/accounts/#{id}")

      assert %{
               "id" => ^id,
               "accountNumber" => "some accountNumber",
               "branchCode" => "some branchCode",
               "interestRate" => 120.5,
               "lastTransactionDate" => "2023-08-29",
               "overdraftLimit" => 42,
               "status" => "some status",
               "type" => "some type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/accounts", account: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update account" do
    setup [:create_account]

    test "renders account when data is valid", %{conn: conn, account: %Account{id: id} = account} do
      conn = put(conn, ~p"/api/accounts/#{account}", account: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/accounts/#{id}")

      assert %{
               "id" => ^id,
               "accountNumber" => "some updated accountNumber",
               "branchCode" => "some updated branchCode",
               "interestRate" => 456.7,
               "lastTransactionDate" => "2023-08-30",
               "overdraftLimit" => 43,
               "status" => "some updated status",
               "type" => "some updated type"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, account: account} do
      conn = put(conn, ~p"/api/accounts/#{account}", account: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete account" do
    setup [:create_account]

    test "deletes chosen account", %{conn: conn, account: account} do
      conn = delete(conn, ~p"/api/accounts/#{account}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/accounts/#{account}")
      end
    end
  end

  defp create_account(_) do
    account = account_fixture()
    %{account: account}
  end
end
