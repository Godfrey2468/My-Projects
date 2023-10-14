defmodule JsonrenderWeb.Layouts do
  use JsonrenderWeb, :html

  embed_templates "layouts/*"


    @doc """
  Set css class for active link.
  """
  @spec css_class(Plug.Conn.t(), String.t(), String.t(), String.t()) :: String.t()
  def css_class(conn, path, defaultClass, activeClass \\ "active") do
    if path == Phoenix.Controller.current_path(conn) do
      defaultClass <> " " <> activeClass
    else
      defaultClass
    end
  end
end
