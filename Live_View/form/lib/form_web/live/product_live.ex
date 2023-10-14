

defmodule FormWeb.Live.ProductLive do
  use FormWeb, :live_view
  import Phoenix.HTML.Link


  def render(assigns) do
    ~H"""
    <div>
      <ul>
        <%= for product <- @products do %>
          <li>
            <strong><%= product.name %></strong>
            <%= link("View Specifications", to: Routes.product_spec_path(@socket, :show, product.id)) %>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    products = Form.Products.list_products() # You need to implement this function
    {:ok, assign(socket, products: products)}
  end
end
