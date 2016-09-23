defmodule MyApp.UserResource do
  use PlugRest.Resource

  def init(conn, []) do
    {:ok, conn, "Hello"}
  end

  def init(conn, greeting) do
    {:ok, conn, greeting}
  end

  def allowed_methods(conn, state) do
    {["GET"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"text/html", :to_html}], conn, state}
  end

  def to_html(%{params: params} = conn, greeting) do
    %{"username" => username} = params
    {"#{greeting}, #{username}", conn, greeting}
  end
end
