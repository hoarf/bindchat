defmodule BC.Repo.Migrations.MigrateResources7 do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    alter table(:messages) do
      add :info_id,
          references(:users,
            column: :id,
            name: "messages_info_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end
  end

  def down do
    drop constraint(:messages, "messages_info_id_fkey")

    alter table(:messages) do
      remove :info_id
    end
  end
end