
1.**Basic Operations**

```elixir
`iex(2)> {:ok, pid} = Bank.start_link(500)
{:ok, #PID<0.132.0>}
iex(3)> Bank.balance(pid)
500
iex(4)> Bank.deposit(pid, 300)
:ok
iex(5)> Bank.balance(pid)     
800
iex(6)> Bank.withdraw(pid, 200)
{:ok, 600}
iex(7)> Bank.balance(pid)      
600
```

2.**CONCURRENT DEPOSITS**

```elixir
iex(1)> {:ok, pid} = Bank.start_link(1000)
{:ok, #PID<0.132.0>}
iex(2)> spawn(fn -> Bank.deposit(pid, 100) end)
#PID<0.133.0>
iex(3)> spawn(fn -> Bank.withdraw(pid, 50) end)   
#PID<0.134.0>
iex(4)> spawn(fn -> Bank.deposit(pid, 100) end)
#PID<0.135.0>
iex(5)> spawn(fn -> Bank.deposit(pid, 100) end)
#PID<0.136.0>
iex(6)> spawn(fn -> Bank.deposit(pid, 100) end)
#PID<0.137.0>
iex(7)> spawn(fn -> Bank.deposit(pid, 100) end)
#PID<0.138.0>
iex(8)> Bank.balance(pid)
1450
```
3.**Concurrent Withdrawals**

```elixir
iex(2)> {:ok, pid} = Bank.start_link(1000)
{:ok, #PID<0.132.0>}
iex(2)> {:ok, pid} = Bank.start_link(1000)
{:ok, #PID<0.132.0>}
iex(3)> spawn(fn -> Bank.withdraw(pid, 100) end)      
#PID<0.133.0>
iex(4)> spawn(fn -> Bank.withdraw(pid, 100) end)
#PID<0.134.0>
iex(5)> spawn(fn -> Bank.withdraw(pid, 100) end)
#PID<0.135.0>
iex(6)> spawn(fn -> Bank.withdraw(pid, 100) end)
#PID<0.136.0>
iex(7)> spawn(fn -> Bank.withdraw(pid, 100) end)
#PID<0.137.0>
iex(8)> Bank.balance(pid)                       
500
```
4.**Mixed Concurrent Deposits and Withdrawals**


