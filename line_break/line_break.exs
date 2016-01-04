defmodule LineBreak do
  def break(sentence, size) do
    String.split(sentence, " ") |> Enum.map_reduce(0, write(size))
  end

  defp write(size) do
    fn word, current_size ->
      word_size = String.length(word)
      ret = cond do
        word_size + current_size <= size ->
          if current_size > 0, do: IO.write " "
          {word, current_size + word_size + 1}
        true ->
          if current_size > 0, do: IO.write "\n"
          {word, word_size + 1}
      end
      IO.write "#{word}"
      ret
    end
  end
end
