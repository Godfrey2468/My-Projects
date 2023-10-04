defmodule ProductStudio.Repo do
  use Ecto.Repo,
    otp_app: :product_studio,
    adapter: Ecto.Adapters.Postgres
end
