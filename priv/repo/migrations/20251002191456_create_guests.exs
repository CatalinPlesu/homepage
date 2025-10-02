defmodule Homepage.Repo.Migrations.CreateGuests do
  use Ecto.Migration

  def change do
    create table(:guests) do
      add :guest_id, :string

      timestamps(type: :utc_datetime)
    end
  end
end
