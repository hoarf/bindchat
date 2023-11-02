defmodule BC.Chat.Registry do
  use Ash.Registry

  entries do
    entry BC.Chat.Message
  end
end
