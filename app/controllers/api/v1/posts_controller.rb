# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
  def index
    posts = Post.all.shuffle

    render_model(posts, :ok) if posts.any?
  end
end
