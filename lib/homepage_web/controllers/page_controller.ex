defmodule HomepageWeb.PageController do
  use HomepageWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
