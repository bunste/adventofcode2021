defmodule AdventOfCode.Day3 do

  # Part 1

  def power_consumption(diagnostic_report) do
    acc = %{
      gamma_rate: [],
      epsilon_rate: []
    }

    rates =
      diagnostic_report
      |> Enum.map(&String.graphemes(&1))
      |> swap_rows_with_columns()
      |> Enum.reduce(acc, fn column, acc ->
        new_gamma_rate = [most_common(column) | acc.gamma_rate]
        new_epsilon_rate = [least_common(column) | acc.epsilon_rate]

        %{ acc | gamma_rate: new_gamma_rate, epsilon_rate: new_epsilon_rate }
      end)

    to_decimal(rates.gamma_rate) * to_decimal(rates.epsilon_rate)
  end

  defp swap_rows_with_columns(diagnostic_report) do
    diagnostic_report
    |> Enum.zip_reduce([], fn elements, acc -> [elements | acc] end)
  end

  defp most_common(elements) do
    f = Enum.frequencies(elements)
    if f["0"] > f["1"], do: 0, else: 1
  end

  defp least_common(elements) do
    f = Enum.frequencies(elements)
    if f["0"] < f["1"], do: 0, else: 1
  end

  defp to_decimal(list) do
    list
    |> Enum.join()
    |> Integer.parse(2)
    |> elem(0)
  end
end
