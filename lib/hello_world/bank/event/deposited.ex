defmodule Deposited do
  @derive Jason.Encoder
  defstruct [:account_number, :value]
end
