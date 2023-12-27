# 2023 Advent of Code - Tyler Tran - Day 2

defmodule Main do
  def check_color(%{color: "red", count: count}) do
    count <= 12
  end

  def check_color(%{color: "green", count: count}) do
    count <= 13
  end

  def check_color(%{color: "blue", count: count}) do
    count <= 14
  end

  def split_color_string(string) do
    list = string |> String.split(~r{\s}, trim: true)
    %{color: list |> List.last(), count: list |> List.first() |> String.to_integer()}
  end

  def evaluate_round(string) do
    colors = string |> String.split(",") |> Enum.map(&Main.split_color_string/1)
    Enum.all?(colors, &Main.check_color/1)
  end

  def evaluate_game(string) do
    [game_id_string, rounds_string] = string |> String.split(":")

    rounds_list = rounds_string |> String.split(";")

    if rounds_list |> Enum.all?(&Main.evaluate_round/1) do
      game_id_string |> String.replace(~r{\D}, "") |> String.to_integer()
    else
      0
    end
  end
end

result = File.stream!("input.txt") |> Enum.map(&Main.evaluate_game/1) |> Enum.sum()

IO.inspect(result)
