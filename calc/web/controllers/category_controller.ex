defmodule Calc.CategoryController do
  use Calc.Web, :controller

  alias Calc.Category

  def index(conn, _params) do
    categories = Repo.all(Category)
    render conn, "index.html", categories: categories
  end

  def new(conn, _params) do
  changeset = Category.changeset(%Category{}, %{})

  render conn, "new.html", changeset: changeset
end

def create(conn, %{"category" => category}) do
  changeset = Category.changeset(%Category{}, category)
  case Repo.insert(changeset) do
    {:ok, _} ->
       conn
       |> put_flash(:info, "Category Created")
       |> redirect(to: category_path(conn, :index))
    {:error, changeset} ->
      render conn, "new.html", changeset: changeset
  end
end

  def edit(conn, %{"id" => category_id}) do
      category = Repo.get(Category, category_id)
      changeset = Category.changeset(category)

      render conn, "edit.html", changeset: changeset, category: category
  end

  def update(conn, %{"id" => category_id, "category" => category}) do
      category_without_changes = Repo.get(Category, category_id)
      changeset =  Category.changeset(category_without_changes, category)

      case Repo.update(changeset) do
        {:ok, _} ->
          conn
           |> put_flash(:info, "Category Updated")
           |> redirect(to: category_path(conn, :index))
         {:error, changeset} ->
            render conn, "edit.html", changeset: changeset, category: category_without_changes
       end
  end


end
