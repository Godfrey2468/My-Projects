defmodule MockTwo.Repo do
  use Ecto.Repo,
    otp_app: :mock_two,
    adapter: Ecto.Adapters.Postgres
end
