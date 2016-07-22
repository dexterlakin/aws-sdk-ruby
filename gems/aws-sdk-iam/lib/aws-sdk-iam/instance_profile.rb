# WARNING ABOUT GENERATED CODE
#
# The AWS SDK for Ruby is largely generated from JSON service definitions. Edits
# made against this file will be lost the next time the SDK updates.  To resolve
# an issue with generated code, a change is likely needed in the generator or
# in one of the service JSON definitions.
#
# * https://github.com/aws/aws-sdk-ruby/tree/master/gems/aws-sdk-code-generator
# * https://github.com/aws/aws-sdk-ruby/tree/master/apis
#
# Open a GitHub issue if you have questions before making changes.  Pull
# requests against this file will be automatically closed.
#
# WARNING ABOUT GENERATED CODE
module Aws
  module IAM
    class InstanceProfile

      extend Aws::Deprecations

      # @overload def initialize(name, options = {})
      #   @param [String] name
      #   @option options [Client] :client
      # @overload def initialize(options = {})
      #   @option options [required, String] :name
      #   @option options [Client] :client
      def initialize(*args)
        options = Hash === args.last ? args.pop.dup : {}
        @name = extract_name(args, options)
        @data = options.delete(:data)
        @client = options.delete(:client) || Client.new(options)
      end

      # @!group Read-Only Attributes

      # @return [String]
      def name
        @name
      end
      alias :instance_profile_name :name

      # The path to the instance profile. For more information about paths,
      # see [IAM Identifiers][1] in the *Using IAM* guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def path
        data.path
      end

      # The stable and unique string identifying the instance profile. For
      # more information about IDs, see [IAM Identifiers][1] in the *Using
      # IAM* guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def instance_profile_id
        data.instance_profile_id
      end

      # The Amazon Resource Name (ARN) specifying the instance profile. For
      # more information about ARNs and how to use them in policies, see [IAM
      # Identifiers][1] in the *Using IAM* guide.
      #
      #
      #
      # [1]: http://docs.aws.amazon.com/IAM/latest/UserGuide/Using_Identifiers.html
      # @return [String]
      def arn
        data.arn
      end

      # The date when the instance profile was created.
      # @return [Time]
      def create_date
        data.create_date
      end

      # @!endgroup

      # @return [Client]
      def client
        @client
      end

      # Loads, or reloads {#data} for the current {InstanceProfile}.
      # Returns `self` making it possible to chain methods.
      #
      #     instance_profile.reload.data
      #
      # @return [self]
      def load
        resp = @client.get_instance_profile(instance_profile_name: @name)
        @data = resp.instanceprofile
        self
      end
      alias :reload :load

      # @return [Types::InstanceProfile]
      #   Returns the data for this {InstanceProfile}. Calls
      #   {Client#get_instance_profile} if {#data_loaded?} is `false`.
      def data
        load unless @data
        @data
      end

      # @return [Boolean]
      #   Returns `true` if this resource is loaded.  Accessing attributes or
      #   {#data} on an unloaded resource will trigger a call to {#load}.
      def data_loaded?
        !!@data
      end

      # @return [Boolean]
      #   Returns `true` if the InstanceProfile exists.
      def exists?
        begin
          wait_until_exists(max_attempts: 1)
          true
        rescue Aws::Waiters::Errors::UnexpectedError => e
          raise e.error
        rescue Aws::Waiters::Errors::WaiterFailed
          false
        end
      end

      # @param options ({})
      # @option options [Integer] :max_attempts (40)
      # @option options [Float] :delay (1)
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      # @return [InstanceProfile]
      def wait_until_exists(options = {})
        waiter = Waiters::InstanceProfileExists.new(options.merge(client: @client))
        yield_waiter_and_warn(waiter, &Proc.new) if block_given?
        waiter.wait(instance_profile_name: @name)
        InstanceProfile.new({
          name: @name,
          client: @client
        })
      end

      # @!group Actions

      # @param [Hash] options ({})
      # @option options [required, String] :role_name
      #   The name of the role to add.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [EmptyStructure]
      def add_role(options = {})
        options = options.merge(instance_profile_name: @name)
        resp = @client.add_role_to_instance_profile(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @return [EmptyStructure]
      def delete(options = {})
        options = options.merge(instance_profile_name: @name)
        resp = @client.delete_instance_profile(options)
        resp.data
      end

      # @param [Hash] options ({})
      # @option options [required, String] :role_name
      #   The name of the role to remove.
      #
      #   The [regex pattern][1] for this parameter is a string of characters
      #   consisting of upper and lowercase alphanumeric characters with no
      #   spaces. You can also include any of the following characters: =,.@-
      #
      #
      #
      #   [1]: http://wikipedia.org/wiki/regex
      # @return [EmptyStructure]
      def remove_role(options = {})
        options = options.merge(instance_profile_name: @name)
        resp = @client.remove_role_from_instance_profile(options)
        resp.data
      end

      # @!group Associations

      # @return [Role::Collection]
      def roles
        batch = []
        data.roles.each do |r|
          batch << Role.new(
            name: r.role_name,
            data: r,
            client: @client
          )
        end
        Role::Collection.new([batch], size: batch.size)
      end

      # @deprecated
      # @api private
      def identifiers
        { name: @name }
      end
      deprecated(:identifiers)

      private

      def extract_name(args, options)
        value = args[0] || options.delete(:name)
        case value
        when String then value
        when nil then raise ArgumentError, "missing required option :name"
        else
          msg = "expected :name to be a String, got #{value.class}"
          raise ArgumentError, msg
        end
      end

      def yield_waiter_and_warn(waiter, &block)
        if !@waiter_block_warned
          msg = "pass options to configure the waiter; "
          msg << "yielding the waiter is deprecated"
          warn(msg)
          @waiter_block_warned = true
        end
        yield(waiter.waiter)
      end

      class Collection

        include Aws::Resources::Collection

        # @return [Enumerator<InstanceProfile>]
        def each(&block)
          enum = super
          enum.each(&block) if block
          enum
        end

      end
    end
  end
end