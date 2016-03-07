require 'hashie'

require_relative 'railtie' if defined?(::Rails)

module Confie
  @@_files = []

  def files
    @@_files
  end

  def files=(files)
    @@_files = files
  end

  def load!
    load files
  end

  def extend!(mod, name = 'settings')
    mod.extend load!.to_module(name)
  end

  def load(files)
    content = Hashie::Mash.new
    Array(files).flatten.compact.uniq.each do |f|
      next unless File.exists?(f)
      content.deep_merge! Hashie::Mash.load(f)
    end
    content
  end

  extend self
end
