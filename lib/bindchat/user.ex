defmodule BC.User do
  use Ash.Api, extensions: [AshAdmin.Api]

  admin do
    show?(true)
  end

  resources do
    registry BC.User.Registry
  end
end
