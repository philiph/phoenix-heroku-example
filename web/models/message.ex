defmodule PhoenixTestApp.Message do
  use PhoenixTestApp.Web, :model
  @derive {Poison.Encoder, only: [:id, :message, :inserted_at, :updated_at]}

  schema "messages" do
    field :message, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:message])
    |> validate_required([:message])
  end
end
