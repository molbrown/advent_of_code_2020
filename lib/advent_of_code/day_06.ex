defmodule AdventOfCode.Day06 do
  def part1(input) do
    input
    |> Enum.map(fn group -> Enum.map(group, fn person -> String.graphemes(person) end) end)
    |> Enum.map(fn group -> Enum.reduce(group, [], fn person, acc -> acc ++ person end) end)
    |> Enum.map( fn group -> Enum.uniq(group) end)
    |> Enum.map(fn group -> Enum.count(group) end)
    |> Enum.sum()
  end

  def part2(args) do
  end
end
