defmodule PrimacyTest do
  use ExUnit.Case
  doctest Primacy

  test "is_prime?" do
    refute Primacy.is_prime?(-1)
    refute Primacy.is_prime?(0)
    refute Primacy.is_prime?(1)
    assert Primacy.is_prime?(123_456_794_333)
  end

  test "primes_near" do
    assert [601] = Primacy.primes_near(601)
    assert [601, 607] = Primacy.primes_near(601, count: 2)
    assert [593, 599, 601] = Primacy.primes_near(601, count: 3, dir: :below)
    assert [599, 601, 607] = Primacy.primes_near(601, count: 3, dir: :around)
    assert [601, 607, 613] = Primacy.primes_near(601, count: 3, dir: :above)
  end
end
