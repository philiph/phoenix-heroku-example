defmodule PhoenixTestApp.MessagesView do
  use PhoenixTestApp.Web, :view

  def render("index.json", %{data: data}) do
    data
  end
end
