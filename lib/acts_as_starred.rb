# ActsAsStarred

module CitySafe
  
  module Plugins
    module ActsAsStarred
    
      def self.included(base)
        base.extend ClassMethods
      end    
    
      module ClassMethods
        # == Configuration options
        # * none at the moment
        def acts_as_starred(options = {})    
          
          # only allow this to be executed once per model
          return if self.included_modules.include?(CitySafe::Plugins::ActsAsStarred::InstanceMethods)
          send :include, CitySafe::Plugins::ActsAsStarred::InstanceMethods               
          
          has_many :starrings, :as => :item
        end
      end
      
      module InstanceMethods
      
        def star!
          starrings.create
        end
        
        def unstar!
          if starring = starrings.find_by_created_by(User.current_user)
            starring.destroy
          end
        end
        
        def starred_by?(user)
          !!starrings.find_by_created_by(user)
        end
            
      end
      
    end
    
  end
end


ActiveRecord::Base.send :include, CitySafe::Plugins::ActsAsStarred