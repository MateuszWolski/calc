defmodule Calc.Repo.Migrations.AddCategoryTable do
  use Ecto.Migration

  def change do
    create table(:category) do
          add :name, :string
        end
  end
end
