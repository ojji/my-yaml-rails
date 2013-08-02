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
				insert_into_file "app/assets/stylesheets/application#{detect_css_format[0]}", "#{detect_css_format[1]} require yaml_modules_and_settings\n", :after => "require_self\n"
			end

			def detect_js_format
				return ['.coffee', '#='] if File.exists?('app/assets/javascripts/application.coffee')
				return ['.js.coffee', '#='] if File.exists?('app/assets/javascripts/application.js.coffee')
				return ['.js', '//='] if File.exists?('app/assets/javascripts/application.js')
			end

			def detect_css_format
        return ['.css', ' *='] if File.exist?('app/assets/stylesheets/application.css')
        return ['.css.sass', ' //='] if File.exist?('app/assets/stylesheets/application.css.sass')
        return ['.sass', ' //='] if File.exist?('app/assets/stylesheets/application.sass')
        return ['.css.scss', ' //='] if File.exist?('app/assets/stylesheets/application.css.scss')
        return ['.scss', ' //='] if File.exist?('app/assets/stylesheets/application.scss')
      end

			def create_layout
				template "application.html.erb", "app/views/layouts/application.html.erb"
			end
		end
	end
end