defmodule AdventOfCode.Day04 do
  @required_passport_data [ :byr, :iyr, :eyr, :hgt, :hcl, :ecl, :pid ]
  @hair_char ["a", "b", "c", "d", "e", "f", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  @eye_color ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]

  def part1(input) do
    input
    |> Enum.filter(&valid_fields?/1)
    |> Enum.count()
  end

  def part2(input) do
    input
    |> Enum.filter(&valid_fields?/1)
    |> Enum.filter(&valid_values?/1)
    |> Enum.count()
  end

  def valid_fields?(input) do
    Enum.all?(@required_passport_data, fn field -> Keyword.has_key?(input, field) end)
  end

  def valid_values?(input) do
    valid_byr(Keyword.get(input, :byr)) && 
    valid_iyr(Keyword.get(input, :iyr)) && 
    valid_eyr(Keyword.get(input, :eyr)) &&
    valid_hgt(Keyword.get(input, :hgt)) &&
    valid_hcl(Keyword.get(input, :hcl)) &&
    valid_ecl(Keyword.get(input, :ecl)) &&
    valid_pid(Keyword.get(input, :pid))
  end

  def valid_byr(value) do
    validate_year(value, 1920, 2002)
  end

  def valid_iyr(value) do
    validate_year(value, 2010, 2020)
  end

  def valid_eyr(value) do
    validate_year(value, 2020, 2030)
  end

  def validate_year(value, min_year, max_year) do
    String.length(value) == 4 &&
    min_year <= String.to_integer(value) && String.to_integer(value) <= max_year
  end

  def valid_hgt(value) do
    values = String.split_at(value, -2)
    |> Tuple.to_list()
    num = Enum.at(values, 0)

    Enum.member?(["cm", "in"], Enum.at(values, 1)) &&
    Enum.all?(String.graphemes(num), fn x -> Enum.member?(0..9, String.to_integer(x)) end) &&
    cond do
      Enum.at(values, 1) == "cm" ->
        150 <= String.to_integer(num) && String.to_integer(num) <= 193
      Enum.at(values, 1) == "in" ->
        59 <= String.to_integer(num) && String.to_integer(num) <= 76
    end
  end

  def valid_hcl(value) do
    values = String.split_at(value, 1)
    |> Tuple.to_list()

    Enum.at(values, 0) == "#" &&
    String.length(Enum.at(values, 1)) == 6 &&
    Enum.all?(String.graphemes(Enum.at(values, 1)), fn x -> Enum.member?(@hair_char, x)end)
  end

  def valid_ecl(value) do
    Enum.member?(@eye_color, value)
  end

  def valid_pid(value) do
    String.length(value) == 9 &&
    Enum.all?(String.graphemes(value), fn x -> Enum.member?(0..9, String.to_integer(x)) end)
  end
end
