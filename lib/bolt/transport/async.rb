# frozen_string_literal: true

require 'bolt/node/errors'
require 'bolt/transport/base'
require 'json'
require 'shellwords'

module Bolt
  module Transport
    class Async < Base
      def self.options
        %w[timeout fifo-name]
      end

      def self.validate(options)
        logger = Logging.logger[self]

        timeout_value = options['timeout']
        unless timeout.is_a?(Integer) || timeout_value.nil?
          error_msg = "connect-timeout value must be an Integer, received #{timeout}:#{timeout.class}"
          raise Bolt::ValidationError, error_msg
        end
      end

      def run_command(target, command, options = {})
        #//TODO
        puts(command)
      end

      def run_script(target, script, arguments, options = {})
        puts(target)
        puts(script)
        puts(arguments)
      end

      def upload(target, source, destination, options = {})
        #//TODO
        puts(target)
      end

      def connected?(target)
        #//TODO can I check the fifo queue?
        puts(target)
        return true
      end

      def build_request(targets, task, arguments, description = nil)
        body = { task: task.name,
                 environment: @environment,
                 noop: aruments['_noop'],
                 params: arguments.reject { |k, _| k.start_with?('_') },
                 scope: {
                   nodes: targets.map(&:host)
                 }}
        body[:description] = description if description
        body[:plan_job] = @plan_job if @plan_job
        body
      end

      def run_task(target,task, arguments, options ={})
        #//TODO
        request = build_request(targets,task,,arguments,options['_description'])
        puts(task)
        puts(request)
      end

    end
  end
end



