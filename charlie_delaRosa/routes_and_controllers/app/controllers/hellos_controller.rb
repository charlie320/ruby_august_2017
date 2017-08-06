class HellosController < ApplicationController

  def hello
    render text: "Hello, CodingDojo"
  end

  def say_hello
    render text: "Saying Hello!"
  end

  def say_hello_name
    if params[:name] == 'michael'
      params[:name] = 'joe'
    end
    render text: "Saying Hello " + params[:name].capitalize
  end

  def say
    render text: "What do you want me to say?"
  end

end
