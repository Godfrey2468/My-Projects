defmodule JsonTreeViewerWeb.JsonHTML do
  use JsonTreeViewerWeb, :html

  embed_templates "json_html/*"

  @doc """
  Renders a json form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def json_form(assigns)

  def render_json(data) do
    render_json(data, "")
  end

  defp render_json(%{}, _key) do
    ""
  end

  defp render_json(%{key => value}, "") do
    "<div class=\"json-node\">
      <span class=\"json-key\">#{key}:</span>
      #{render_json(value)}
    </div>"
  end

  defp render_json(%{key => value}, parent) do
    "<div class=\"json-node\">
      <span class=\"json-key\">#{key}:</span>
      #{render_json(value)}
    </div>"
  end

  defp render_json([]) do
    ""
  end

  defp render_json([head | tail]) do
    "<div class=\"json-array\">
      <span class=\"json-key\">#{render_json(head)}</span>
      #{render_json(tail)}
    </div>"
  end

  defp render_json(value) when is_bitstring(value) do
    "<span class=\"json-string\">\"#{value}\"</span>"
  end

  defp render_json(value) when is_number(value) do
    "<span class=\"json-number\">#{value}</span>"
  end

  defp render_json(value) when is_list(value) do
    "<span class=\"json-array\">[#{Enum.map(value, &render_json/1)}]</span>"
  end



end
