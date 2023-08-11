defmodule ShoppingCart do
  use GenServer

  def start_link([name, state]) do
    IO.inspect(state, label: "start_link")
    GenServer.start_link(__MODULE__, state, name: name)
  end

  def add_to_cart(server, item) do
    GenServer.cast(server, {:add_to_cart, item})
  end

  def init(state) do
    IO.inspect(state, label: "init")
    {:ok, state}
  end

  def handle_cast({:add, product}, state) do
    state = state ++ [product]
    {:noreply, state}
  end

  def handle_call(:apply_discount, _from, state) do
    state = Enum.map(state, &%{&1 | price: &1.price - 1})
    products = Enum.map(state, &(&1.name <> " "))
    {:reply, "Discount applied to: #{products}", state}
  end

  def handle_info(:increase_price, state) do
    state = Enum.map(state, &%{&1 | price: &1.price + 1})
    {:noreply, state}
  end
end











#defmodule ShoppingCart do
 # use GenServer

  # Client API
  #def start_link(_) do
   # GenServer.start_link(__MODULE__, %{})
  #end

  #def add_to_cart(server, item) do
   # GenServer.cast(server, {:add_to_cart, item})
  #end

  #def remove_from_cart(server, item) do
   # GenServer.cast(server, {:remove_from_cart, item})
  #end

  #def get_cart(server) do
   # GenServer.call(server, :get_cart)
  #end

  # GenServer callbacks
  #def init(state) do
   # {:ok, state}
  #end

  #def handle_cast({:add_to_cart, item}, state) do
   # updated_cart = update_cart(state, item)
    #{:noreply, updated_cart}
  #end

  #def handle_cast({:remove_from_cart, item}, state) do
   ##{:noreply, updated_cart}
  #end

  #def handle_call(:get_cart, _from, state) do
   # {:reply, state, state}
  #end

  #defp update_cart(cart, item) do
   # {item_name, quantity} = item
    #existing_item = Map.get(cart, item_name, {item_name, 0})
    #updated_quantity = existing_item |> elem(1) + quantity
    #updated_item = {item_name, updated_quantity}
    #Map.put(cart, item_name, updated_item)
  #nd

 # defp remove_from_cart(cart, item) do
  #  {item_name, quantity} = item
   # existing_item = Map.get(cart, item_name, {item_name, 0})
    #updated_item = {item_name, updated_quantity}

    #if updated_quantity > 0 do
     # Map.put(cart, item_name, updated_item)
    #else
     # Map.delete(cart, item_name)
    #end
  #end
#end
