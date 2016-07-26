defmodule PhoenixTestApp.MessagesControllerTest do
  use PhoenixTestApp.ConnCase
  alias PhoenixTestApp.Message

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
    assert Map.keys(first_message) == ~w( id inserted_at message updated_at )
    assert first_message["id"] >= 0
    assert first_message["message"] == "First message."

    second_message = Enum.at(response_data["messages"], 1)
    assert second_message["id"] >= 0
    assert second_message["message"] == "Second message."
  end
end
