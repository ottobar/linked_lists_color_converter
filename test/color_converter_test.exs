defmodule ColorConverterTest do
  use ExUnit.Case
  doctest ColorConverter

  describe "rgb_to_hex/3" do
    test "converts red, green, blue color values to a hexadecimal string" do
      expected_hex = "00487C"
      actual_hex = ColorConverter.rgb_to_hex(0, 72, 124)
      assert actual_hex == expected_hex
    end
  end
end
