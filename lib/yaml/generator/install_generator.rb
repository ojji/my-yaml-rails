require 'rails/generators'

module Yaml
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.join(File.dirname(__FILE__), "template")

			def add_assets
				#to-do
			end

			def create_layout
				template "application.html.erb", "app/views/layouts/application.html.erb"
			end
		end
	end
end