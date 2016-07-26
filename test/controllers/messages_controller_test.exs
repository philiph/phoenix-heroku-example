defmodule PhoenixTestApp.MessagesControllerTest do
  use PhoenixTestApp.ConnCase
  alias PhoenixTestApp.Message

  @expected_fields ~w( id inserted_at message updated_at )

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "GET /api/messages with no messages", %{conn: conn} do
    conn = get conn, "/api/messages"

    response_data = json_response(conn, 200)
    assert response_data["messages"] == []
  end

  test "GET /api/messages with some messages", %{conn: conn} do
    Repo.insert Message.changeset(%Message{}, %{message: "First message."})
    Repo.insert Message.changeset(%Message{}, %{message: "Second message."})

    conn = get conn, "/api/messages"

    response_data = json_response(conn, 200)
    assert Enum.count(response_data["messages"]) == 2

    first_message = Enum.at(response_data["messages"], 0)
    assert Map.keys(first_message) == @expected_fields
    assert first_message["id"] >= 0
    assert first_message["message"] == "First message."

    second_message = Enum.at(response_data["messages"], 1)
    assert second_message["id"] >= 0
    assert second_message["message"] == "Second message."
  end

  test "GET /api/messages/1 when no message with that ID", %{conn: conn} do
    conn = get conn, "/api/messages/1"

    response_data = json_response(conn, 404)
    assert response_data == %{"errors" => %{"message" => "Not Found"}}
  end

  test "GET /api/messages/1 when message exists", %{conn: conn} do
    {:ok, message} =
      Message.changeset(%Message{}, %{message: "First message."})
      |> Repo.insert
    message_id = Map.get(message, :id)

    conn = get conn, "/api/messages/" <> Integer.to_string(message_id)

    response_data = json_response(conn, 200)

    assert Map.keys(response_data) == @expected_fields
    assert response_data["id"] == message_id
    assert response_data["message"] == "First message."
  end
end
