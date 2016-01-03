defmodule Change do
  @values [100.0, 50.0, 10.0, 5.0, 1.0, 0.5, 0.1, 0.05, 0.01]

  def execute(price, given) do
    change = Float.round(given - price, 2)
    Enum.map_reduce(@values, change, check)
  end

  defp check do
    fn(value, remainder_change) ->
      result = Float.round(remainder_change/value, 2)
      qt = round(Float.floor(result))
      if qt > 0, do: IO.puts "#{qt}x #{value}"
      {qt, remainder_change - value * qt}
    end
  end
end
