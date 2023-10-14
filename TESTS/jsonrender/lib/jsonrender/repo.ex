defmodule Jsonrender.Repo do
  use Ecto.Repo,
    otp_app: :jsonrender,
    adapter: Ecto.Adapters.Postgres
end
