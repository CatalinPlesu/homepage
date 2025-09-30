defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  def home(conn, _params) do
    data = Homepage.Data.get()
    render(conn, :home, data: data)
  end
end
