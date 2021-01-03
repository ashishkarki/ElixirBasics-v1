defmodule TaskExample do
  def double(x) do
    :timer.sleep(2000)
    IO.puts "Result from async task: #{x * 2}"
  end

  def runner() do
    task = Task.async(TaskExample, :double, [2000])

    timeout = 500
    IO.puts("Emulating some other task by sleeping #{timeout}ms")
    :timer.sleep(timeout)
    Task.await(task)
  end
end
