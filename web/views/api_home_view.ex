defmodule PhoenixTestApp.ApiHomeView do
  use PhoenixTestApp.Web, :view

  def render("index.json", _) do
    %{message: "Hello from Phoenix Test App!"}
  end
end
