defmodule BC.Chat do
  use Ash.Api

  resources do
    registry BC.Chat.Registry
  end
end
