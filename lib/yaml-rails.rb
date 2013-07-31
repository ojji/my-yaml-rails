require "yaml/version"

module Yaml
	if defined?(Rails::Engine)
		require "yaml/engine"
	end
end