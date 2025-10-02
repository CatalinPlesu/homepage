defmodule Homepage.GuestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Homepage.Guests` context.
  """

  @doc """
  Generate a guest.
  """
  def guest_fixture(attrs \\ %{}) do
    {:ok, guest} =
      attrs
      |> Enum.into(%{
        guest_id: "some guest_id"
      })
      |> Homepage.Guests.create_guest()

    guest
  end
end
