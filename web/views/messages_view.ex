defmodule PhoenixTestApp.MessagesView do
  use PhoenixTestApp.Web, :view
  @attributes ~w( id message inserted_at updated_at )a

  def render("index.json", %{messages: messages}) do
    %{messages: serialize_messages(messages)}
  end

  def render("show.json", %{message: message}) do
    serialize_message(message)
  end

  defp serialize_messages(messages) do
    messages
    |> Enum.map(&serialize_message/1)
  end

  defp serialize_message(message) do
    message
    |> Map.take(@attributes)
  end
end
