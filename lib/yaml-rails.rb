require "yaml/version"

module Yaml
	if defined?(Rails::Engine)
		require "yaml/engine"
	elsif defined?(Sprockets)
		require "yaml/sprockets"
	end
end