defmodule AdventOfCode.Day02 do
  def part1(input) do
    input
    |> Enum.filter(&valid/1)
    |> Enum.count()
  end

  def valid(input) do
    total = 
      Keyword.get(input, :password)
      |> String.graphemes
      |> Enum.count(fn char ->
        char == Keyword.get(input, :letter)
      end)
    
    String.to_integer(Keyword.get(input, :min)) <= total && 
    String.to_integer(Keyword.get(input, :max)) >= total
  end

  def part2(args) do
  end
end
