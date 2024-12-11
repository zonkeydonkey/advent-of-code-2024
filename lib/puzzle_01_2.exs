defmodule Puzzle01_2 do
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

    comparison_list = Enum.frequencies(right_list)

    left_list
    |> Enum.map(fn elem ->
      Map.get(comparison_list, elem, 0) * elem
    end)
    |> Enum.sum()
  end

  defp parse_int!(str) do
    Integer.parse(str)
    |> elem(0)
  end
end

IO.inspect(Puzzle01_2.solve())
