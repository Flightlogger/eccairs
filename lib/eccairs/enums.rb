# frozen_string_literal: true

require "yaml"

module Eccairs
  module Enums
    class << self
      def get(name)
        name = name.to_s
        cache[name] ||= load_one(name)
      end

      def all
        Dir.glob(File.join(load_path, "*.yml")).each_with_object({}) do |path, hash|
          key = File.basename(path, ".yml")
          hash[key] = get(key)
        end
      end

      def reset!
        @cache = nil
      end

      def load_path
        @load_path || default_load_path
      end

      def load_path=(path)
        @load_path = path
        reset!
      end

      private

      def cache
        @cache ||= {}
      end

      def default_load_path
        File.expand_path("../../config/enums", __dir__)
      end

      def load_one(name)
        path = File.join(load_path, "#{name}.yml")
        raise KeyError, "No enum definition found for '#{name}' at #{path}" unless File.file?(path)

        data = YAML.safe_load_file(path, permitted_classes: [Symbol])
        raw_values = data["values"]

        result = {
          attribute_id: data["attribute_id"].to_s,
          xml_tag: data["xml_tag"].to_s,
          sequence: data["sequence"]&.to_i
        }

        if raw_values.is_a?(Hash)
          result[:values] = raw_values.keys
          result[:descriptions] = raw_values
        else
          result[:values] = Array(raw_values)
          result[:descriptions] = {}
        end

        result[:hierarchy] = data["hierarchy"] if data["hierarchy"]

        result
      end
    end
  end
end
