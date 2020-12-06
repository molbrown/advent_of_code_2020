defmodule AdventOfCode.Day05 do
  @rows Enum.to_list(0..127) |> Enum.map(&Integer.to_string/1)
  @columns Enum.to_list(0..7) |> Enum.map(&Integer.to_string/1)

  def part1(input) do
    input
    |> Enum.map(&calc_seat_id/1)
    |> Enum.max()
  end

  def part2(input) do
    input
    |> Enum.map(&calc_seat_id/1)
    |> Enum.sort()
    |> find_missing_seat(0)
  end

  def find_missing_seat(input, index) do
    cond do
      Enum.at(input, index + 1) == Enum.at(input, index) + 1 -> find_missing_seat(input, index + 1)
      true -> Enum.at(input, index) + 1
    end
  end

  def calc_seat_id(input) do
    calc_row(String.slice(input, 0..6), @rows) * 8 + calc_column(String.slice(input, 7..9), @columns)
  end

  def calc_row(_ , range) when length(range) == 1 do
    String.to_integer(Enum.at(range, 0))
  end

  def calc_row(input, range) do
    {front, back} = Enum.split(range, Enum.count(range)/2 |> round())
    cond do
      String.at(input, 0) == "F" -> calc_row(String.slice(input, 1..6), front)
      true -> calc_row(String.slice(input, 1..6), back)
    end
  end

  def calc_column(_ , range) when length(range) == 1 do
    String.to_integer(Enum.at(range, 0))
  end

  def calc_column(input, range) do
    {left, right} = Enum.split(range, Enum.count(range)/2 |> round())
    cond do
      String.at(input, 0) == "L" -> calc_column(String.slice(input, 1..6), left)
      true -> calc_column(String.slice(input, 1..6), right)
    end
  end
end
