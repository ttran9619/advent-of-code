# 2023 Advent of Code - Tyler Tran - Day 1

defmodule MyUtils do
  def extract_calibration_value(string) do
    numbers = string |> String.replace(~r{\D}, "")
    "#{numbers |> String.first}#{numbers |> String.last}" |> String.to_integer
  end
end

result = File.stream!("input.txt") |> Enum.map(&MyUtils.extract_calibration_value/1) |> Enum.sum()

IO.inspect(result)
