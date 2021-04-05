defmodule ColorConverter do
  def rgb_to_hex(red, green, blue) do
    [red, green, blue]
    |> Enum.map(&Integer.to_string(&1, 16))
    |> Enum.map(&String.pad_leading(&1, 2, "0"))
    |> Enum.join()
  end
end
