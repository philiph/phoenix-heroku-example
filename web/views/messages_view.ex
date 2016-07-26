defmodule PhoenixTestApp.MessagesView do
  use PhoenixTestApp.Web, :view

  def render("index.json", %{messages: messages}) do
    %{messages: messages}
  end
end
