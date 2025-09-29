defmodule Homepage.Repo do
  use Ecto.Repo,
    otp_app: :homepage,
    adapter: Ecto.Adapters.SQLite3
end
