defmodule Puzzle01_1 do
  @input_file_path "priv/puzzle_01_input.txt"

  def solve() do
    file_content = File.read!(@input_file_path)
    solve(file_content)
  end

  defp solve(input) do
    {left_list, right_list} =
      input
      |> String.split("\n")
      |> Enum.map(fn row ->
        [left, right] = String.split(row, "   ")
        {parse_int!(left), parse_int!(right)}
      end)
      |> Enum.unzip()

    Enum.zip(Enum.sort(left_list), Enum.sort(right_list))
    |> Enum.map(fn {left, right} -> abs(left - right) end)
    |> Enum.sum()
  end

  defp parse_int!(str) do
    Integer.parse(str)
    |> elem(0)
  end
end

IO.inspect(Puzzle01_1.solve())
