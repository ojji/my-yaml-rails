require 'rails/generators'

module Yaml
	module Generators
		class InstallGenerator < Rails::Generators::Base
			source_root File.join(File.dirname(__FILE__), "template")

			def add_assets
				insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require jquery.tabs\n", :after => "jquery_ujs\n"
				insert_into_file "app/assets/javascripts/application#{detect_js_format[0]}", "#{detect_js_format[1]} require jquery.syncheight\n", :after => "jquery.tabs\n"
				yaml_globals = File.join(File.dirname(__FILE__), "..", "..", "..", "scss", "_yaml-var-globals.scss")
				yaml_typography = File.join(File.dirname(__FILE__), "..", "..", "..", "scss", "_yaml-var-typography.scss")
				yaml_layouts = File.join(File.dirname(__FILE__), "..", "..", "..", "scss", "_layouts.scss")
				create_file "app/assets/stylesheets/yaml_modules_and_settings.scss", File.read(yaml_globals)
				append_to_file "app/assets/stylesheets/yaml_modules_and_settings.scss", File.read(yaml_typography)
				append_to_file "app/assets/stylesheets/yaml_modules_and_settings.scss", "\n@import 'yaml';\n"
				append_to_file "app/assets/stylesheets/yaml_modules_and_settings.scss", File.read(yaml_layouts)
				append_to_file "app/assets/stylesheets/application.css.scss", "@import 'yaml_modules_and_settings';\n"
			end

			def detect_js_format
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