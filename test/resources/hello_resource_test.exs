defmodule MyApp.HelloResourceTest do
  use ExUnit.Case
  use Plug.Test

  alias MyApp.Router

  test "get hello resource" do
    conn = conn(:get, "/hello")

    conn = Router.call(conn, [])

    assert conn.status == 200
    assert conn.resp_body == "Hello world"
  end
end
