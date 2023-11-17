defmodule ProductAlpha.Repo do
  use Ecto.Repo,
    otp_app: :product_alpha,
    adapter: Ecto.Adapters.Postgres
end
