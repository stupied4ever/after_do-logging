module AfterDo
  module Logging
    class Aspect
      def initialize(target_class, logger = AfterDo::Logging.logger)
        @target_class = target_class
        @logger = logger
      end

      def log_start(target_method)
        target_class.before target_method do |*args, _|
          method = "#{target_class}##{target_method}"

          log_step('Started', method, args)
        end
      end

      def log_finish(target_method)
        target_class.after target_method do |*args, _|
          method = "#{target_class}##{target_method}"

          log_step('Finished', method, args)
        end
      end

      protected

      attr_reader :target_class, :logger

      private

      def log_step(prefix, method, args)
        arg_text = args.map(&:inspect).join(', ')
        msg = "#{prefix}: #{method}(#{arg_text})"
        logger.info(msg)
      end
    end
  end
end
