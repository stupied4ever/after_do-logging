module AfterDo
  module Logging
    class StateTransitionAspect
      def initialize(target_class, logger = AfterDo::Logging.logger)
        @target_class = target_class
        @logger = logger
      end

      def log_start(target_method)
        target_class.before target_method do |*args, object|
          method = "#{target_class}##{target_method}"

          msg = "Started #{id(object)}transition from #{object.status} " \
            " with #{method}#{format_args(args)}"
          logger.info(msg)
        end
      end

      def log_finish(target_method)
        target_class.after target_method do |*args, object|
          method = "#{target_class}##{target_method}"

          msg = "Finished #{id(object)}transition to #{object.status} " \
            "with #{method}#{format_args(args)}"
          logger.info(msg)
        end
      end

      protected

      attr_reader :target_class, :logger

      private

      def format_args(args)
        "(#{args.join(', ')})" if args.any?
      end

      def id(object)
        "[#{object.id}] " if object.respond_to?(:id)
      end
    end
  end
end
