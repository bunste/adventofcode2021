defmodule AdventOfCode.Day1 do
  def count([a, b | tail], acc) when b > a, do: count([b | tail], acc+1)
  def count([a, b | tail], acc), do: count([b | tail], acc)
  def count(_, acc), do: acc
end
