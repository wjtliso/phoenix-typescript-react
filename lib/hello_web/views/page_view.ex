defmodule HelloWeb.PageView do
  use HelloWeb, :view
  alias HelloWeb.AuthorView

  #def render("index.html", %{user_id: user_id}) do
  #  "Welcome! #{user_id}"
  #end

  def render("show.json", %{page: page}) do
    %{data: render_one(page, HelloWeb.PageView, "page_with_authors.json")}
  end

  def render("page.json", %{page: page}) do
    %{title: page.title}
  end

  def render("page_with_authors.json", %{page: page}) do
    authors = ["foo", "bar"]
    %{title: page.title,
      authors: render_many(authors, AuthorView, "author.json", as: :writer)}
  end

end
