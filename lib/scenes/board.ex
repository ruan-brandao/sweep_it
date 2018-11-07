defmodule SweepIt.Scene.Board do
  use Scenic.Scene
  alias Scenic.Graph

  def init(_, _opts) do
    graph = Graph.build()
    |> push_graph

    {:ok, graph}
  end
end
