defmodule Storybook.Repo do
  use Ecto.Repo,
    otp_app: :storybook,
    adapter: Ecto.Adapters.Postgres
end
