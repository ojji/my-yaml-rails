module Yaml
	class Engine < Rails::Engine

		initializer	'yaml.update_asset_paths' do |app|
			app.config.assets.paths << File.expand_path("../../../scss", __FILE__) 
			app.config.assets.paths << File.expand_path("../../../js", __FILE__) 

			app.config.assets.precompile += %w(yaml-focusfix.js html5shiv.js html5shiv-printshiv.js)
		end
	end
end