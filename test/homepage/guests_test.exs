defmodule Homepage.GuestsTest do
  use Homepage.DataCase

  alias Homepage.Guests

  describe "guests" do
    alias Homepage.Guests.Guest

    import Homepage.GuestsFixtures

    @invalid_attrs %{guest_id: nil}

    test "list_guests/0 returns all guests" do
      guest = guest_fixture()
      assert Guests.list_guests() == [guest]
    end

    test "get_guest!/1 returns the guest with given id" do
      guest = guest_fixture()
      assert Guests.get_guest!(guest.id) == guest
    end

    test "create_guest/1 with valid data creates a guest" do
      valid_attrs = %{guest_id: "some guest_id"}

      assert {:ok, %Guest{} = guest} = Guests.create_guest(valid_attrs)
      assert guest.guest_id == "some guest_id"
    end

    test "create_guest/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Guests.create_guest(@invalid_attrs)
    end

    test "update_guest/2 with valid data updates the guest" do
      guest = guest_fixture()
      update_attrs = %{guest_id: "some updated guest_id"}

      assert {:ok, %Guest{} = guest} = Guests.update_guest(guest, update_attrs)
      assert guest.guest_id == "some updated guest_id"
    end

    test "update_guest/2 with invalid data returns error changeset" do
      guest = guest_fixture()
      assert {:error, %Ecto.Changeset{}} = Guests.update_guest(guest, @invalid_attrs)
      assert guest == Guests.get_guest!(guest.id)
    end

    test "delete_guest/1 deletes the guest" do
      guest = guest_fixture()
      assert {:ok, %Guest{}} = Guests.delete_guest(guest)
      assert_raise Ecto.NoResultsError, fn -> Guests.get_guest!(guest.id) end
    end

    test "change_guest/1 returns a guest changeset" do
      guest = guest_fixture()
      assert %Ecto.Changeset{} = Guests.change_guest(guest)
    end
  end
end
