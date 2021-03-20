defmodule Mix.Tasks.Sample do
  use Mix.Task

  @shortdoc "Simply calls the Sample.say/0 function"
  def run(_) do
    # this will start our application
    Mix.Task.run("app.start")

    # calling Sample.say()
    Sample.say()

    # calling more functions
    ErrorHandling.handleError()
    TryCatch.catcherInTheTry()
    # TaskExample.runner()
    MetaprogramBasic.runner()
  end
end
