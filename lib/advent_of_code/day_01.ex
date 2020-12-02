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
  end
end
