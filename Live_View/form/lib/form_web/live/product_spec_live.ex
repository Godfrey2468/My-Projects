defmodule FormWeb.Live.ProductSpecLive do
  use FormWeb, :live_view

  def render(assigns) do
    ~H"""
    <div>
      <h1><%= @product.name %> Specifications</h1>
      <p><%= @product.description %></p>
      <p><%= @product.specifications %></p>
    </div>
    """
  end

  def mount(%{"id" => product_id}, _session, socket) do
    product = Form.Products.get_product(product_id) # You need to implement this function
    {:ok, assign(socket, product: product)}
  end
end
