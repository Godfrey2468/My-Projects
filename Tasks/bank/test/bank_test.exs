defmodule BankTest do
  use ExUnit.Case
  doctest Bank

  test "concurrent deposits and withdrawals" do
    {:ok, pid} = Bank.start_link(1000)

    tasks =
      1..10
      |> Enum.map(fn _ ->
        Task.async(fn ->
          Bank.deposit(pid, 100)
          Bank.withdraw(pid, 50)
        end)
      end)

    Enum.each(tasks, &Task.await/1)

    assert Bank.balance(pid) == 1500
  end
end
