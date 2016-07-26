defmodule PhoenixTestApp.MessagesController do
  use PhoenixTestApp.Web, :controller
  alias PhoenixTestApp.Repo
  alias PhoenixTestApp.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.json", messages: messages
  end
end
