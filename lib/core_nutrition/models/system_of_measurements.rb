module CoreNutrition
  module Models
    class SystemOfMeasurements
      include Enumerable

      # Return an instance of the nutrition plans
      #
      # @param collection [Array]
      #
      # @return [CoreNutrition::Models::SystemOfMeasurements]
      def initialize(collection)
        @collection = Array(collection)
      end

      # Helper method to retrieve from the
      # request
      #
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::SystemOfMeasurements]
      def self.list(params={})
        request = CoreNutrition::Requests::SystemOfMeasurements.list(params)

        klass_attributes = []

        request.on(:success) do |resp|
          klass_attributes = resp.data_attributes
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the system of measurements: %s" % [resp.status]) }
        end

        self.new(klass_attributes)
      end

      # Retrieve all options
      #
      # @note: This will retrieve all for now, but should auto paginate
      #
      # @return [Array]
      def self.options(params={})
        records = self.list(per_page: 250)
        records.options
      end

      # Helper method to retrieve from the request
      #
      # @param id [String]
      # @param params [Hash]
      #
      # @return [CoreNutrition::Models::SystemOfMeasurement]
      def self.retrieve(id, params={})
        request = CoreNutrition::Requests::SystemOfMeasurements.retrieve(id, params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::SystemOfMeasurement.new(resp.data_attributes)
        end

        request.on(:failure) do |resp|
          CoreNutrition::Client.configuration.logger.error { ("Failure retrieving the system of measurement: %s" % [resp.status]) }

          return nil
        end
      end

      # Retrieve the model from the request
      #
      # @param id [String]
      # @param params [Hash]
      #
      # @raises [CoreNutrition::Errors::RecordNotFoundError]
      #
      # @return [CoreNutrition::Models::SystemOfMeasurement]
      def self.retrieve!(id, params={})
        request = CoreNutrition::Requests::SystemOfMeasurements.retrieve(id, params)

        request.on(:success) do |resp|
          return CoreNutrition::Models::SystemOfMeasurement.new(resp.data_attributes)
        end

        request.on(404) do
          raise CoreNutrition::Errors::RecordNotFoundError.new("Could not find record with id: %s" % [id])
        end
      end

      def each(&block)
        internal_collection.each(&block)
      end

      # Returns the collection serialized as an array
      #
      # @return [Array]
      def to_a
        self.map(&:to_a)
      end

      def to_option
        self.map(&:to_option)
      end
      alias to_options to_option
      alias options to_option

      private
      def internal_collection
        @collection.map { |record| CoreNutrition::Models::SystemOfMeasurement.new(record) }
      end
    end
  end
end

