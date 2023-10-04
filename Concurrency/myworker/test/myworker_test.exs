defmodule MyTest do
  use ExUnit.Case

  test "increment functionality" do
    {:ok, pid} = MyWorker.start_link(nil)
    assert MyWorker.increment() == :ok
    assert MyWorker.increment() == :ok
    assert MyWorker.increment() == :ok

    assert {:ok, result} = GenServer.call(pid, :increment)
    assert result == 4
  end

  test "supervisor starts child worker" do
    {:ok, supervisor_pid} = MySupervisor.start_link(nil)

    worker_pid = Process.whereis(MyWorker)
    assert worker_pid != nil
    assert is_pid(worker_pid)
  end
end
