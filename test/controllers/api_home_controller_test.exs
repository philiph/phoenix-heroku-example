defmodule PhoenixTestApp.ApiHomeControllerTest do
  use PhoenixTestApp.ConnCase

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  test "GET /api", %{conn: conn} do
    conn = get conn, "/api"
    response_data = json_response(conn, 200)
    assert response_data["message"] == "Hello from Phoenix Test App!"
    assert response_data["current_time"] != nil
  end
end
