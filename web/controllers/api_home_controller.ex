defmodule PhoenixTestApp.ApiHomeController do
  use PhoenixTestApp.Web, :controller

  def index(conn, _params) do
    current_time = Timex.now
    render conn, "index.json", current_time: current_time
  end
end
