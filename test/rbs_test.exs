defmodule RBSTest do
  use ExUnit.Case
  doctest RBS

  test "greets the world" do
    assert RBS.hello() == :world
  end
end
