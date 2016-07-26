defmodule PhoenixTestApp.ApiHomeController do
  use PhoenixTestApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.json"
  end
end
