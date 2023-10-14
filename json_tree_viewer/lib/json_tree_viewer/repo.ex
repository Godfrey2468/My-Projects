defmodule JsonTreeViewer.Repo do
  use Ecto.Repo,
    otp_app: :json_tree_viewer,
    adapter: Ecto.Adapters.Postgres
end
