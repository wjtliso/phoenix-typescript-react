defmodule HelloWeb.AuthorView do
  use HelloWeb, :view

  def render("author.json", %{author: author}) do
    %{author: author}
  end

  def render("author.json", %{writer: writer}) do
    %{writer: writer}
  end
end