class HomeController < ApplicationController
  def top
    @post = Post.all
  end

  def index
    @post = Post.all
  end

end
