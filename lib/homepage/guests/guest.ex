defmodule Homepage.Guests.Guest do
  use Ecto.Schema
  import Ecto.Changeset

  schema "guests" do
    field :guest_id, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(guest, attrs) do
    guest
    |> cast(attrs, [:guest_id])
    |> validate_required([:guest_id])
  end
end
