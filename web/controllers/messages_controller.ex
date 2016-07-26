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

  def create(conn, %{"message" => message_params}) do
    changeset = Message.changeset(%Message{}, message_params)
    case Repo.insert(changeset) do
      {:ok, message} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", messages_path(conn, :show, message))
        |> render("show.json", message: message)
      {:error, _changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(PhoenixTestApp.ErrorView, :"422", %{})
    end
  end
end
