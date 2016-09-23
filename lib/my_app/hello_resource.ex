defmodule MyApp.HelloResource do
  use PlugRest.Resource

  def allowed_methods(conn, state) do
    {["GET", "HEAD", "OPTIONS", "POST"], conn, state}
  end

  def content_types_provided(conn, state) do
    {[{"text/html", :to_html}], conn, state}
  end

  def last_modified(conn, state) do
    modified = {{2016, 7, 17}, {11, 49, 29}}
    {modified, conn, state}
  end

  def to_html(conn, state) do
    {"Hello world", conn, state}
  end

  def content_types_accepted(conn, state) do
    {[{"mixed/multipart", :from_multipart}], conn, state}
  end

  def from_multipart(conn, state) do
    {true, conn, state}
  end
end
