defmodule MockOne.Repo do
  use Ecto.Repo,
    otp_app: :mock_one,
    adapter: Ecto.Adapters.Postgres
end
