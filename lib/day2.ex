defmodule AdventOfCode.Day2 do
  def position(instructions) do
    acc = %{horizontal: 0, depth: 0}
    Enum.reduce(instructions, acc, &follow_instruction/2)
  end

  defp follow_instruction({:forward, unit}, acc), do: %{acc | horizontal: acc.horizontal + unit}
  defp follow_instruction({:down, unit}, acc), do: %{acc | depth: acc.depth + unit}
  defp follow_instruction({:up, unit}, acc), do: %{acc | depth: acc.depth - unit}
end
