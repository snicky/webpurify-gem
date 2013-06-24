module WebPurify
  module Blacklist
    
    def add_to_blacklist(word, deep_search=0)
      params = {
        :method => WebPurify::Constants.methods[:add_to_blacklist],
        :word   => word,
        :ds     => deep_search
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    def remove_from_blacklist(word)
      params = {
        :method => WebPurify::Constants.methods[:remove_from_blacklist],
        :word   => word
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      return parsed[:success]=='1'
    end
    
    def get_blacklist
      params = {
        :method => WebPurify::Constants.methods[:get_blacklist]
      }
      parsed = WebPurify::Request.query(@request_base, @query_base, params)
      if parsed[:word]
        return [] << parsed[:word]
      else
        return []
      end
    end
    
  end
end