defmodule AdventOfCode.Day1 do
  def increases(list, window_size \\ 1) do
    list
    |> preprocess(window_size)
    |> count(0)
  end

  defp preprocess(list, 1), do: list
  defp preprocess(list, window_size) do
    list
    |> Enum.chunk_every(window_size, 1, :discard)
    |> Enum.map(&Enum.sum(&1))
  end

  defp count([a, b | tail], acc) when b > a, do: count([b | tail], acc+1)
  defp count([_a, b | tail], acc), do: count([b | tail], acc)
  defp count(_, acc), do: acc
end
