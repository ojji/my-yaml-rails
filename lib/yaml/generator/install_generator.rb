require 'rails/generators'

module Yaml
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.join(File.dirname(__FILE__), "template")

			def add_assets
				insert_into_file "app/assets/javascripts/application#{detect_js[0]}", "#{detect_js[1]} require jquery.tabs\n", :after => "jquery_ujs\n"
				insert_into_file "app/assets/javascripts/application#{detect_js[0]}", "#{detect_js[1]} require jquery.syncheight\n", :after => "jquery.tabs\n"
			end

			def detect_js
				return ['.coffee', '#='] if File.exists?('app/assets/javascripts/application.coffee')
				return ['.js.coffee', '#='] if File.exists?('app/assets/javascripts/application.js.coffee')
				return ['.js', '//='] if File.exists?('app/assets/javascripts/application.js')
			end

			def create_layout
				template "application.html.erb", "app/views/layouts/application.html.erb"
			end
		end
	end
end