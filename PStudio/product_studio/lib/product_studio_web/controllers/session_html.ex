defmodule ProductStudioWeb.SessionHTML do
  use ProductStudioWeb, :html

  embed_templates "session_html/*"

  @doc """
  Renders a session form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def session_form(assigns)
end
