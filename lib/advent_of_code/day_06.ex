defmodule AdventOfCode.Day06 do
  def part1(input) do
    input
    |> Enum.map(fn group -> Enum.map(group, fn person -> String.graphemes(person) end) end)
    |> Enum.map(fn group -> Enum.reduce(group, [], fn person, acc -> acc ++ person end) end)
    |> Enum.map(fn group -> Enum.uniq(group) end)
    |> Enum.map(fn group -> Enum.count(group) end)
    |> Enum.sum()
  end

  def part2(input) do
    input
    |> Enum.map(fn group -> Enum.map(group, fn person -> String.graphemes(person) end) end)
    |> Enum.map(&find_unions/1)
    |> Enum.map(fn group -> Enum.count(group) end)
    |> Enum.sum()
  end

  def find_unions(group) do
    required_frequency = Enum.count(group)
    first_person = Enum.at(group, 0)
    group_result = Enum.reduce(group, [], fn person, acc -> acc ++ person end)

    Enum.filter(first_person, fn question -> 
      Enum.count(group_result, fn x -> x == question end) == required_frequency 
    end)
  end
end
