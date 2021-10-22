module CoreNutrition
  module Requests
    class UserProfiles
      # Retrieve the instance of a user profile
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Response]
      def self.retrieve(params={})

        rel   = CoreNutrition::Client.rel_for('rels/user-profile')
        route = CoreNutrition::Client.routes.find_by_rel(rel)
        url   = route.url_for(params)

        request = CoreNutrition::Client.connection.get do |req|
          req.url(url)
        end

        CoreNutrition::Response.new(request)
      end
    end
  end
end

