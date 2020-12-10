defmodule HelloWorld.Repo.Migrations.CreateExampleProjection do
  use Ecto.Migration

  def change do
    create table(:example_projections) do
      add(:balance, :integer)
      add(:account_number, :integer)

      timestamps(type: :naive_datetime_usec)
    end
  end
end
