defmodule BC.Repo.Migrations.MigrateResources3 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    rename table(:messages), :body, to: :text
  end

  def down do
    rename table(:messages), :text, to: :body
  end
end