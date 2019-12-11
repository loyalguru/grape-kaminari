module Grape
  module Kaminari
    class MaxValueValidator < Grape::Validations::Base
      def validate_param!(attr_name, params)
        return unless params[attr_name]

        attr = params[attr_name]
        if attr && @option && attr > @option
          message = "must be less than or equal #{@option}"
          if Gem::Version.new(Grape::VERSION) >= Gem::Version.new('0.9.0')
            raise Grape::Exceptions::Validation, params: [@scope.full_name(attr_name)], message: message
          else
            raise Grape::Exceptions::Validation, param: @scope.full_name(attr_name), message: message
          end
        end
      end
    end
  end
end
