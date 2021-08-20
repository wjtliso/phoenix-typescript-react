defmodule HelloWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Logger

  def init(default), do: default

  def call(conn, _default) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/sessions/new")
        |> halt()
      user_id ->
        assign(conn, :current_user, Hello.Accounts.get_user!(user_id))
    end
  end
end
