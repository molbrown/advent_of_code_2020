defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  test "part1" do
    input = [1721, 979, 366, 299, 675, 1456]
    result = part1(input)

    assert 514579 = result
  end

  # @tag :skip
  test "part2" do
    input = [1721, 979, 366, 299, 675, 1456]
    result = part2(input)

    assert 241861950 = result
  end
end
