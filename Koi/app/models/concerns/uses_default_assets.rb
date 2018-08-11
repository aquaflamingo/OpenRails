module UsesDefaultAssets

	def random_avatar_image_path
		dir_name =default_avatar_path
		file_name = sample_file(dir_name,/\.png/)
		dir_name.concat file_name
	end

	def random_topic_image_path
		dir_name =default_topic_image_path
		file_name = sample_file(dir_name,/\.svg/)
		dir_name.concat file_name
	end

	private
		def default_avatar_path
			Rails.root.to_s.concat "/app/assets/images/profiles/"
		end

		def default_topic_image_path
			Rails.root.to_s.concat "/app/assets/images/topics/"
		end

	def sample_file dir, extension
			Dir.open(dir).to_a.select {|f| f.downcase.match(extension) }.sample
	end
end