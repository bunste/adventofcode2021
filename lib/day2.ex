defmodule AdventOfCode.Day2 do

  # Part 1

  def position(instructions) do
    acc = %{depth: 0, horizontal: 0}
    Enum.reduce(instructions, acc, &follow_instruction/2)
  end

  defp follow_instruction({:forward, unit}, acc), do: %{acc | horizontal: acc.horizontal + unit}
  defp follow_instruction({:down, unit}, acc), do: %{acc | depth: acc.depth + unit}
  defp follow_instruction({:up, unit}, acc), do: %{acc | depth: acc.depth - unit}

  # Part 2

  def position2(instructions) do
    acc = %{aim: 0, depth: 0, horizontal: 0}
    Enum.reduce(instructions, acc, &follow_instruction2/2)
  end

  defp follow_instruction2({:down, unit}, acc), do: %{acc | aim: acc.aim + unit}
  defp follow_instruction2({:up, unit}, acc), do: %{acc | aim: acc.aim - unit}
  defp follow_instruction2({:forward, unit}, acc) do
    %{acc | horizontal: acc.horizontal + unit, depth: acc.depth + (acc.aim * unit)}
  end
end
