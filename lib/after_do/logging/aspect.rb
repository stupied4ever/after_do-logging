module AfterDo
  module Logging
    class Aspect
      def initialize(target_class, logger = AfterDo::Logging.logger)
        @target_class = target_class
        @logger = logger
      end

      def log_start(target_method)
        target_class.before target_method do |*args, _|
          start_time = Time.now
          method = "#{target_class}##{target_method}"

          log_step(method, start_time, args)
        end
      end

      def log_finish(target_method)
        target_class.after target_method do |*args, _|
          finish_time = Time.now
          method = "#{target_class}##{target_method}"

          log_step(method, finish_time, args)
        end
      end

      protected

      attr_reader :target_class, :logger

      private

      def log_step(method, time, args)
        arg_text = args.map(&:inspect).join(', ')
        msg = "Finished: Method=#{method} Time=#{time} Args='#{arg_text}'"
        logger.info(msg)
      end
    end
  end
end
