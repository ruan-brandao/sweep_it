defmodule SweepIt.Scene.Board do
  use Scenic.Scene

  import Scenic.Components
  import Scenic.Primitives

  alias Scenic.Graph
  alias Scenic.ViewPort.Input

  @cells_with_bombs [:x4y1, :x3y3]

  @graph Graph.build()
         |> button("", id: :x1y1, translate: {20, 20}, width: 20, height: 20, radius: 0)
         |> button("", id: :x2y1, translate: {41, 20}, width: 20, height: 20, radius: 0)
         |> button("", id: :x3y1, translate: {62, 20}, width: 20, height: 20, radius: 0)
         |> button("", id: :x4y1, translate: {83, 20}, width: 20, height: 20, radius: 0)
         |> button("", id: :x1y2, translate: {20, 41}, width: 20, height: 20, radius: 0)
         |> button("", id: :x2y2, translate: {41, 41}, width: 20, height: 20, radius: 0)
         |> button("", id: :x3y2, translate: {62, 41}, width: 20, height: 20, radius: 0)
         |> button("", id: :x4y2, translate: {83, 41}, width: 20, height: 20, radius: 0)
         |> button("", id: :x1y3, translate: {20, 62}, width: 20, height: 20, radius: 0)
         |> button("", id: :x2y3, translate: {41, 62}, width: 20, height: 20, radius: 0)
         |> button("", id: :x3y3, translate: {62, 62}, width: 20, height: 20, radius: 0)
         |> button("", id: :x4y3, translate: {83, 62}, width: 20, height: 20, radius: 0)
         |> button("", id: :x1y4, translate: {20, 83}, width: 20, height: 20, radius: 0)
         |> button("", id: :x2y4, translate: {41, 83}, width: 20, height: 20, radius: 0)
         |> button("", id: :x3y4, translate: {62, 83}, width: 20, height: 20, radius: 0)
         |> button("", id: :x4y4, translate: {83, 83}, width: 20, height: 20, radius: 0)
         |> button("clear", translate: {30, 500}, id: :clear, theme: :warning)

  def init(_, _opts) do
    push_graph(@graph)

    {:ok, @graph}
  end

  def filter_event(event = {:click, :clear}, _, _) do
    push_graph(@graph)
    {:continue, event, @graph}
  end

  def filter_event(event = {:click, id}, _, graph) when id in @cells_with_bombs do
    raise "Bombou."
    {:stop, graph}
  end

  def filter_event(event = {:click, id}, _, graph) do
    graph =
      graph
      |> text("#{id}", translate: {100, 450})
      |> push_graph()

    {:continue, event, graph}
  end

  # def handle_input( input = {:key, _}, _, graph ) do
  #   graph = graph
  #   |> text("clicou", translate: {100, 50})
  #   |> push_graph()
  #   {:continue, input, graph }
  # end
  #
  # def handle_input(input, _, graph) do
  #   {:continue, input, graph}
  # end
end
