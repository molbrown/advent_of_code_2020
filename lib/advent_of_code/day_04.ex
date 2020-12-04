defmodule AdventOfCode.Day04 do
  @required_passport_data [ :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid ]

  def part1(input) do
    input
    |> Enum.filter(&valid?/1)
    |> Enum.count()
  end

  def valid?(input) do
    Enum.all?(@required_passport_data, fn field -> Keyword.has_key?(input, field) end)
  end

  def part2(args) do
  end
end
