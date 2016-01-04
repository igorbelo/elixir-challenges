Code.load_file("line_break.exs")
ExUnit.start

defmodule LineBreakTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO
  @sentence "People who live in glass houses should not throw stones"

  test "assert the output with column size 10" do
    fun = fn ->
      LineBreak.break(@sentence, 10)
    end
    assert capture_io(fun) == "People who\nlive in\nglass\nhouses\nshould not\nthrow\nstones"
  end

  test "assert the output with column size 15" do
    fun = fn ->
      LineBreak.break(@sentence, 15)
    end
    assert capture_io(fun) == "People who live\nin glass houses\nshould not\nthrow stones"
  end

  test "assert the output with column size 1" do
    fun = fn ->
      LineBreak.break(@sentence, 1)
    end
    assert capture_io(fun) == "People\nwho\nlive\nin\nglass\nhouses\nshould\nnot\nthrow\nstones"
  end

  test "assert the output with column size 54" do
    fun = fn ->
      LineBreak.break(@sentence, 54)
    end
    assert capture_io(fun) == "People who live in glass houses should not throw\nstones"
  end

  test "assert the output with column size the same as the sentence size" do
    fun = fn ->
      LineBreak.break(@sentence, 55)
    end
    assert capture_io(fun) == "People who live in glass houses should not throw stones"
  end
end
