class Game < ApplicationRecord
 has_many :matches

 def self.options_for_select
   order('LOWER(name)').map { |e| [e.name, e.id] }
 end

end
