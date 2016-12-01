defmodule Calc.PageController do
  use Calc.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
