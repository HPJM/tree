defmodule Tree do
  @moduledoc """
  Represents a generic `Tree`.
  """

  @orders ~w|breadth depth|a

  defmodule Node do
    defstruct [:data, children: []]
  end

  @doc """
  Generates a node.

  ## Examples

      iex> Tree.new(2)
      %Tree.Node{data: 2}

  """
  def new(data, children \\ []) do
    %Node{data: data, children: children}
  end

  @doc """
  Adds a node as a child of the tree.

  ## Examples

      iex> tree = Tree.new(2) |> Tree.add(4)
      iex> %Tree.Node{children: [child]} = tree
      iex> child.data
      4

  """
  def add(%Node{children: children, data: data}, %Node{} = child) do
    new(data, children ++ [child])
  end

  def add(%Node{children: children, data: data}, value) do
    new(data, children ++ [new(value)])
  end

  @doc """
  Removes a child of the tree.

  ## Examples

      iex> tree = Tree.new(2) |> Tree.add(4) |> Tree.remove(4)
      iex> tree.children
      []
  """
  def remove(%Node{children: children, data: data}, value) do
    new(data, Enum.reject(children, &(&1.data == value)))
  end

  @doc """
  Traverses a tree, either breadth or depth first.

  ## Examples

      iex> subtree = Tree.new(1) |> Tree.add(2)
      iex> tree = Tree.new(3) |> Tree.add(subtree) |> Tree.add(4)
      iex> Tree.traverse(tree)
      [3, 1, 4, 2]
      iex> Tree.traverse(tree, :depth)
      [3, 1, 2, 4]
  """
  def traverse(%Node{} = tree, order \\ :breadth) when order in @orders do
    [tree]
    |> do_traverse(order, [])
    |> Enum.reverse()
  end

  defp do_traverse([], _mode, collected) do
    collected
  end

  defp do_traverse([head | tail], :breadth, collected) do
    do_traverse(tail ++ head.children, :breadth, [head.data | collected])
  end

  defp do_traverse([head | tail], :depth, collected) do
    do_traverse(head.children ++ tail, :depth, [head.data | collected])
  end
end
