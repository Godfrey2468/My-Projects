defmodule Bank do

  #

    use GenServer

    def start_link(initial_balance) do
      GenServer.start_link(__MODULE__, initial_balance)
    end



    def deposit(pid, amount) do
      GenServer.cast(pid, {:deposit, amount})
    end

    def withdraw(pid, amount) do
      GenServer.call(pid, {:withdraw, amount})
    end

    def balance(pid) do
      GenServer.call(pid, :balance)
    end

    # Callbacks

    def handle_call({:withdraw, amount}, _from, balance) when balance >= amount do
      {:reply, {:ok, balance - amount}, balance - amount}
    end

    def handle_call({:withdraw, _amount}, _from, balance) do
      {:reply, {:error, "Insufficient funds"}, balance}
    end

    def handle_call(:balance, _from, balance) do
      {:reply, balance, balance}
    end

    def handle_cast({:deposit, amount}, balance) do
      {:noreply, balance + amount}
    end

    def init(initial_balance) do
      {:ok, initial_balance}
    end

  end
