defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x,y}) do
    distance_point = :math.sqrt(abs(:math.pow(x, 2)) + abs(:math.pow(y, 2)))
    calculate_score(distance_point)
  end

  defp calculate_score(distance_point) when distance_point > 10, do: 0
  defp calculate_score(distance_point) when distance_point <= 10 and distance_point > 5, do: 1
  defp calculate_score(distance_point) when distance_point <= 5 and distance_point > 1, do: 5
  defp calculate_score(distance_point) when distance_point <= 1 and distance_point > -1, do: 10
end
