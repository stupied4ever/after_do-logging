require 'git-hooks'

GitHooks.validate_hooks!

require_relative '../lib/after_do/logging'
