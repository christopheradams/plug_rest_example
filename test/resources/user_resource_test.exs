defmodule MyApp.UserResourceTest do
  use ExUnit.Case
  use Plug.Test

  alias MyApp.Router

  test "get user resource" do
    conn = conn(:get, "/users/jose")

    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == "Hello, jose"
  end

  test "GET /greeting/:username" do
    conn = conn(:get, "/greeting/everyone")
    conn = Router.call(conn, [])
    assert conn.resp_body == "Welcome, everyone"
  end
end
