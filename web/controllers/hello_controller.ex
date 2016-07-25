defmodule PhoenixTestApp.HelloController do
  use PhoenixTestApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
