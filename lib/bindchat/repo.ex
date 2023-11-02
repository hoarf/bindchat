defmodule BC.Repo do
  use Ecto.Repo,
    otp_app: :bindchat,
    adapter: Ecto.Adapters.SQLite3
end
