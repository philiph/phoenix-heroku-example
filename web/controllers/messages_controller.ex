defmodule PhoenixTestApp.MessagesController do
  use PhoenixTestApp.Web, :controller

  def index(conn, _params) do
    render conn, "index.json", data: %{message: "Hello world!"}
  end
end
