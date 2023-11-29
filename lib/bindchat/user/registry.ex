defmodule BC.User.Registry do
  use Ash.Registry,
    extensions: [
      # This extension adds helpful compile time validations
      Ash.Registry.ResourceValidations
    ]

  entries do
    entry BC.User.Info
    entry BC.User.Message
  end
end
