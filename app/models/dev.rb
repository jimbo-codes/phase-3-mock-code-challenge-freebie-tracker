class Dev < ActiveRecord::Base
    has_many :freebies
    has_many :companies, through: :freebies

    def recieved_one?(item_name)
        result = false
        self.freebies.each do |item|
            if item.item_name == item_name
                result = true
            end
        end
        result
    end

    def give_away(dev, freebie)
        # check the owner of freebie, if that is equal to self, THEN we reassign owner to dev passed.
        if freebie.dev == self
            freebie.dev_id = dev.id
            freebie.save
        else puts "u cant do dat"
            # reassign owner to the new guy
        end
    end
end
