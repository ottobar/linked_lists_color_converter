defmodule ColorConverter.ContinuousListConverter do
  import ColorConverter

  @rgb_data [
    # red_1
    21,
    # green_1
    127,
    # blue_1
    253,
    # red_2
    187,
    # green_2
    67,
    # blue_2
    159,
    # ...and so on
    61,
    171,
    220,
    0,
    72,
    124,
    250,
    48,
    89,
    89,
    92,
    211
  ]

  def run_with_chunk do
    @rgb_data
    |> Enum.chunk_every(3)
    |> Enum.map(fn _rgb = [red, green, blue] ->
      rgb_to_hex(red, green, blue)
    end)
  end

  def run_with_recursion do
    @rgb_data
    |> convert_each
  end

  defp convert_each([red, green, blue | tail]) do
    [rgb_to_hex(red, green, blue) | convert_each(tail)]
  end

  defp convert_each([]) do
    []
  end
end
