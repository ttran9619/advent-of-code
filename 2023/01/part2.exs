# 2023 Advent of Code - Tyler Tran - Day 1

defmodule MyUtils do
  def to_digit("one") do "1e" end
  def to_digit("two") do "2o" end
  def to_digit("three") do "3e" end
  def to_digit("four") do "4" end
  def to_digit("five") do "5e" end
  def to_digit("six") do "6" end
  def to_digit("seven") do "7n" end
  def to_digit("eight") do "8t" end
  def to_digit("nine") do "9e" end

  def convert_text_numbers_to_digits(string) do
    replace_token = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    string |> String.replace(replace_token, &MyUtils.to_digit/1) |> String.replace(replace_token, &MyUtils.to_digit/1)
  end

  def extract_calibration_value(string) do
    numbers = string |> MyUtils.convert_text_numbers_to_digits |> String.replace(~r{\D}, "")
    "#{numbers |> String.first}#{numbers |> String.last}" |> String.to_integer
  end
end

result = File.stream!("input.txt") |> Enum.map(&MyUtils.extract_calibration_value/1) |> Enum.sum()

IO.inspect(result)
