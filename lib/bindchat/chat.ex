defmodule BC.Chat do
  use Ash.Api, extensions: [AshAdmin.Api]

  admin do
    show?(true)
  end

  resources do
    registry BC.Chat.Registry
  end
end
