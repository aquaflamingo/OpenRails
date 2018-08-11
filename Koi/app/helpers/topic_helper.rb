module TopicHelper
	include UsesDefaultAssets

	def topic_image topic
		if topic.image.attached?
			image_tag topic.image
		end
	end

	def last_active_time topic
		topic.updated_at.to_formatted_s(:long_ordinal)
	end
end
