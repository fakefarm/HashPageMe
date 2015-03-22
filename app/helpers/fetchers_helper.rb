module FetchersHelper
class Greeter # PRESENTER greeter_presenter pass user to greeter so instead of logic in view, logic is in greeter
end

  def greeting
    Greeter.new(@fetcher.username).greeting
    "Good Afternoon, FOO"
  end
end
