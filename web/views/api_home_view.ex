defmodule PhoenixTestApp.ApiHomeView do
  use PhoenixTestApp.Web, :view

  def render("index.json", %{current_time: current_time}) do
    %{
      message: "Hello from Phoenix Test App!",
      current_time: current_time
    }
  end
end
