defmodule Mix.Tasks.D06.P2 do
  use Mix.Task

  import AdventOfCode.Day06

  @shortdoc "Day 06 Part 2"
  def run(args) do
    input = get_input()

    if Enum.member?(args, "-b"),
      do: Benchee.run(%{part_2: fn -> input |> part2() end}),
      else:
        input
        |> part2()
        |> IO.inspect(label: "Part 2 Results")
  end

  def get_input() do
    "../../data/day_06.txt"
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> Stream.map(&String.trim_trailing/1)
    |> chunk_groups()
  end

  def chunk_groups(input) do
    one_group = fn
      (element, []) -> {:cont, [element]}
      (element, chunk = [_ | _]) when element != "" -> {:cont, [element | chunk]}
      (element, chunk = [_ | _]) when element == "" -> {:cont, chunk, []}
    end

    after_func = fn chunk -> {:cont, chunk, []} end

    Enum.chunk_while(input, [], one_group, after_func)
  end
end
