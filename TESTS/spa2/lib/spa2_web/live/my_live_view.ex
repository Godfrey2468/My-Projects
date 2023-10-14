defmodule Spa2Web.MyLiveView do
  use Phoenix.LiveView

  def render(assigns) do
    ~H"""
    <div>
      <h1>SPA Example</h1>
      <nav>
        <button phx-click="page" phx-value="home">Home</button><br>
        <button phx-click="page" phx-value="about">About</button>
      </nav>

    </div>
    """
  end

  def mount(_params, _session, socket) do
    {:ok, assign(socket, page: "home.heex")}
  end

  def handle_event("page", %{"page" => page}, socket) do
    {:noreply, assign(socket, page: page)}
  end
end
