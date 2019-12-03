# frozen_string_literal: true

class Api::V1::PostsController < ApplicationController
	def index
		posts = Post.all.shuffle

		if posts.any?
			render_model(posts, :ok)
		end
	end
end
