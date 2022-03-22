defmodule AdventOfCode.Day1Test do
  use ExUnit.Case

  @module AdventOfCode.Day1

  test "works" do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]

    assert @module.count(input, 0) == 7
  end
end
