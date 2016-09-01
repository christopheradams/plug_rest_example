defmodule MyApp.UserResource do
  use PlugRest.Resource

  def allowed_methods(conn, state) do
    {["GET"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"text/html", :to_html}], conn, state}
  end

  def to_html(conn, state) do
    params = conn.params
    username = params["username"]
    {"Hello, #{username}", conn, state}
  end
end
