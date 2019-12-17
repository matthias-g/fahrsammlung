module WelcomeHelper
	#helpers to use devise in welcome login
	def resource_name
		:user
	end

	def resource
		@resource ||= User.new
	end

	def devise_mapping
		@devise_mapping ||= Devise.mappings[:user]
	end

	def welcome_sanitize(string)
		string.gsub("\n", " ").gsub("\r", "").to_json[1...-1]
	end

	def welcome_sanitize_int(integer)
		integer.to_json[1...-1]
	end
end
