defmodule MyApp.Router do
  use PlugRest.Router
  use Plug.ErrorHandler

  if Mix.env == :dev do
    use Plug.Debugger, otp_app: :my_app
  end

  resource "/hello", MyApp.HelloResource
  resource "/users/:username", MyApp.UserResource

  match "/match" do
   send_resp(conn, 200, "Match")
  end

  match "/error" do
    raise "oops"
  end

  defp handle_errors(conn, %{kind: _kind, reason: _reason, stack: _stack}) do
    send_resp(conn, conn.status, "Something went wrong")
  end

end
