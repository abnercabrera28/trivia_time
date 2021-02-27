# frozen_string_literal: true

require_relative "multi_trivia/version"

require "pry"
require "httparty"
require "htmlentities"
require "tty-prompt"

require_relative "./multi_trivia/api"
require_relative "./multi_trivia/cli"
require_relative "./multi_trivia/trivia_info"
