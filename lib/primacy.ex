defmodule Primacy do
  @moduledoc """
  Prime number handling of various sorts
  """

  @doc """
  Prime check.

  ## Examples

      iex> Primacy.is_prime?(61)
      true

      iex> Primacy.is_prime?(62)
      false

  """
  def is_prime?(n) when n < 2, do: false
  def is_prime?(2), do: true
  def is_prime?(n) when rem(n, 2) == 0, do: false
  # Trial division should be good enough for our purposes
  def is_prime?(n), do: is_prime?(n, 3)

  defp is_prime?(n, k) when n < k * k, do: true
  defp is_prime?(n, k) when rem(n, k) == 0, do: false
  defp is_prime?(n, k), do: is_prime?(n, k + 2)

  @doc """
  Generate a list of primes near a given number

  Options:

  - `count`: how long a list to produce? (default: 1)
  - `dir`: `:below`, `:above`, `:around` (default: `:around`)

  ## Examples

      iex> Primacy.primes_near(600)
      [601]

      iex> Primacy.primes_near(600, count: 10)
      [571, 577, 587, 593, 599, 601, 607, 613, 617, 619]

      iex> Primacy.primes_near(600, count: 10, dir: :below)
      [541, 547, 557, 563, 569, 571, 577, 587, 593, 599]

  """
  def primes_near(n, opts \\ []) do
    {c, d} = parse_options(opts)

    {a, i} =
      case is_prime?(n) do
        true -> {[n], c - 1}
        false -> {[], c}
      end

    down = fn c -> gather_primes(n - 1, c, -1, []) end
    up = fn c -> gather_primes(n + 1, c, 1, []) end

    case d do
      :below ->
        down.(i) ++ a

      :above ->
        a ++ up.(i)

      :around ->
        half = div(i, 2)
        down.(half) ++ a ++ up.(half + rem(i, 2))
    end
  end

  defp gather_primes(_, 0, 1, acc), do: Enum.reverse(acc)
  defp gather_primes(_, 0, -1, acc), do: acc

  defp gather_primes(n, c, i, acc) do
    case is_prime?(n) do
      false -> gather_primes(n + i, c, i, acc)
      true -> gather_primes(n + i, c - 1, i, [n | acc])
    end
  end

  defp parse_options(o) do
    {Keyword.get(o, :count, 1), Keyword.get(o, :dir, :around)}
  end
end
