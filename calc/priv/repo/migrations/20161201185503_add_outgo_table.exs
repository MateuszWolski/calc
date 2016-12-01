defmodule Calc.Repo.Migrations.AddOutgoTable do
  use Ecto.Migration

  def change do
    create table(:outgo) do
          add :name, :string
          add :value, :float
          add :category_id, references(:category)
        end
  end
end
