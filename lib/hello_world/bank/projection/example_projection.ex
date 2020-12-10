defmodule ExampleProjection do
  use Ecto.Schema

  import Ecto.Changeset

  schema "example_projections" do
    field(:balance, :integer)
    field(:account_number, :integer)

    timestamps()
  end

  def update_balance(record, attrs) do
    record
    |> cast(attrs, [:balance])
    |> validate_required([:balance])
  end
end
