class StarredItem < ActiveRecord::Base
  acts_as_starred
end

class User < ActiveRecord::Base
  cattr_accessor :current_user
end