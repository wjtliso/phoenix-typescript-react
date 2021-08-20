defmodule HelloWeb.PageController do
  use HelloWeb, :controller

  plug HelloWeb.Plugs.AuthenticateUser

  def index(%Plug.Conn{assigns: %{current_user: current_user}} = conn, _params) do
    user_id = current_user.id
    render(conn, "index.html", user_id: user_id)
  end

  def show(conn, _params) do
    page = %{title: "foo"}

    render(conn, "show.json", page: page)
  end
end
