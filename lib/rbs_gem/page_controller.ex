defmodule RBSGem.PageController do
  use RBSGem, :controller

  view RBSGem.PageView

  def home(req, _params) do
    req
    |> assign(posts: RBS.list_posts())
    |> render()
  end
end
