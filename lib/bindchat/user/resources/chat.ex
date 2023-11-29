defmodule BC.User.Message do
  use Ash.Resource, extensions: [AshAdmin.Resource], data_layer: AshPostgres.DataLayer

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  postgres do
    table "messages"
    repo BC.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :body, :string
  end

  relationships do
    belongs_to :info, BC.User.Info
  end
end
