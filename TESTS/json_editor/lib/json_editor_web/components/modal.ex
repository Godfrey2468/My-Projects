defmodule JsonEditorWeb.Components.Modal do
  use JsonEditorWeb, :live_component

  @impl true
  def mount(socket) do
    {:ok, assign(socket, state: "CLOSED")}
  end


  @impl true
  def update(assigns, socket) do
    {:ok,
      socket
      |> assign(assigns)
    }
  end

  @impl true
  def handle_event("open", _, socket) do
    {:noreply, assign(socket, :state, "OPEN")}
  end

  def handle_event("close", _, socket) do
    {:noreply, assign(socket, :state, "CLOSED")}
  end

  @impl true
def handle_event("close-modal", %{"modal-id" => id}, socket) do
  {
    :noreply,
    socket
    |> push_event("close", %{id: id})
  }
end

end
