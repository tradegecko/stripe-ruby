module Stripe
  class FileUpload < APIResource
    extend Stripe::APIOperations::List

    def self.api_url
      Stripe::uploads_base
    end

    def self.url
      "/v1/files"
    end

    # TODO: Re-use the version from API::Operations::Create. Duplicating code
    # like this doesn't help anyone.
    def self.create(params={}, opts={})
      opts = {
        :content_type => 'multipart/form-data',
        :api_base => Stripe::uploads_base
      }.merge(opts)
      response, opts = request(:post, url, params, opts)
      Util.convert_to_stripe_object(response, opts)
    end
  end
end
