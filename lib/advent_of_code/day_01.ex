defmodule AdventOfCode.Day01 do
  @sum 2020

  def part1(input) do
    # input |> IO.inspect(label: "Input")

    [{a, b} | _input] = for number_1 <- input, number_2 <- input, number_1 + number_2 == @sum,
              do: {number_1, number_2}

    IO.puts "\nThe two numbers in the list that add to #{@sum} are: \{ #{a}, #{b} \}."
    IO.puts "Multiplied: (#{a} x #{b}) = #{a * b}."

    a * b
  end

  def part2(input) do
    [{a, b, c} | _input] = for number_1 <- input, number_2 <- input, number_3 <- input,
              number_1 + number_2 + number_3 == @sum,
              do: {number_1, number_2, number_3}

    IO.puts "\nThe three numbers in the list that add to #{@sum} are: \{ #{a}, #{b}, #{c} \}."
    IO.puts "Multiplied: (#{a} x #{b} x #{c}) = #{a * b * c}."

    a * b * c
  end
end
