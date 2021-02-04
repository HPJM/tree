defmodule Tree do
  @moduledoc """
  Represents a generic `Tree`.
  """

  defmodule Node do
    defstruct [:data, children: []]
  end

  @doc """
  Generates a node.

  ## Examples

      iex> Tree.new(2)
      %Tree.Node{data: 2}

  """
  def new(data) do
    %Node{data: data}
  end

  @doc """
  Adds a node as a child of the tree.

  ## Examples

      iex> tree = Tree.new(2) |> Tree.add(4)
      iex> %Tree.Node{children: [child]} = tree
      iex> child.data
      4

  """
  def add(%Node{children: children} = tree, data) do
    %Node{tree | children: [new(data) | children]}
  end
end
