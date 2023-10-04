defmodule MockTwoWeb.ExampleLive do
  use Surface.LiveView

  alias MockTwoWeb.Components.ExampleComponent

  def render(assigns) do
    ~F"""
    <ExampleComponent>
      WELCOME TO PRODUCT STUDIO
    </ExampleComponent>
    """
  end
end
