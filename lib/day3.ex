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
      |> Enum.reverse()
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
    |> Enum.reverse()
  end

  defp most_common(elements) do
    f =
      elements
      |> Enum.frequencies()
      |> Map.put_new("0", 0) # In case we don't have any 0s
      |> Map.put_new("1", 0) # In case we don't have any 1s

    if f["0"] > f["1"], do: "0", else: "1"
  end

  defp least_common(elements) do
    f =
      elements
      |> Enum.frequencies()
      |> Map.put_new("0", 0) # In case we don't have any 0s
      |> Map.put_new("1", 0) # In case we don't have any 1s

    if f["0"] > f["1"], do: "1", else: "0"
  end

  defp to_decimal(list) do
    list
    |> Enum.join()
    |> Integer.parse(2)
    |> elem(0)
  end

  # Part 2

  def life_support_rating(diagnostic_report) do
    rows =
      diagnostic_report
      |> Enum.map(&String.graphemes(&1))

    oxygen_generator_rating = compute(rows, &most_common/1, 0)
    co2_scrubber_rating = compute(rows, &least_common/1, 0)

    to_decimal(oxygen_generator_rating) * to_decimal(co2_scrubber_rating)
  end

  def compute([row], _, _), do: row
  def compute(rows, criteria, position) do
    filter_value =
      rows
      |> swap_rows_with_columns()
      |> Enum.at(position)
      |> criteria.()

    rows
    |> Enum.filter(fn row -> Enum.at(row, position) == filter_value end)
    |> compute(criteria, position+1)
  end

end
