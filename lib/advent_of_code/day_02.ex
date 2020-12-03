defmodule AdventOfCode.Day02 do
  def part1(input) do
    input
    |> Enum.filter(&valid_count/1)
    |> Enum.count()
  end

  def valid_count(input) do
    total = 
      Keyword.get(input, :password)
      |> String.graphemes
      |> Enum.count(fn char ->
        char == Keyword.get(input, :letter)
      end)
    
    String.to_integer(Keyword.get(input, :min)) <= total && 
    String.to_integer(Keyword.get(input, :max)) >= total
  end

  def part2(input) do
    input
    |> Enum.filter(&valid_position/1)
    |> Enum.count()
  end

  def valid_position(input) do
    first_letter = character_at_position(input, String.to_integer(Keyword.get(input, :min)))
    second_letter = character_at_position(input, String.to_integer(Keyword.get(input, :max)))
    eval_letter = Keyword.get(input, :letter)

    (first_letter == eval_letter || second_letter == eval_letter) && first_letter != second_letter
  end

  def character_at_position(input, index) do
    Keyword.get(input, :password)
      |> String.graphemes
      |> Enum.at(index - 1)
  end
end
