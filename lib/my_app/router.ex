defmodule MyApp.Router do
  use PlugRest.Router

  if Mix.env == :dev do
    use Plug.Debugger, otp_app: :my_app
  end

  use Plug.ErrorHandler

  plug Plug.Static,
    at: "static/",
    from: "lib/"

  plug :match
  plug :dispatch

  resource "/gen", MyApp.GenResource
  resource "/hello", MyApp.HelloResource
  resource "/users/:username", MyApp.UserResource
  resource "/greeting/:username", MyApp.UserResource, "Welcome"

  match "/match", do: send_resp(conn, 200, "Match")

  match "/error" do
    raise "oops"
  end

  defp handle_errors(conn, %{kind: _kind, reason: exception, stack: _stack}) do
    send_resp(conn, conn.status, "Custom error message")
  end

end
