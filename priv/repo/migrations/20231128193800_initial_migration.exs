defmodule BC.Repo.Migrations.InitialMigration do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:messages, primary_key: false) do
      add :id, :uuid, null: false, primary_key: true
      add :subject, :text
    end
  end

  def down do
    drop table(:messages)
  end
end