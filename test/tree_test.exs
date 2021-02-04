defmodule TreeTest do
  use ExUnit.Case
  doctest Tree
  alias Tree.Node

  describe "new/1" do
    test "creates a Node" do
      assert Tree.new(2) == %Node{data: 2, children: []}
    end
  end

  describe "add/2" do
    test "adds a node to tree as child" do
      root = Tree.new(2)

      assert Tree.add(root, 4) == %Tree.Node{
               children: [%Tree.Node{children: [], data: 4}],
               data: 2
             }
    end
  end

  describe "remove/2" do
    test "removes a node from tree" do
      tree = Tree.new(2) |> Tree.add(3) |> Tree.add(4)

      assert Tree.remove(tree, 4) == %Tree.Node{
               children: [%Tree.Node{children: [], data: 3}],
               data: 2
             }
    end
  end
end
