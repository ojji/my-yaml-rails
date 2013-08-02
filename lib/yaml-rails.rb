require "yaml/version"

if defined?(Rails::Generators::Base)
	require "yaml/generator/install_generator"
end

module Yaml
	if defined?(Rails::Engine)
		require "yaml/engine"
	elsif defined?(Sprockets)
		require "yaml/sprockets"
	end
end