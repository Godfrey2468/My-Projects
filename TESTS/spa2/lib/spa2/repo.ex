defmodule Spa2.Repo do
  use Ecto.Repo,
    otp_app: :spa2,
    adapter: Ecto.Adapters.Postgres
end
