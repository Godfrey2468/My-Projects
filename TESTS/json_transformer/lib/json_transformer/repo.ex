defmodule JsonTransformer.Repo do
  use Ecto.Repo,
    otp_app: :json_transformer,
    adapter: Ecto.Adapters.Postgres
end
