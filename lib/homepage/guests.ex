defmodule Homepage.Guests do
  @moduledoc """
  The Guests context.
  """

  import Ecto.Query, warn: false
  alias Homepage.Repo

  alias Homepage.Guests.Guest

  @doc """
  Returns the list of guests.

  ## Examples

      iex> list_guests()
      [%Guest{}, ...]

  """
  def list_guests do
    Repo.all(Guest)
  end

  @doc """
  Gets a single guest.

  Raises `Ecto.NoResultsError` if the Guest does not exist.

  ## Examples

      iex> get_guest!(123)
      %Guest{}

      iex> get_guest!(456)
      ** (Ecto.NoResultsError)

  """
  def get_guest!(id), do: Repo.get!(Guest, id)

  @doc """
  Creates a guest.

  ## Examples

      iex> create_guest(%{field: value})
      {:ok, %Guest{}}

      iex> create_guest(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_guest(attrs) do
    %Guest{}
    |> Guest.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a guest.

  ## Examples

      iex> update_guest(guest, %{field: new_value})
      {:ok, %Guest{}}

      iex> update_guest(guest, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_guest(%Guest{} = guest, attrs) do
    guest
    |> Guest.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a guest.

  ## Examples

      iex> delete_guest(guest)
      {:ok, %Guest{}}

      iex> delete_guest(guest)
      {:error, %Ecto.Changeset{}}

  """
  def delete_guest(%Guest{} = guest) do
    Repo.delete(guest)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking guest changes.

  ## Examples

      iex> change_guest(guest)
      %Ecto.Changeset{data: %Guest{}}

  """
  def change_guest(%Guest{} = guest, attrs \\ %{}) do
    Guest.changeset(guest, attrs)
  end

  def get_guest_number!(guest_id) do
    query =
      from g in Guest,
        where: g.guest_id == ^guest_id,
        select: g.id

    case Repo.one(query) do
      nil ->
        guest =
          %Guest{}
          |> Guest.changeset(%{guest_id: guest_id})
          |> Repo.insert!()

        guest.id

      id ->
        id
    end
  end

  def get_total_guests() do
    query =
      from g in Guest,
        select: g.id

    query |> last(:inserted_at) |> Repo.one()
  end
end
