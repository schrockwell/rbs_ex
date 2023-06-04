defmodule RBS do
  @doc """
  Returns a list of all posts.

  Looks for all priv/posts/YYYY-MM-DD-*.gmi files. The date is determined from the filename. The title is determined
  from the first line of the static file if it is an H1.
  """
  def list_posts do
    [:code.priv_dir(:rbs), "posts", "*.gmi"]
    |> Path.join()
    |> Path.wildcard()
    |> Enum.reverse()
    |> Enum.map(fn path ->
      basename = Path.basename(path)
      [year, month, day | rest] = path |> Path.basename("gmi") |> String.split("-")
      date = "#{year}-#{month}-#{day}"

      title =
        path
        |> File.stream!()
        |> Enum.take(1)
        |> hd()
        |> String.trim()
        |> case do
          "# " <> title -> title
          _ -> Enum.join(rest, "-")
        end

      %{
        date: date,
        path: "/posts/#{basename}",
        title: title
      }
    end)
  end
end
