defmodule GreetTest do
  use ExUnit.Case

  test "sending a greet message" do
    pid = Greet.start()
    send pid, {:greet, "Godfrey"}

    #assert_receive {:greet, name} when name == "Godfrey"
    # Add any additional assertions here if needed
  end

end
