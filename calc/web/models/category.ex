defmodule Calc.Category do
    use Calc.Web, :model

    schema "category" do
      field :name, :string
    end

    def changeset(struct, params \\ %{}) do
      struct
      |> cast(params, [:name])
      |> validate_required([:name])
    end
end
