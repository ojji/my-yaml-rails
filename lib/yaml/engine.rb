module Yaml
	class Engine < Rails::Engine

		add_paths_block = lambda { |app|
			app.config.assets.paths << File.expand_path("../../../scss", __FILE__) 
			app.config.assets.paths << File.expand_path("../../../js", __FILE__) 

			app.config.assets.precompile += %w(yaml-focusfix.js html5shiv.js html5shiv-printshiv.js iehacks.css)
		}

		initializer	'yaml.update_asset_paths', &add_paths_block
		initializer	'yaml.update_asset_paths', :group => :assets, &add_paths_block
	end
end