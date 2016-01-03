Code.load_file("change.exs")
ExUnit.start

defmodule ChangeTest do
  use ExUnit.Case, async: true
  import ExUnit.CaptureIO

  test "assert 0.00 change" do
    fun = fn ->
      Change.execute(100.0, 100.0)
    end
    assert capture_io(fun) == ""
  end

  test "assert 100.00 change" do
    fun = fn ->
      Change.execute(100.0, 200.0)
    end
    assert capture_io(fun) == "1x 100.0\n"
  end

  test "assert 150.00 change" do
    fun = fn ->
      Change.execute(150.0, 300.0)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n"
  end

  test "assert 151.00 change" do
    fun = fn ->
      Change.execute(151.0, 302.0)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n1x 1.0\n"
  end

  test "assert 154.00 change" do
    fun = fn ->
      Change.execute(154.0, 308.0)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n4x 1.0\n"
  end

  test "assert 155.00 change" do
    fun = fn ->
      Change.execute(155.0, 310.0)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n1x 5.0\n"
  end

  test "assert 155.25 change" do
    fun = fn ->
      Change.execute(155.25, 310.50)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n1x 5.0\n2x 0.1\n1x 0.05\n"
  end

  test "assert 155.58 change" do
    fun = fn ->
      Change.execute(155.58, 311.16)
    end
    assert capture_io(fun) == "1x 100.0\n1x 50.0\n1x 5.0\n1x 0.5\n1x 0.05\n3x 0.01\n"
  end
end
