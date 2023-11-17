defmodule JsonEditorWeb.PageController do
  use JsonEditorWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def edit_json(conn, _params) do
    render(conn, :edit_json, layout: false)
  end


end
