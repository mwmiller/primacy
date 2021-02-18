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
end
