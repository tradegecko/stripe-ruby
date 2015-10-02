module Stripe
  module APIOperations
    module List
      def list(filters={}, opts={})
        opts = {
          api_base: api_url
        }.merge(Util.normalize_opts(opts))
        opts = @opts.merge(opts) if @opts

        response, opts = request(:get, url, filters, opts)
        obj = ListObject.construct_from(response, opts)

        # inherit the API URL of the origin object
        obj.api_url = api_url

        # set a limit so that we can fetch the same number when accessing the
        # next and previous pages
        obj.limit = filters[:limit]

        obj
      end

      # The original version of #list was given the somewhat unfortunate name of
      # #all, and this alias allows us to maintain backward compatibility (the
      # choice was somewhat misleading in the way that it only returned a single
      # page rather than all objects).
      alias :all :list
    end
  end
end
