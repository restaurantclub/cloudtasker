# frozen_string_literal: true

class UniqExecutingWorker
  include Cloudtasker::Worker

  cloudtasker_options lock: :while_executing, on_conflict: :reschedule, lock_ttl: 90

  def unique_args(args)
    [args[0], args[1]]
  end

  def perform(arg1, arg2, arg3)
    logger.info("#{self.class} with args=#{[arg1, arg2, arg3].inspect} starting...")
    sleep(10)
    logger.info("#{self.class} with args=#{[arg1, arg2, arg3].inspect} done!")
  end
end
