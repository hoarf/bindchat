defmodule BC.User.Info do
  use Ash.Resource, extensions: [AshAdmin.Resource], data_layer: AshPostgres.DataLayer

  actions do
    defaults [:create, :read, :update, :destroy]
  end

  admin do
    actor?(true)
  end

  postgres do
    table "users"

    repo BC.Repo
  end

  attributes do
    uuid_primary_key :id

    attribute :email, :string
  end

  relationships do
    has_many :messages, BC.User.Message
  end
end
