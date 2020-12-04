defmodule Mix.Tasks.D04.P1 do
  use Mix.Task

  import AdventOfCode.Day04

  @shortdoc "Day 04 Part 1"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_1: fn -> input |> part1() end}),
      else:
        input
        |> part1()
        |> IO.inspect(label: "Part 1 Results")
  end

  def get_input do
    "../../data/day_04.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Enum.map(&String.trim_trailing/1)
    |> chunk_passports()
    |> Enum.map(fn each -> Enum.map(each, fn subsection -> String.split(subsection, " ") end) end)
    |> Enum.map(fn each -> Enum.concat(each) end)
    |> Enum.map(fn each -> Enum.map(each, fn subsection -> Regex.split(~r{:}, subsection) end) end)
    |> Enum.map(fn each -> Enum.map(each, fn [a, b] -> {String.to_atom(a), b} end) end)
  end

  def chunk_passports(input) do
    one_passport = fn
      (element, []) -> {:cont, [element]}
      (element, chunk = [_ | _]) when element != "" -> {:cont, [element | chunk]}
      (element, chunk = [_ | _]) when element == "" -> {:cont, chunk, []}
    end

    after_func = fn chunk -> {:cont, chunk, []} end

    Enum.chunk_while(input, [], one_passport, after_func)
  end
end
