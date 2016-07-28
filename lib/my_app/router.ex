defmodule MyApp.Router do
  use PlugRest.Router

  resource "/hello", MyApp.HelloResource
  resource "/users/:username", MyApp.UserResource

  match "/match" do
   send_resp(conn, 200, "Match")
  end

  match _ do
   send_resp(conn, 404, "Not found")
  end
end
