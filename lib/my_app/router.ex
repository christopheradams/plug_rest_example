defmodule MyApp.Router do
  use PlugRest.Router

  resource "/hello", MyApp.HelloResource

  match "/match" do
   send_resp(conn, 200, "Match")
  end

  match _ do
   send_resp(conn, 404, "Not found")
  end
end
