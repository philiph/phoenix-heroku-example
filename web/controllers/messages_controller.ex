defmodule PhoenixTestApp.MessagesController do
  use PhoenixTestApp.Web, :controller
  alias PhoenixTestApp.Repo
  alias PhoenixTestApp.Message

  def index(conn, _params) do
    messages = Repo.all(Message)
    render conn, "index.json", messages: messages
  end

  def show(conn, %{"id" => id}) do
    message = Repo.get(Message, id)

    case message do
      nil ->
        conn
        |> put_status(:not_found)
        |> render(PhoenixTestApp.ErrorView, "404.json", message: "Message not found")
      _ ->
        conn
        |> render("show.json", message: message)
    end
  end
end
