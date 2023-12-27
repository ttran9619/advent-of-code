# 2023 Advent of Code - Tyler Tran - Day 2

defmodule Main do
  def check_color(%{color: "red", count: count}, maxes) do
    {red_pair, other_pairs} = maxes |> Enum.split_with(&match?(%{color: "red"}, &1))

    updated_color_set = %{
      color: "red",
      count: Enum.max([count, red_pair |> List.first() |> Map.get(:count)])
    }

    other_pairs ++ [updated_color_set]
  end

  def check_color(%{color: "green", count: count}, maxes) do
    {green_pair, other_pairs} = maxes |> Enum.split_with(&match?(%{color: "green"}, &1))

    updated_color_set = %{
      color: "green",
      count: Enum.max([count, green_pair |> List.first() |> Map.get(:count)])
    }

    other_pairs ++ [updated_color_set]
  end

  def check_color(%{color: "blue", count: count}, maxes) do
    {blue_pair, other_pairs} = maxes |> Enum.split_with(&match?(%{color: "blue"}, &1))

    updated_color_set = %{
      color: "blue",
      count: Enum.max([count, blue_pair |> List.first() |> Map.get(:count)])
    }

    other_pairs ++ [updated_color_set]
  end

  def split_color_string(string) do
    list = string |> String.split(~r{\s}, trim: true)
    %{color: list |> List.last(), count: list |> List.first() |> String.to_integer()}
  end

  def evaluate_round(string, maxes) do
    string
    |> String.split(",")
    |> Enum.map(&Main.split_color_string/1)
    |> Enum.reduce(maxes, &Main.check_color/2)
  end

  def evaluate_game(string) do
    default_acc = [
      %{color: "red", count: 0},
      %{color: "green", count: 0},
      %{color: "blue", count: 0}
    ]

    string
    |> String.split(":")
    |> List.last()
    |> String.split(";")
    |> Enum.reduce(
      default_acc,
      &Main.evaluate_round/2
    )
    |> Enum.map(fn x -> x |> Map.get(:count) end)
    |> Enum.product()
  end
end

result = File.stream!("input.txt") |> Enum.map(&Main.evaluate_game/1) |> Enum.sum()

IO.inspect(result)
