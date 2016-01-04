defmodule LineBreak do
  def break(sentence, size) do
    String.split(sentence, " ")
    |> Enum.map_reduce(0,
      fn word, current_size ->
        word_size = String.length(word)
        if (word_size + current_size <= size) do
          IO.write "#{word} "
          {word, current_size + word_size + 1}
        else
          IO.write "\n#{word} "
          {word, word_size + 1}
        end
      end
    )
  end
end
