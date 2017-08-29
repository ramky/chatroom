defmodule Chatroom.Web.LayoutView do
  use Chatroom.Web, :view

  def js_script_tag do
    if Mix.env == :prod do
      # In production we'll just reference the file
      "<script src=\"/js/app.js\"></script>"
    else
      # In development mode we'll load it from our webpack dev server
      "<script src=\"http://localhost:4001/js/app.js\"></script>"
    end
  end

  # Ditto for the css
  def css_link_tag do
    if Mix.env == :prod do
      "<link rel=\"stylesheet\" href=\"/css/app.css\" />"
    else
      # external dependency so load in development separately
      "<link rel=\"stylesheet\" href=\"http://localhost:4001/css/phoenix.css\" />"
    end
  end
end
