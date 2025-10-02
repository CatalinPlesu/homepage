defmodule HomepageWeb.Plugs.GuestId do
  @behaviour Plug

  import Plug.Conn

  @impl true
  def init(default), do: default

  @impl true
  def call(%Plug.Conn{:cookies => %{"guest_id" => guest_id}} = conn, _config) do
    conn
    |> put_session(:guest_id, guest_id)
  end

  @impl true
  def call(%Plug.Conn{} = conn, _config) do
    guest_id = unique_guest_id()

    conn
    |> put_session(:guest_id, guest_id)
    |> put_resp_cookie("guest_id", guest_id)
  end

  defp unique_guest_id() do
    :crypto.strong_rand_bytes(16) |> Base.encode64()
  end
end
