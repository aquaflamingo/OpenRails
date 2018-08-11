module UserHelper

	def user_avatar user
		if user.avatar.attached?
			image_tag  user.avatar,class:"is-rounded"
		end
	end

	def completed_topics user
		user.topics.select{|topic| topic.completed?}
	end

	def current_user_owns_profile user
		if user
			current_user.id.equal?(user.id)
		end
	end
end
