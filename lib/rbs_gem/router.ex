defmodule RBSGem.Router do
  use Orbit.Router

  alias RBSGem.LayoutView
  alias RBSGem.PageController

  pipe {Orbit.Controller, :push_layout}, {LayoutView, :main}

  route "/posts/*path", Orbit.Static, from: "priv/posts"
  route "/projects/*path", Orbit.Static, from: "priv/projects"

  route "/", PageController, :home
end
