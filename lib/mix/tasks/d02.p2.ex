defmodule Mix.Tasks.D02.P2 do
  use Mix.Task

  import AdventOfCode.Day02

  @shortdoc "Day 02 Part 2"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end

  def get_input do
    "../../data/day_02.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> Stream.map(fn each ->
      String.replace(each, "-", " ")
      |> String.replace(":", "")
    end)
    |> Enum.map(fn each -> 
      String.split(each, " ")
    end)
    |> Enum.map(fn each ->
      Keyword.new([
        {:min, Enum.at(each, 0)}, 
        {:max, Enum.at(each, 1)}, 
        {:letter, Enum.at(each, 2)}, 
        {:password, Enum.at(each, 3)}
      ])
    end)
  end
end
