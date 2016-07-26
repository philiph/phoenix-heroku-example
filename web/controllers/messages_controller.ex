defmodule PhoenixTestApp.MessagesController do
  use PhoenixTestApp.Web, :controller
  alias PhoenixTestApp.Repo
  alias PhoenixTestApp.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.json", messages: messages
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get!(Message, id)
    render conn, "show.json", message: message
  end
end
