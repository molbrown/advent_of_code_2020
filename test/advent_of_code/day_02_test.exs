defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  test "part1" do
    input = [[min: "1", max: "3", letter: "a", password: "abcde"], 
            [min: "1", max: "3", letter: "b", password: "cdefg"], 
            [min: "2", max: "9", letter: "c", password: "ccccccccc"]]
    result = part1(input)

    assert 2 = result
  end

  test "part2" do
    input = [[min: "1", max: "3", letter: "a", password: "abcde"], 
            [min: "1", max: "3", letter: "b", password: "cdefg"], 
            [min: "2", max: "9", letter: "c", password: "ccccccccc"]]
    result = part2(input)

    assert 1 = result
  end
end
