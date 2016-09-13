# WARNING ABOUT GENERATED CODE
#
# This file is generated. See the contributing for info on making contributions:
# https://github.com/aws/aws-sdk-ruby/blob/master/CONTRIBUTING.md
#
# WARNING ABOUT GENERATED CODE

require 'seahorse/client/plugins/content_length.rb'
require 'aws-sdk-core/plugins/logging.rb'
require 'aws-sdk-core/plugins/param_converter.rb'
require 'aws-sdk-core/plugins/param_validator.rb'
require 'aws-sdk-core/plugins/user_agent.rb'
require 'aws-sdk-core/plugins/helpful_socket_errors.rb'
require 'aws-sdk-core/plugins/retry_errors.rb'
require 'aws-sdk-core/plugins/global_configuration.rb'
require 'aws-sdk-core/plugins/regional_endpoint.rb'
require 'aws-sdk-core/plugins/request_signer.rb'
require 'aws-sdk-core/plugins/response_paging.rb'
require 'aws-sdk-core/plugins/stub_responses.rb'
require 'aws-sdk-core/plugins/protocols/rest_xml.rb'

module Aws
  module CloudFront
    class Client < Seahorse::Client::Base

      include Aws::ClientStubs
      include Aws::ClientWaiters

      @identifier = :cloudfront

      set_api(ClientApi::API)

      add_plugin(Seahorse::Client::Plugins::ContentLength)
      add_plugin(Aws::Plugins::Logging)
      add_plugin(Aws::Plugins::ParamConverter)
      add_plugin(Aws::Plugins::ParamValidator)
      add_plugin(Aws::Plugins::UserAgent)
      add_plugin(Aws::Plugins::HelpfulSocketErrors)
      add_plugin(Aws::Plugins::RetryErrors)
      add_plugin(Aws::Plugins::GlobalConfiguration)
      add_plugin(Aws::Plugins::RegionalEndpoint)
      add_plugin(Aws::Plugins::RequestSigner)
      add_plugin(Aws::Plugins::ResponsePaging)
      add_plugin(Aws::Plugins::StubResponses)
      add_plugin(Aws::Plugins::Protocols::RestXml)

      # @option options [Logger] :logger
      #   The Logger instance to send log messages to.  If this option
      #   is not set, logging will be disabled.
      # @option options [Symbol] :log_level (:info)
      #   The log level to send messages to the `:logger` at.
      # @option options [Aws::Log::Formatter] :log_formatter (Aws::Log::Formatter.default)
      #   The log formatter.
      # @option options [Boolean] :convert_params (true)
      #   When `true`, an attempt is made to coerce request parameters into
      #   the required types.
      def initialize(**args)
        super
      end

      # @!group API Operations

      # Create a new origin access identity.
      # @option params [required, Types::CloudFrontOriginAccessIdentityConfig] :cloud_front_origin_access_identity_config
      #   The origin access identity\'s configuration information.
      # @return [Types::CreateCloudFrontOriginAccessIdentityResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateCloudFrontOriginAccessIdentityResult#cloud_front_origin_access_identity #CloudFrontOriginAccessIdentity} => Types::CloudFrontOriginAccessIdentity
      #   * {Types::CreateCloudFrontOriginAccessIdentityResult#location #Location} => String
      #   * {Types::CreateCloudFrontOriginAccessIdentityResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_cloud_front_origin_access_identity({
      #     cloud_front_origin_access_identity_config: { # required
      #       caller_reference: "string", # required
      #       comment: "string", # required
      #     },
      #   })
      #
      # @example Response structure
      #   resp.cloud_front_origin_access_identity.id #=> String
      #   resp.cloud_front_origin_access_identity.s3_canonical_user_id #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.caller_reference #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.comment #=> String
      #   resp.location #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_cloud_front_origin_access_identity(params = {}, options = {})
        req = build_request(:create_cloud_front_origin_access_identity, params)
        req.send_request(options)
      end

      # Create a new distribution.
      # @option params [required, Types::DistributionConfig] :distribution_config
      #   The distribution\'s configuration information.
      # @return [Types::CreateDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateDistributionResult#distribution #Distribution} => Types::Distribution
      #   * {Types::CreateDistributionResult#location #Location} => String
      #   * {Types::CreateDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_distribution({
      #     distribution_config: { # required
      #       caller_reference: "string", # required
      #       aliases: {
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       default_root_object: "string",
      #       origins: { # required
      #         quantity: 1, # required
      #         items: [
      #           {
      #             id: "string", # required
      #             domain_name: "string", # required
      #             origin_path: "string",
      #             custom_headers: {
      #               quantity: 1, # required
      #               items: [
      #                 {
      #                   header_name: "string", # required
      #                   header_value: "string", # required
      #                 },
      #               ],
      #             },
      #             s3_origin_config: {
      #               origin_access_identity: "string", # required
      #             },
      #             custom_origin_config: {
      #               http_port: 1, # required
      #               https_port: 1, # required
      #               origin_protocol_policy: "http-only", # required, accepts http-only, match-viewer, https-only
      #               origin_ssl_protocols: {
      #                 quantity: 1, # required
      #                 items: ["SSLv3"], # required, accepts SSLv3, TLSv1, TLSv1.1, TLSv1.2
      #               },
      #             },
      #           },
      #         ],
      #       },
      #       default_cache_behavior: { # required
      #         target_origin_id: "string", # required
      #         forwarded_values: { # required
      #           query_string: false, # required
      #           cookies: { # required
      #             forward: "none", # required, accepts none, whitelist, all
      #             whitelisted_names: {
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #           },
      #           headers: {
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #           query_string_cache_keys: {
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #         },
      #         trusted_signers: { # required
      #           enabled: false, # required
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #         viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #         min_ttl: 1, # required
      #         allowed_methods: {
      #           quantity: 1, # required
      #           items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #           cached_methods: {
      #             quantity: 1, # required
      #             items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #           },
      #         },
      #         smooth_streaming: false,
      #         default_ttl: 1,
      #         max_ttl: 1,
      #         compress: false,
      #       },
      #       cache_behaviors: {
      #         quantity: 1, # required
      #         items: [
      #           {
      #             path_pattern: "string", # required
      #             target_origin_id: "string", # required
      #             forwarded_values: { # required
      #               query_string: false, # required
      #               cookies: { # required
      #                 forward: "none", # required, accepts none, whitelist, all
      #                 whitelisted_names: {
      #                   quantity: 1, # required
      #                   items: ["string"],
      #                 },
      #               },
      #               headers: {
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #               query_string_cache_keys: {
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #             },
      #             trusted_signers: { # required
      #               enabled: false, # required
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #             viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #             min_ttl: 1, # required
      #             allowed_methods: {
      #               quantity: 1, # required
      #               items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #               cached_methods: {
      #                 quantity: 1, # required
      #                 items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #               },
      #             },
      #             smooth_streaming: false,
      #             default_ttl: 1,
      #             max_ttl: 1,
      #             compress: false,
      #           },
      #         ],
      #       },
      #       custom_error_responses: {
      #         quantity: 1, # required
      #         items: [
      #           {
      #             error_code: 1, # required
      #             response_page_path: "string",
      #             response_code: "string",
      #             error_caching_min_ttl: 1,
      #           },
      #         ],
      #       },
      #       comment: "string", # required
      #       logging: {
      #         enabled: false, # required
      #         include_cookies: false, # required
      #         bucket: "string", # required
      #         prefix: "string", # required
      #       },
      #       price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #       enabled: false, # required
      #       viewer_certificate: {
      #         cloud_front_default_certificate: false,
      #         iam_certificate_id: "string",
      #         acm_certificate_arn: "string",
      #         ssl_support_method: "sni-only", # accepts sni-only, vip
      #         minimum_protocol_version: "SSLv3", # accepts SSLv3, TLSv1
      #         certificate: "string",
      #         certificate_source: "cloudfront", # accepts cloudfront, iam, acm
      #       },
      #       restrictions: {
      #         geo_restriction: { # required
      #           restriction_type: "blacklist", # required, accepts blacklist, whitelist, none
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #       },
      #       web_acl_id: "string",
      #     },
      #   })
      #
      # @example Response structure
      #   resp.distribution.id #=> String
      #   resp.distribution.arn #=> String
      #   resp.distribution.status #=> String
      #   resp.distribution.last_modified_time #=> Time
      #   resp.distribution.in_progress_invalidation_batches #=> Integer
      #   resp.distribution.domain_name #=> String
      #   resp.distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.distribution.active_trusted_signers.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.distribution.distribution_config.caller_reference #=> String
      #   resp.distribution.distribution_config.aliases.quantity #=> Integer
      #   resp.distribution.distribution_config.aliases.items #=> Array
      #   resp.distribution.distribution_config.aliases.items[0] #=> String
      #   resp.distribution.distribution_config.default_root_object #=> String
      #   resp.distribution.distribution_config.origins.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].id #=> String
      #   resp.distribution.distribution_config.origins.items[0].domain_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].origin_path #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution.distribution_config.origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution.distribution_config.default_cache_behavior.target_origin_id #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.compress #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution.distribution_config.custom_error_responses.quantity #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items #=> Array
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_code #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution.distribution_config.comment #=> String
      #   resp.distribution.distribution_config.logging.enabled #=> Boolean
      #   resp.distribution.distribution_config.logging.include_cookies #=> Boolean
      #   resp.distribution.distribution_config.logging.bucket #=> String
      #   resp.distribution.distribution_config.logging.prefix #=> String
      #   resp.distribution.distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution.distribution_config.enabled #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution.distribution_config.viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution.distribution_config.viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution.distribution_config.viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution.distribution_config.viewer_certificate.certificate #=> String
      #   resp.distribution.distribution_config.viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items #=> Array
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution.distribution_config.web_acl_id #=> String
      #   resp.location #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_distribution(params = {}, options = {})
        req = build_request(:create_distribution, params)
        req.send_request(options)
      end

      # Create a new distribution with tags.
      # @option params [required, Types::DistributionConfigWithTags] :distribution_config_with_tags
      #   The distribution\'s configuration information.
      # @return [Types::CreateDistributionWithTagsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateDistributionWithTagsResult#distribution #Distribution} => Types::Distribution
      #   * {Types::CreateDistributionWithTagsResult#location #Location} => String
      #   * {Types::CreateDistributionWithTagsResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_distribution_with_tags({
      #     distribution_config_with_tags: { # required
      #       distribution_config: { # required
      #         caller_reference: "string", # required
      #         aliases: {
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #         default_root_object: "string",
      #         origins: { # required
      #           quantity: 1, # required
      #           items: [
      #             {
      #               id: "string", # required
      #               domain_name: "string", # required
      #               origin_path: "string",
      #               custom_headers: {
      #                 quantity: 1, # required
      #                 items: [
      #                   {
      #                     header_name: "string", # required
      #                     header_value: "string", # required
      #                   },
      #                 ],
      #               },
      #               s3_origin_config: {
      #                 origin_access_identity: "string", # required
      #               },
      #               custom_origin_config: {
      #                 http_port: 1, # required
      #                 https_port: 1, # required
      #                 origin_protocol_policy: "http-only", # required, accepts http-only, match-viewer, https-only
      #                 origin_ssl_protocols: {
      #                   quantity: 1, # required
      #                   items: ["SSLv3"], # required, accepts SSLv3, TLSv1, TLSv1.1, TLSv1.2
      #                 },
      #               },
      #             },
      #           ],
      #         },
      #         default_cache_behavior: { # required
      #           target_origin_id: "string", # required
      #           forwarded_values: { # required
      #             query_string: false, # required
      #             cookies: { # required
      #               forward: "none", # required, accepts none, whitelist, all
      #               whitelisted_names: {
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #             },
      #             headers: {
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #             query_string_cache_keys: {
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #           },
      #           trusted_signers: { # required
      #             enabled: false, # required
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #           viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #           min_ttl: 1, # required
      #           allowed_methods: {
      #             quantity: 1, # required
      #             items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #             cached_methods: {
      #               quantity: 1, # required
      #               items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #             },
      #           },
      #           smooth_streaming: false,
      #           default_ttl: 1,
      #           max_ttl: 1,
      #           compress: false,
      #         },
      #         cache_behaviors: {
      #           quantity: 1, # required
      #           items: [
      #             {
      #               path_pattern: "string", # required
      #               target_origin_id: "string", # required
      #               forwarded_values: { # required
      #                 query_string: false, # required
      #                 cookies: { # required
      #                   forward: "none", # required, accepts none, whitelist, all
      #                   whitelisted_names: {
      #                     quantity: 1, # required
      #                     items: ["string"],
      #                   },
      #                 },
      #                 headers: {
      #                   quantity: 1, # required
      #                   items: ["string"],
      #                 },
      #                 query_string_cache_keys: {
      #                   quantity: 1, # required
      #                   items: ["string"],
      #                 },
      #               },
      #               trusted_signers: { # required
      #                 enabled: false, # required
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #               viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #               min_ttl: 1, # required
      #               allowed_methods: {
      #                 quantity: 1, # required
      #                 items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #                 cached_methods: {
      #                   quantity: 1, # required
      #                   items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #                 },
      #               },
      #               smooth_streaming: false,
      #               default_ttl: 1,
      #               max_ttl: 1,
      #               compress: false,
      #             },
      #           ],
      #         },
      #         custom_error_responses: {
      #           quantity: 1, # required
      #           items: [
      #             {
      #               error_code: 1, # required
      #               response_page_path: "string",
      #               response_code: "string",
      #               error_caching_min_ttl: 1,
      #             },
      #           ],
      #         },
      #         comment: "string", # required
      #         logging: {
      #           enabled: false, # required
      #           include_cookies: false, # required
      #           bucket: "string", # required
      #           prefix: "string", # required
      #         },
      #         price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #         enabled: false, # required
      #         viewer_certificate: {
      #           cloud_front_default_certificate: false,
      #           iam_certificate_id: "string",
      #           acm_certificate_arn: "string",
      #           ssl_support_method: "sni-only", # accepts sni-only, vip
      #           minimum_protocol_version: "SSLv3", # accepts SSLv3, TLSv1
      #           certificate: "string",
      #           certificate_source: "cloudfront", # accepts cloudfront, iam, acm
      #         },
      #         restrictions: {
      #           geo_restriction: { # required
      #             restriction_type: "blacklist", # required, accepts blacklist, whitelist, none
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #         },
      #         web_acl_id: "string",
      #       },
      #       tags: { # required
      #         items: [
      #           {
      #             key: "TagKey", # required
      #             value: "TagValue",
      #           },
      #         ],
      #       },
      #     },
      #   })
      #
      # @example Response structure
      #   resp.distribution.id #=> String
      #   resp.distribution.arn #=> String
      #   resp.distribution.status #=> String
      #   resp.distribution.last_modified_time #=> Time
      #   resp.distribution.in_progress_invalidation_batches #=> Integer
      #   resp.distribution.domain_name #=> String
      #   resp.distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.distribution.active_trusted_signers.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.distribution.distribution_config.caller_reference #=> String
      #   resp.distribution.distribution_config.aliases.quantity #=> Integer
      #   resp.distribution.distribution_config.aliases.items #=> Array
      #   resp.distribution.distribution_config.aliases.items[0] #=> String
      #   resp.distribution.distribution_config.default_root_object #=> String
      #   resp.distribution.distribution_config.origins.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].id #=> String
      #   resp.distribution.distribution_config.origins.items[0].domain_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].origin_path #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution.distribution_config.origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution.distribution_config.default_cache_behavior.target_origin_id #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.compress #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution.distribution_config.custom_error_responses.quantity #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items #=> Array
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_code #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution.distribution_config.comment #=> String
      #   resp.distribution.distribution_config.logging.enabled #=> Boolean
      #   resp.distribution.distribution_config.logging.include_cookies #=> Boolean
      #   resp.distribution.distribution_config.logging.bucket #=> String
      #   resp.distribution.distribution_config.logging.prefix #=> String
      #   resp.distribution.distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution.distribution_config.enabled #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution.distribution_config.viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution.distribution_config.viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution.distribution_config.viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution.distribution_config.viewer_certificate.certificate #=> String
      #   resp.distribution.distribution_config.viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items #=> Array
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution.distribution_config.web_acl_id #=> String
      #   resp.location #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_distribution_with_tags(params = {}, options = {})
        req = build_request(:create_distribution_with_tags, params)
        req.send_request(options)
      end

      # Create a new invalidation.
      # @option params [required, String] :distribution_id
      #   The distribution\'s id.
      # @option params [required, Types::InvalidationBatch] :invalidation_batch
      #   The batch information for the invalidation.
      # @return [Types::CreateInvalidationResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateInvalidationResult#location #Location} => String
      #   * {Types::CreateInvalidationResult#invalidation #Invalidation} => Types::Invalidation
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_invalidation({
      #     distribution_id: "string", # required
      #     invalidation_batch: { # required
      #       paths: { # required
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       caller_reference: "string", # required
      #     },
      #   })
      #
      # @example Response structure
      #   resp.location #=> String
      #   resp.invalidation.id #=> String
      #   resp.invalidation.status #=> String
      #   resp.invalidation.create_time #=> Time
      #   resp.invalidation.invalidation_batch.paths.quantity #=> Integer
      #   resp.invalidation.invalidation_batch.paths.items #=> Array
      #   resp.invalidation.invalidation_batch.paths.items[0] #=> String
      #   resp.invalidation.invalidation_batch.caller_reference #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_invalidation(params = {}, options = {})
        req = build_request(:create_invalidation, params)
        req.send_request(options)
      end

      # Create a new streaming distribution.
      # @option params [required, Types::StreamingDistributionConfig] :streaming_distribution_config
      #   The streaming distribution\'s configuration information.
      # @return [Types::CreateStreamingDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateStreamingDistributionResult#streaming_distribution #StreamingDistribution} => Types::StreamingDistribution
      #   * {Types::CreateStreamingDistributionResult#location #Location} => String
      #   * {Types::CreateStreamingDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_streaming_distribution({
      #     streaming_distribution_config: { # required
      #       caller_reference: "string", # required
      #       s3_origin: { # required
      #         domain_name: "string", # required
      #         origin_access_identity: "string", # required
      #       },
      #       aliases: {
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       comment: "string", # required
      #       logging: {
      #         enabled: false, # required
      #         bucket: "string", # required
      #         prefix: "string", # required
      #       },
      #       trusted_signers: { # required
      #         enabled: false, # required
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #       enabled: false, # required
      #     },
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution.id #=> String
      #   resp.streaming_distribution.arn #=> String
      #   resp.streaming_distribution.status #=> String
      #   resp.streaming_distribution.last_modified_time #=> Time
      #   resp.streaming_distribution.domain_name #=> String
      #   resp.streaming_distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.active_trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.caller_reference #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.domain_name #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution.streaming_distribution_config.aliases.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.comment #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.logging.bucket #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.prefix #=> String
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution.streaming_distribution_config.enabled #=> Boolean
      #   resp.location #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_streaming_distribution(params = {}, options = {})
        req = build_request(:create_streaming_distribution, params)
        req.send_request(options)
      end

      # Create a new streaming distribution with tags.
      # @option params [required, Types::StreamingDistributionConfigWithTags] :streaming_distribution_config_with_tags
      #   The streaming distribution\'s configuration information.
      # @return [Types::CreateStreamingDistributionWithTagsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::CreateStreamingDistributionWithTagsResult#streaming_distribution #StreamingDistribution} => Types::StreamingDistribution
      #   * {Types::CreateStreamingDistributionWithTagsResult#location #Location} => String
      #   * {Types::CreateStreamingDistributionWithTagsResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.create_streaming_distribution_with_tags({
      #     streaming_distribution_config_with_tags: { # required
      #       streaming_distribution_config: { # required
      #         caller_reference: "string", # required
      #         s3_origin: { # required
      #           domain_name: "string", # required
      #           origin_access_identity: "string", # required
      #         },
      #         aliases: {
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #         comment: "string", # required
      #         logging: {
      #           enabled: false, # required
      #           bucket: "string", # required
      #           prefix: "string", # required
      #         },
      #         trusted_signers: { # required
      #           enabled: false, # required
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #         price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #         enabled: false, # required
      #       },
      #       tags: { # required
      #         items: [
      #           {
      #             key: "TagKey", # required
      #             value: "TagValue",
      #           },
      #         ],
      #       },
      #     },
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution.id #=> String
      #   resp.streaming_distribution.arn #=> String
      #   resp.streaming_distribution.status #=> String
      #   resp.streaming_distribution.last_modified_time #=> Time
      #   resp.streaming_distribution.domain_name #=> String
      #   resp.streaming_distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.active_trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.caller_reference #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.domain_name #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution.streaming_distribution_config.aliases.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.comment #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.logging.bucket #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.prefix #=> String
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution.streaming_distribution_config.enabled #=> Boolean
      #   resp.location #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def create_streaming_distribution_with_tags(params = {}, options = {})
        req = build_request(:create_streaming_distribution_with_tags, params)
        req.send_request(options)
      end

      # Delete an origin access identity.
      # @option params [required, String] :id
      #   The origin access identity\'s id.
      # @option params [String] :if_match
      #   The value of the ETag header you received from a previous GET or PUT
      #   request. For example: E2QWRUHAPOMQZL.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_cloud_front_origin_access_identity({
      #     id: "string", # required
      #     if_match: "string",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_cloud_front_origin_access_identity(params = {}, options = {})
        req = build_request(:delete_cloud_front_origin_access_identity, params)
        req.send_request(options)
      end

      # Delete a distribution.
      # @option params [required, String] :id
      #   The distribution id.
      # @option params [String] :if_match
      #   The value of the ETag header you received when you disabled the
      #   distribution. For example: E2QWRUHAPOMQZL.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_distribution({
      #     id: "string", # required
      #     if_match: "string",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_distribution(params = {}, options = {})
        req = build_request(:delete_distribution, params)
        req.send_request(options)
      end

      # Delete a streaming distribution.
      # @option params [required, String] :id
      #   The distribution id.
      # @option params [String] :if_match
      #   The value of the ETag header you received when you disabled the
      #   streaming distribution. For example: E2QWRUHAPOMQZL.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.delete_streaming_distribution({
      #     id: "string", # required
      #     if_match: "string",
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def delete_streaming_distribution(params = {}, options = {})
        req = build_request(:delete_streaming_distribution, params)
        req.send_request(options)
      end

      # Get the information about an origin access identity.
      # @option params [required, String] :id
      #   The identity\'s id.
      # @return [Types::GetCloudFrontOriginAccessIdentityResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetCloudFrontOriginAccessIdentityResult#cloud_front_origin_access_identity #CloudFrontOriginAccessIdentity} => Types::CloudFrontOriginAccessIdentity
      #   * {Types::GetCloudFrontOriginAccessIdentityResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_cloud_front_origin_access_identity({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.cloud_front_origin_access_identity.id #=> String
      #   resp.cloud_front_origin_access_identity.s3_canonical_user_id #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.caller_reference #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.comment #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_cloud_front_origin_access_identity(params = {}, options = {})
        req = build_request(:get_cloud_front_origin_access_identity, params)
        req.send_request(options)
      end

      # Get the configuration information about an origin access identity.
      # @option params [required, String] :id
      #   The identity\'s id.
      # @return [Types::GetCloudFrontOriginAccessIdentityConfigResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetCloudFrontOriginAccessIdentityConfigResult#cloud_front_origin_access_identity_config #CloudFrontOriginAccessIdentityConfig} => Types::CloudFrontOriginAccessIdentityConfig
      #   * {Types::GetCloudFrontOriginAccessIdentityConfigResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_cloud_front_origin_access_identity_config({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.cloud_front_origin_access_identity_config.caller_reference #=> String
      #   resp.cloud_front_origin_access_identity_config.comment #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_cloud_front_origin_access_identity_config(params = {}, options = {})
        req = build_request(:get_cloud_front_origin_access_identity_config, params)
        req.send_request(options)
      end

      # Get the information about a distribution.
      # @option params [required, String] :id
      #   The distribution\'s id.
      # @return [Types::GetDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetDistributionResult#distribution #Distribution} => Types::Distribution
      #   * {Types::GetDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_distribution({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.distribution.id #=> String
      #   resp.distribution.arn #=> String
      #   resp.distribution.status #=> String
      #   resp.distribution.last_modified_time #=> Time
      #   resp.distribution.in_progress_invalidation_batches #=> Integer
      #   resp.distribution.domain_name #=> String
      #   resp.distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.distribution.active_trusted_signers.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.distribution.distribution_config.caller_reference #=> String
      #   resp.distribution.distribution_config.aliases.quantity #=> Integer
      #   resp.distribution.distribution_config.aliases.items #=> Array
      #   resp.distribution.distribution_config.aliases.items[0] #=> String
      #   resp.distribution.distribution_config.default_root_object #=> String
      #   resp.distribution.distribution_config.origins.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].id #=> String
      #   resp.distribution.distribution_config.origins.items[0].domain_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].origin_path #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution.distribution_config.origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution.distribution_config.default_cache_behavior.target_origin_id #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.compress #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution.distribution_config.custom_error_responses.quantity #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items #=> Array
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_code #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution.distribution_config.comment #=> String
      #   resp.distribution.distribution_config.logging.enabled #=> Boolean
      #   resp.distribution.distribution_config.logging.include_cookies #=> Boolean
      #   resp.distribution.distribution_config.logging.bucket #=> String
      #   resp.distribution.distribution_config.logging.prefix #=> String
      #   resp.distribution.distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution.distribution_config.enabled #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution.distribution_config.viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution.distribution_config.viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution.distribution_config.viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution.distribution_config.viewer_certificate.certificate #=> String
      #   resp.distribution.distribution_config.viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items #=> Array
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution.distribution_config.web_acl_id #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_distribution(params = {}, options = {})
        req = build_request(:get_distribution, params)
        req.send_request(options)
      end

      # Get the configuration information about a distribution.
      # @option params [required, String] :id
      #   The distribution\'s id.
      # @return [Types::GetDistributionConfigResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetDistributionConfigResult#distribution_config #DistributionConfig} => Types::DistributionConfig
      #   * {Types::GetDistributionConfigResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_distribution_config({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.distribution_config.caller_reference #=> String
      #   resp.distribution_config.aliases.quantity #=> Integer
      #   resp.distribution_config.aliases.items #=> Array
      #   resp.distribution_config.aliases.items[0] #=> String
      #   resp.distribution_config.default_root_object #=> String
      #   resp.distribution_config.origins.quantity #=> Integer
      #   resp.distribution_config.origins.items #=> Array
      #   resp.distribution_config.origins.items[0].id #=> String
      #   resp.distribution_config.origins.items[0].domain_name #=> String
      #   resp.distribution_config.origins.items[0].origin_path #=> String
      #   resp.distribution_config.origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution_config.origins.items[0].custom_headers.items #=> Array
      #   resp.distribution_config.origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution_config.origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution_config.origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution_config.origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution_config.origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution_config.origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution_config.default_cache_behavior.target_origin_id #=> String
      #   resp.distribution_config.default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution_config.default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_config.default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution_config.default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_config.default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution_config.default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution_config.default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution_config.default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_config.default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution_config.default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution_config.default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_config.default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_config.default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution_config.default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution_config.default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution_config.default_cache_behavior.compress #=> Boolean
      #   resp.distribution_config.cache_behaviors.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution_config.cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_config.cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution_config.cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution_config.cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_config.cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_config.cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution_config.cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution_config.cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution_config.custom_error_responses.quantity #=> Integer
      #   resp.distribution_config.custom_error_responses.items #=> Array
      #   resp.distribution_config.custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution_config.custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution_config.custom_error_responses.items[0].response_code #=> String
      #   resp.distribution_config.custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution_config.comment #=> String
      #   resp.distribution_config.logging.enabled #=> Boolean
      #   resp.distribution_config.logging.include_cookies #=> Boolean
      #   resp.distribution_config.logging.bucket #=> String
      #   resp.distribution_config.logging.prefix #=> String
      #   resp.distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution_config.enabled #=> Boolean
      #   resp.distribution_config.viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution_config.viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution_config.viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution_config.viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution_config.viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution_config.viewer_certificate.certificate #=> String
      #   resp.distribution_config.viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution_config.restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution_config.restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution_config.restrictions.geo_restriction.items #=> Array
      #   resp.distribution_config.restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution_config.web_acl_id #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_distribution_config(params = {}, options = {})
        req = build_request(:get_distribution_config, params)
        req.send_request(options)
      end

      # Get the information about an invalidation.
      # @option params [required, String] :distribution_id
      #   The distribution\'s id.
      # @option params [required, String] :id
      #   The invalidation\'s id.
      # @return [Types::GetInvalidationResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetInvalidationResult#invalidation #Invalidation} => Types::Invalidation
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_invalidation({
      #     distribution_id: "string", # required
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.invalidation.id #=> String
      #   resp.invalidation.status #=> String
      #   resp.invalidation.create_time #=> Time
      #   resp.invalidation.invalidation_batch.paths.quantity #=> Integer
      #   resp.invalidation.invalidation_batch.paths.items #=> Array
      #   resp.invalidation.invalidation_batch.paths.items[0] #=> String
      #   resp.invalidation.invalidation_batch.caller_reference #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_invalidation(params = {}, options = {})
        req = build_request(:get_invalidation, params)
        req.send_request(options)
      end

      # Get the information about a streaming distribution.
      # @option params [required, String] :id
      #   The streaming distribution\'s id.
      # @return [Types::GetStreamingDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetStreamingDistributionResult#streaming_distribution #StreamingDistribution} => Types::StreamingDistribution
      #   * {Types::GetStreamingDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_streaming_distribution({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution.id #=> String
      #   resp.streaming_distribution.arn #=> String
      #   resp.streaming_distribution.status #=> String
      #   resp.streaming_distribution.last_modified_time #=> Time
      #   resp.streaming_distribution.domain_name #=> String
      #   resp.streaming_distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.active_trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.caller_reference #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.domain_name #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution.streaming_distribution_config.aliases.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.comment #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.logging.bucket #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.prefix #=> String
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution.streaming_distribution_config.enabled #=> Boolean
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_streaming_distribution(params = {}, options = {})
        req = build_request(:get_streaming_distribution, params)
        req.send_request(options)
      end

      # Get the configuration information about a streaming distribution.
      # @option params [required, String] :id
      #   The streaming distribution\'s id.
      # @return [Types::GetStreamingDistributionConfigResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::GetStreamingDistributionConfigResult#streaming_distribution_config #StreamingDistributionConfig} => Types::StreamingDistributionConfig
      #   * {Types::GetStreamingDistributionConfigResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.get_streaming_distribution_config({
      #     id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution_config.caller_reference #=> String
      #   resp.streaming_distribution_config.s3_origin.domain_name #=> String
      #   resp.streaming_distribution_config.s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution_config.aliases.quantity #=> Integer
      #   resp.streaming_distribution_config.aliases.items #=> Array
      #   resp.streaming_distribution_config.aliases.items[0] #=> String
      #   resp.streaming_distribution_config.comment #=> String
      #   resp.streaming_distribution_config.logging.enabled #=> Boolean
      #   resp.streaming_distribution_config.logging.bucket #=> String
      #   resp.streaming_distribution_config.logging.prefix #=> String
      #   resp.streaming_distribution_config.trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution_config.trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution_config.trusted_signers.items #=> Array
      #   resp.streaming_distribution_config.trusted_signers.items[0] #=> String
      #   resp.streaming_distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution_config.enabled #=> Boolean
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def get_streaming_distribution_config(params = {}, options = {})
        req = build_request(:get_streaming_distribution_config, params)
        req.send_request(options)
      end

      # List origin access identities.
      # @option params [String] :marker
      #   Use this when paginating results to indicate where to begin in your
      #   list of origin access identities. The results include identities in
      #   the list that occur after the marker. To get the next page of results,
      #   set the Marker to the value of the NextMarker from the current page\'s
      #   response (which is also the ID of the last identity on that page).
      # @option params [Integer] :max_items
      #   The maximum number of origin access identities you want in the
      #   response body.
      # @return [Types::ListCloudFrontOriginAccessIdentitiesResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListCloudFrontOriginAccessIdentitiesResult#cloud_front_origin_access_identity_list #CloudFrontOriginAccessIdentityList} => Types::CloudFrontOriginAccessIdentityList
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_cloud_front_origin_access_identities({
      #     marker: "string",
      #     max_items: 1,
      #   })
      #
      # @example Response structure
      #   resp.cloud_front_origin_access_identity_list.marker #=> String
      #   resp.cloud_front_origin_access_identity_list.next_marker #=> String
      #   resp.cloud_front_origin_access_identity_list.max_items #=> Integer
      #   resp.cloud_front_origin_access_identity_list.is_truncated #=> Boolean
      #   resp.cloud_front_origin_access_identity_list.quantity #=> Integer
      #   resp.cloud_front_origin_access_identity_list.items #=> Array
      #   resp.cloud_front_origin_access_identity_list.items[0].id #=> String
      #   resp.cloud_front_origin_access_identity_list.items[0].s3_canonical_user_id #=> String
      #   resp.cloud_front_origin_access_identity_list.items[0].comment #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_cloud_front_origin_access_identities(params = {}, options = {})
        req = build_request(:list_cloud_front_origin_access_identities, params)
        req.send_request(options)
      end

      # List distributions.
      # @option params [String] :marker
      #   Use Marker and MaxItems to control pagination of results. If you have
      #   more than MaxItems distributions that satisfy the request, the
      #   response includes a NextMarker element. To get the next page of
      #   results, submit another request. For the value of Marker, specify the
      #   value of NextMarker from the last response. (For the first request,
      #   omit Marker.)
      # @option params [Integer] :max_items
      #   The maximum number of distributions that you want CloudFront to return
      #   in the response body. The maximum and default values are both 100.
      # @return [Types::ListDistributionsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListDistributionsResult#distribution_list #DistributionList} => Types::DistributionList
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_distributions({
      #     marker: "string",
      #     max_items: 1,
      #   })
      #
      # @example Response structure
      #   resp.distribution_list.marker #=> String
      #   resp.distribution_list.next_marker #=> String
      #   resp.distribution_list.max_items #=> Integer
      #   resp.distribution_list.is_truncated #=> Boolean
      #   resp.distribution_list.quantity #=> Integer
      #   resp.distribution_list.items #=> Array
      #   resp.distribution_list.items[0].id #=> String
      #   resp.distribution_list.items[0].arn #=> String
      #   resp.distribution_list.items[0].status #=> String
      #   resp.distribution_list.items[0].last_modified_time #=> Time
      #   resp.distribution_list.items[0].domain_name #=> String
      #   resp.distribution_list.items[0].aliases.quantity #=> Integer
      #   resp.distribution_list.items[0].aliases.items #=> Array
      #   resp.distribution_list.items[0].aliases.items[0] #=> String
      #   resp.distribution_list.items[0].origins.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].id #=> String
      #   resp.distribution_list.items[0].origins.items[0].domain_name #=> String
      #   resp.distribution_list.items[0].origins.items[0].origin_path #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution_list.items[0].origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution_list.items[0].default_cache_behavior.target_origin_id #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_list.items[0].default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.compress #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution_list.items[0].custom_error_responses.quantity #=> Integer
      #   resp.distribution_list.items[0].custom_error_responses.items #=> Array
      #   resp.distribution_list.items[0].custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution_list.items[0].custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution_list.items[0].custom_error_responses.items[0].response_code #=> String
      #   resp.distribution_list.items[0].custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution_list.items[0].comment #=> String
      #   resp.distribution_list.items[0].price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution_list.items[0].enabled #=> Boolean
      #   resp.distribution_list.items[0].viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution_list.items[0].viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution_list.items[0].viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution_list.items[0].viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution_list.items[0].viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution_list.items[0].viewer_certificate.certificate #=> String
      #   resp.distribution_list.items[0].viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution_list.items[0].restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution_list.items[0].restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution_list.items[0].restrictions.geo_restriction.items #=> Array
      #   resp.distribution_list.items[0].restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution_list.items[0].web_acl_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_distributions(params = {}, options = {})
        req = build_request(:list_distributions, params)
        req.send_request(options)
      end

      # List the distributions that are associated with a specified AWS WAF
      # web ACL.
      # @option params [String] :marker
      #   Use Marker and MaxItems to control pagination of results. If you have
      #   more than MaxItems distributions that satisfy the request, the
      #   response includes a NextMarker element. To get the next page of
      #   results, submit another request. For the value of Marker, specify the
      #   value of NextMarker from the last response. (For the first request,
      #   omit Marker.)
      # @option params [Integer] :max_items
      #   The maximum number of distributions that you want CloudFront to return
      #   in the response body. The maximum and default values are both 100.
      # @option params [required, String] :web_acl_id
      #   The Id of the AWS WAF web ACL for which you want to list the
      #   associated distributions. If you specify \"null\" for the Id, the
      #   request returns a list of the distributions that aren\'t associated
      #   with a web ACL.
      # @return [Types::ListDistributionsByWebACLIdResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListDistributionsByWebACLIdResult#distribution_list #DistributionList} => Types::DistributionList
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_distributions_by_web_acl_id({
      #     marker: "string",
      #     max_items: 1,
      #     web_acl_id: "string", # required
      #   })
      #
      # @example Response structure
      #   resp.distribution_list.marker #=> String
      #   resp.distribution_list.next_marker #=> String
      #   resp.distribution_list.max_items #=> Integer
      #   resp.distribution_list.is_truncated #=> Boolean
      #   resp.distribution_list.quantity #=> Integer
      #   resp.distribution_list.items #=> Array
      #   resp.distribution_list.items[0].id #=> String
      #   resp.distribution_list.items[0].arn #=> String
      #   resp.distribution_list.items[0].status #=> String
      #   resp.distribution_list.items[0].last_modified_time #=> Time
      #   resp.distribution_list.items[0].domain_name #=> String
      #   resp.distribution_list.items[0].aliases.quantity #=> Integer
      #   resp.distribution_list.items[0].aliases.items #=> Array
      #   resp.distribution_list.items[0].aliases.items[0] #=> String
      #   resp.distribution_list.items[0].origins.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].id #=> String
      #   resp.distribution_list.items[0].origins.items[0].domain_name #=> String
      #   resp.distribution_list.items[0].origins.items[0].origin_path #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution_list.items[0].origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution_list.items[0].origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution_list.items[0].default_cache_behavior.target_origin_id #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution_list.items[0].default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_list.items[0].default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_list.items[0].default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution_list.items[0].default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution_list.items[0].default_cache_behavior.compress #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution_list.items[0].cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution_list.items[0].cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution_list.items[0].cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution_list.items[0].cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution_list.items[0].cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution_list.items[0].custom_error_responses.quantity #=> Integer
      #   resp.distribution_list.items[0].custom_error_responses.items #=> Array
      #   resp.distribution_list.items[0].custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution_list.items[0].custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution_list.items[0].custom_error_responses.items[0].response_code #=> String
      #   resp.distribution_list.items[0].custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution_list.items[0].comment #=> String
      #   resp.distribution_list.items[0].price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution_list.items[0].enabled #=> Boolean
      #   resp.distribution_list.items[0].viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution_list.items[0].viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution_list.items[0].viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution_list.items[0].viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution_list.items[0].viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution_list.items[0].viewer_certificate.certificate #=> String
      #   resp.distribution_list.items[0].viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution_list.items[0].restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution_list.items[0].restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution_list.items[0].restrictions.geo_restriction.items #=> Array
      #   resp.distribution_list.items[0].restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution_list.items[0].web_acl_id #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_distributions_by_web_acl_id(params = {}, options = {})
        req = build_request(:list_distributions_by_web_acl_id, params)
        req.send_request(options)
      end

      # List invalidation batches.
      # @option params [required, String] :distribution_id
      #   The distribution\'s id.
      # @option params [String] :marker
      #   Use this parameter when paginating results to indicate where to begin
      #   in your list of invalidation batches. Because the results are returned
      #   in decreasing order from most recent to oldest, the most recent
      #   results are on the first page, the second page will contain earlier
      #   results, and so on. To get the next page of results, set the Marker to
      #   the value of the NextMarker from the current page\'s response. This
      #   value is the same as the ID of the last invalidation batch on that
      #   page.
      # @option params [Integer] :max_items
      #   The maximum number of invalidation batches you want in the response
      #   body.
      # @return [Types::ListInvalidationsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListInvalidationsResult#invalidation_list #InvalidationList} => Types::InvalidationList
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_invalidations({
      #     distribution_id: "string", # required
      #     marker: "string",
      #     max_items: 1,
      #   })
      #
      # @example Response structure
      #   resp.invalidation_list.marker #=> String
      #   resp.invalidation_list.next_marker #=> String
      #   resp.invalidation_list.max_items #=> Integer
      #   resp.invalidation_list.is_truncated #=> Boolean
      #   resp.invalidation_list.quantity #=> Integer
      #   resp.invalidation_list.items #=> Array
      #   resp.invalidation_list.items[0].id #=> String
      #   resp.invalidation_list.items[0].create_time #=> Time
      #   resp.invalidation_list.items[0].status #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_invalidations(params = {}, options = {})
        req = build_request(:list_invalidations, params)
        req.send_request(options)
      end

      # List streaming distributions.
      # @option params [String] :marker
      #   Use this when paginating results to indicate where to begin in your
      #   list of streaming distributions. The results include distributions in
      #   the list that occur after the marker. To get the next page of results,
      #   set the Marker to the value of the NextMarker from the current page\'s
      #   response (which is also the ID of the last distribution on that page).
      # @option params [Integer] :max_items
      #   The maximum number of streaming distributions you want in the response
      #   body.
      # @return [Types::ListStreamingDistributionsResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListStreamingDistributionsResult#streaming_distribution_list #StreamingDistributionList} => Types::StreamingDistributionList
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_streaming_distributions({
      #     marker: "string",
      #     max_items: 1,
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution_list.marker #=> String
      #   resp.streaming_distribution_list.next_marker #=> String
      #   resp.streaming_distribution_list.max_items #=> Integer
      #   resp.streaming_distribution_list.is_truncated #=> Boolean
      #   resp.streaming_distribution_list.quantity #=> Integer
      #   resp.streaming_distribution_list.items #=> Array
      #   resp.streaming_distribution_list.items[0].id #=> String
      #   resp.streaming_distribution_list.items[0].arn #=> String
      #   resp.streaming_distribution_list.items[0].status #=> String
      #   resp.streaming_distribution_list.items[0].last_modified_time #=> Time
      #   resp.streaming_distribution_list.items[0].domain_name #=> String
      #   resp.streaming_distribution_list.items[0].s3_origin.domain_name #=> String
      #   resp.streaming_distribution_list.items[0].s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution_list.items[0].aliases.quantity #=> Integer
      #   resp.streaming_distribution_list.items[0].aliases.items #=> Array
      #   resp.streaming_distribution_list.items[0].aliases.items[0] #=> String
      #   resp.streaming_distribution_list.items[0].trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution_list.items[0].trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution_list.items[0].trusted_signers.items #=> Array
      #   resp.streaming_distribution_list.items[0].trusted_signers.items[0] #=> String
      #   resp.streaming_distribution_list.items[0].comment #=> String
      #   resp.streaming_distribution_list.items[0].price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution_list.items[0].enabled #=> Boolean
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_streaming_distributions(params = {}, options = {})
        req = build_request(:list_streaming_distributions, params)
        req.send_request(options)
      end

      # List tags for a CloudFront resource.
      # @option params [required, String] :resource
      #   An ARN of a CloudFront resource.
      # @return [Types::ListTagsForResourceResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::ListTagsForResourceResult#tags #Tags} => Types::Tags
      #
      # @example Request syntax with placeholder values
      #   resp = client.list_tags_for_resource({
      #     resource: "ResourceARN", # required
      #   })
      #
      # @example Response structure
      #   resp.tags.items #=> Array
      #   resp.tags.items[0].key #=> String
      #   resp.tags.items[0].value #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def list_tags_for_resource(params = {}, options = {})
        req = build_request(:list_tags_for_resource, params)
        req.send_request(options)
      end

      # Add tags to a CloudFront resource.
      # @option params [required, String] :resource
      #   An ARN of a CloudFront resource.
      # @option params [required, Types::Tags] :tags
      #   A complex type that contains zero or more Tag elements.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.tag_resource({
      #     resource: "ResourceARN", # required
      #     tags: { # required
      #       items: [
      #         {
      #           key: "TagKey", # required
      #           value: "TagValue",
      #         },
      #       ],
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def tag_resource(params = {}, options = {})
        req = build_request(:tag_resource, params)
        req.send_request(options)
      end

      # Remove tags from a CloudFront resource.
      # @option params [required, String] :resource
      #   An ARN of a CloudFront resource.
      # @option params [required, Types::TagKeys] :tag_keys
      #   A complex type that contains zero or more Tag key elements.
      # @return [Struct] Returns an empty {Seahorse::Client::Response response}.
      #
      # @example Request syntax with placeholder values
      #   resp = client.untag_resource({
      #     resource: "ResourceARN", # required
      #     tag_keys: { # required
      #       items: ["TagKey"],
      #     },
      #   })
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def untag_resource(params = {}, options = {})
        req = build_request(:untag_resource, params)
        req.send_request(options)
      end

      # Update an origin access identity.
      # @option params [required, Types::CloudFrontOriginAccessIdentityConfig] :cloud_front_origin_access_identity_config
      #   The identity\'s configuration information.
      # @option params [required, String] :id
      #   The identity\'s id.
      # @option params [String] :if_match
      #   The value of the ETag header you received when retrieving the
      #   identity\'s configuration. For example: E2QWRUHAPOMQZL.
      # @return [Types::UpdateCloudFrontOriginAccessIdentityResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UpdateCloudFrontOriginAccessIdentityResult#cloud_front_origin_access_identity #CloudFrontOriginAccessIdentity} => Types::CloudFrontOriginAccessIdentity
      #   * {Types::UpdateCloudFrontOriginAccessIdentityResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.update_cloud_front_origin_access_identity({
      #     cloud_front_origin_access_identity_config: { # required
      #       caller_reference: "string", # required
      #       comment: "string", # required
      #     },
      #     id: "string", # required
      #     if_match: "string",
      #   })
      #
      # @example Response structure
      #   resp.cloud_front_origin_access_identity.id #=> String
      #   resp.cloud_front_origin_access_identity.s3_canonical_user_id #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.caller_reference #=> String
      #   resp.cloud_front_origin_access_identity.cloud_front_origin_access_identity_config.comment #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def update_cloud_front_origin_access_identity(params = {}, options = {})
        req = build_request(:update_cloud_front_origin_access_identity, params)
        req.send_request(options)
      end

      # Update a distribution.
      # @option params [required, Types::DistributionConfig] :distribution_config
      #   The distribution\'s configuration information.
      # @option params [required, String] :id
      #   The distribution\'s id.
      # @option params [String] :if_match
      #   The value of the ETag header you received when retrieving the
      #   distribution\'s configuration. For example: E2QWRUHAPOMQZL.
      # @return [Types::UpdateDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UpdateDistributionResult#distribution #Distribution} => Types::Distribution
      #   * {Types::UpdateDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.update_distribution({
      #     distribution_config: { # required
      #       caller_reference: "string", # required
      #       aliases: {
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       default_root_object: "string",
      #       origins: { # required
      #         quantity: 1, # required
      #         items: [
      #           {
      #             id: "string", # required
      #             domain_name: "string", # required
      #             origin_path: "string",
      #             custom_headers: {
      #               quantity: 1, # required
      #               items: [
      #                 {
      #                   header_name: "string", # required
      #                   header_value: "string", # required
      #                 },
      #               ],
      #             },
      #             s3_origin_config: {
      #               origin_access_identity: "string", # required
      #             },
      #             custom_origin_config: {
      #               http_port: 1, # required
      #               https_port: 1, # required
      #               origin_protocol_policy: "http-only", # required, accepts http-only, match-viewer, https-only
      #               origin_ssl_protocols: {
      #                 quantity: 1, # required
      #                 items: ["SSLv3"], # required, accepts SSLv3, TLSv1, TLSv1.1, TLSv1.2
      #               },
      #             },
      #           },
      #         ],
      #       },
      #       default_cache_behavior: { # required
      #         target_origin_id: "string", # required
      #         forwarded_values: { # required
      #           query_string: false, # required
      #           cookies: { # required
      #             forward: "none", # required, accepts none, whitelist, all
      #             whitelisted_names: {
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #           },
      #           headers: {
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #           query_string_cache_keys: {
      #             quantity: 1, # required
      #             items: ["string"],
      #           },
      #         },
      #         trusted_signers: { # required
      #           enabled: false, # required
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #         viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #         min_ttl: 1, # required
      #         allowed_methods: {
      #           quantity: 1, # required
      #           items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #           cached_methods: {
      #             quantity: 1, # required
      #             items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #           },
      #         },
      #         smooth_streaming: false,
      #         default_ttl: 1,
      #         max_ttl: 1,
      #         compress: false,
      #       },
      #       cache_behaviors: {
      #         quantity: 1, # required
      #         items: [
      #           {
      #             path_pattern: "string", # required
      #             target_origin_id: "string", # required
      #             forwarded_values: { # required
      #               query_string: false, # required
      #               cookies: { # required
      #                 forward: "none", # required, accepts none, whitelist, all
      #                 whitelisted_names: {
      #                   quantity: 1, # required
      #                   items: ["string"],
      #                 },
      #               },
      #               headers: {
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #               query_string_cache_keys: {
      #                 quantity: 1, # required
      #                 items: ["string"],
      #               },
      #             },
      #             trusted_signers: { # required
      #               enabled: false, # required
      #               quantity: 1, # required
      #               items: ["string"],
      #             },
      #             viewer_protocol_policy: "allow-all", # required, accepts allow-all, https-only, redirect-to-https
      #             min_ttl: 1, # required
      #             allowed_methods: {
      #               quantity: 1, # required
      #               items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #               cached_methods: {
      #                 quantity: 1, # required
      #                 items: ["GET"], # required, accepts GET, HEAD, POST, PUT, PATCH, OPTIONS, DELETE
      #               },
      #             },
      #             smooth_streaming: false,
      #             default_ttl: 1,
      #             max_ttl: 1,
      #             compress: false,
      #           },
      #         ],
      #       },
      #       custom_error_responses: {
      #         quantity: 1, # required
      #         items: [
      #           {
      #             error_code: 1, # required
      #             response_page_path: "string",
      #             response_code: "string",
      #             error_caching_min_ttl: 1,
      #           },
      #         ],
      #       },
      #       comment: "string", # required
      #       logging: {
      #         enabled: false, # required
      #         include_cookies: false, # required
      #         bucket: "string", # required
      #         prefix: "string", # required
      #       },
      #       price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #       enabled: false, # required
      #       viewer_certificate: {
      #         cloud_front_default_certificate: false,
      #         iam_certificate_id: "string",
      #         acm_certificate_arn: "string",
      #         ssl_support_method: "sni-only", # accepts sni-only, vip
      #         minimum_protocol_version: "SSLv3", # accepts SSLv3, TLSv1
      #         certificate: "string",
      #         certificate_source: "cloudfront", # accepts cloudfront, iam, acm
      #       },
      #       restrictions: {
      #         geo_restriction: { # required
      #           restriction_type: "blacklist", # required, accepts blacklist, whitelist, none
      #           quantity: 1, # required
      #           items: ["string"],
      #         },
      #       },
      #       web_acl_id: "string",
      #     },
      #     id: "string", # required
      #     if_match: "string",
      #   })
      #
      # @example Response structure
      #   resp.distribution.id #=> String
      #   resp.distribution.arn #=> String
      #   resp.distribution.status #=> String
      #   resp.distribution.last_modified_time #=> Time
      #   resp.distribution.in_progress_invalidation_batches #=> Integer
      #   resp.distribution.domain_name #=> String
      #   resp.distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.distribution.active_trusted_signers.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.distribution.distribution_config.caller_reference #=> String
      #   resp.distribution.distribution_config.aliases.quantity #=> Integer
      #   resp.distribution.distribution_config.aliases.items #=> Array
      #   resp.distribution.distribution_config.aliases.items[0] #=> String
      #   resp.distribution.distribution_config.default_root_object #=> String
      #   resp.distribution.distribution_config.origins.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].id #=> String
      #   resp.distribution.distribution_config.origins.items[0].domain_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].origin_path #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_name #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_headers.items[0].header_value #=> String
      #   resp.distribution.distribution_config.origins.items[0].s3_origin_config.origin_access_identity #=> String
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.http_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.https_port #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_protocol_policy #=> String, one of "http-only", "match-viewer", "https-only"
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.quantity #=> Integer
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items #=> Array
      #   resp.distribution.distribution_config.origins.items[0].custom_origin_config.origin_ssl_protocols.items[0] #=> String, one of "SSLv3", "TLSv1", "TLSv1.1", "TLSv1.2"
      #   resp.distribution.distribution_config.default_cache_behavior.target_origin_id #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.default_cache_behavior.viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.default_cache_behavior.min_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.default_cache_behavior.allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.default_cache_behavior.smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.default_cache_behavior.default_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.max_ttl #=> Integer
      #   resp.distribution.distribution_config.default_cache_behavior.compress #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].path_pattern #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].target_origin_id #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.forward #=> String, one of "none", "whitelist", "all"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.cookies.whitelisted_names.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.headers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].forwarded_values.query_string_cache_keys.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.enabled #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].trusted_signers.items[0] #=> String
      #   resp.distribution.distribution_config.cache_behaviors.items[0].viewer_protocol_policy #=> String, one of "allow-all", "https-only", "redirect-to-https"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].min_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.quantity #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items #=> Array
      #   resp.distribution.distribution_config.cache_behaviors.items[0].allowed_methods.cached_methods.items[0] #=> String, one of "GET", "HEAD", "POST", "PUT", "PATCH", "OPTIONS", "DELETE"
      #   resp.distribution.distribution_config.cache_behaviors.items[0].smooth_streaming #=> Boolean
      #   resp.distribution.distribution_config.cache_behaviors.items[0].default_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].max_ttl #=> Integer
      #   resp.distribution.distribution_config.cache_behaviors.items[0].compress #=> Boolean
      #   resp.distribution.distribution_config.custom_error_responses.quantity #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items #=> Array
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_code #=> Integer
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_page_path #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].response_code #=> String
      #   resp.distribution.distribution_config.custom_error_responses.items[0].error_caching_min_ttl #=> Integer
      #   resp.distribution.distribution_config.comment #=> String
      #   resp.distribution.distribution_config.logging.enabled #=> Boolean
      #   resp.distribution.distribution_config.logging.include_cookies #=> Boolean
      #   resp.distribution.distribution_config.logging.bucket #=> String
      #   resp.distribution.distribution_config.logging.prefix #=> String
      #   resp.distribution.distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.distribution.distribution_config.enabled #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.cloud_front_default_certificate #=> Boolean
      #   resp.distribution.distribution_config.viewer_certificate.iam_certificate_id #=> String
      #   resp.distribution.distribution_config.viewer_certificate.acm_certificate_arn #=> String
      #   resp.distribution.distribution_config.viewer_certificate.ssl_support_method #=> String, one of "sni-only", "vip"
      #   resp.distribution.distribution_config.viewer_certificate.minimum_protocol_version #=> String, one of "SSLv3", "TLSv1"
      #   resp.distribution.distribution_config.viewer_certificate.certificate #=> String
      #   resp.distribution.distribution_config.viewer_certificate.certificate_source #=> String, one of "cloudfront", "iam", "acm"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.restriction_type #=> String, one of "blacklist", "whitelist", "none"
      #   resp.distribution.distribution_config.restrictions.geo_restriction.quantity #=> Integer
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items #=> Array
      #   resp.distribution.distribution_config.restrictions.geo_restriction.items[0] #=> String
      #   resp.distribution.distribution_config.web_acl_id #=> String
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def update_distribution(params = {}, options = {})
        req = build_request(:update_distribution, params)
        req.send_request(options)
      end

      # Update a streaming distribution.
      # @option params [required, Types::StreamingDistributionConfig] :streaming_distribution_config
      #   The streaming distribution\'s configuration information.
      # @option params [required, String] :id
      #   The streaming distribution\'s id.
      # @option params [String] :if_match
      #   The value of the ETag header you received when retrieving the
      #   streaming distribution\'s configuration. For example: E2QWRUHAPOMQZL.
      # @return [Types::UpdateStreamingDistributionResult] Returns a {Seahorse::Client::Response response} object which responds to the following methods:
      #
      #   * {Types::UpdateStreamingDistributionResult#streaming_distribution #StreamingDistribution} => Types::StreamingDistribution
      #   * {Types::UpdateStreamingDistributionResult#etag #ETag} => String
      #
      # @example Request syntax with placeholder values
      #   resp = client.update_streaming_distribution({
      #     streaming_distribution_config: { # required
      #       caller_reference: "string", # required
      #       s3_origin: { # required
      #         domain_name: "string", # required
      #         origin_access_identity: "string", # required
      #       },
      #       aliases: {
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       comment: "string", # required
      #       logging: {
      #         enabled: false, # required
      #         bucket: "string", # required
      #         prefix: "string", # required
      #       },
      #       trusted_signers: { # required
      #         enabled: false, # required
      #         quantity: 1, # required
      #         items: ["string"],
      #       },
      #       price_class: "PriceClass_100", # accepts PriceClass_100, PriceClass_200, PriceClass_All
      #       enabled: false, # required
      #     },
      #     id: "string", # required
      #     if_match: "string",
      #   })
      #
      # @example Response structure
      #   resp.streaming_distribution.id #=> String
      #   resp.streaming_distribution.arn #=> String
      #   resp.streaming_distribution.status #=> String
      #   resp.streaming_distribution.last_modified_time #=> Time
      #   resp.streaming_distribution.domain_name #=> String
      #   resp.streaming_distribution.active_trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.active_trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].aws_account_number #=> String
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.quantity #=> Integer
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items #=> Array
      #   resp.streaming_distribution.active_trusted_signers.items[0].key_pair_ids.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.caller_reference #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.domain_name #=> String
      #   resp.streaming_distribution.streaming_distribution_config.s3_origin.origin_access_identity #=> String
      #   resp.streaming_distribution.streaming_distribution_config.aliases.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.aliases.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.comment #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.logging.bucket #=> String
      #   resp.streaming_distribution.streaming_distribution_config.logging.prefix #=> String
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.enabled #=> Boolean
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.quantity #=> Integer
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items #=> Array
      #   resp.streaming_distribution.streaming_distribution_config.trusted_signers.items[0] #=> String
      #   resp.streaming_distribution.streaming_distribution_config.price_class #=> String, one of "PriceClass_100", "PriceClass_200", "PriceClass_All"
      #   resp.streaming_distribution.streaming_distribution_config.enabled #=> Boolean
      #   resp.etag #=> String
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      def update_streaming_distribution(params = {}, options = {})
        req = build_request(:update_streaming_distribution, params)
        req.send_request(options)
      end

      # @!endgroup

      # @param [Symbol] waiter_name
      # @param [Hash] params ({})
      # @param [Hash] options ({})
      # @option options [Integer] :max_attempts
      # @option options [Integer] :delay
      # @option options [Proc] :before_attempt
      # @option options [Proc] :before_wait
      def wait_until(waiter_name, params = {}, options = {})
        w = waiter(waiter_name, options)
        yield(w.waiter) if block_given? # deprecated
        w.wait(params)
      end

      def waiter_names
        waiters.keys
      end

      private

      # @param [Symbol] waiter_name
      # @param [Hash] options ({})
      def waiter(waiter_name, options = {})
        waiter_class = waiters[waiter_name]
        if waiter_class
          waiter_class.new(options.merge(client: self))
        else
          raise Aws::Waiters::Errors::NoSuchWaiterError.new(waiter_name, waiters.keys)
        end
      end

      def waiters
        {
          distribution_deployed: Waiters::DistributionDeployed,
          invalidation_completed: Waiters::InvalidationCompleted,
          streaming_distribution_deployed: Waiters::StreamingDistributionDeployed
        }
      end

      # @api private
      class << self

        # @api private
        attr_reader :identifier

        def errors_module
          Errors
        end

      end
    end
  end
end