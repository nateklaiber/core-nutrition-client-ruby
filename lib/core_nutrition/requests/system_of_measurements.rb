module CoreNutrition
  module Requests
    class SystemOfMeasurements
      # Retrieve the list of nutrition plans
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.list(params={})
        rel   = CoreNutrition::Client.rel_for('rels/system-of-measurements')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params)

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
        end

        CoreNutrition::Response.new(request)
      end

      # Retrieve the instance of a nutrition plan
      #
      # @param id [Integer]
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.retrieve(id, params={})
        raise CoreNutrition::Errors::InvalidArgumentError.new("id must be provided") if id.nil?

        rel   = CoreNutrition::Client.rel_for('rels/system-of-measurement')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params.merge!(id: id.to_s))

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end

