defmodule PrimacyTest do
  use ExUnit.Case
  doctest Primacy

  test "is_prime?" do
    refute Primacy.is_prime?(-1)
    refute Primacy.is_prime?(0)
    refute Primacy.is_prime?(1)
    assert Primacy.is_prime?(123_456_794_333)
  end
end
