class Question < ActiveRecord::Base
  has_many :tags

  def all_tags
    self.tags.map{|tag| tag.text}.join(", ")
  end

  def all_tags=(tag_string)

    self.tags.each do |tag|
      tag.destroy!
    end

    split_tags = tag_string.gsub(/\s+/, "").split(",")

    split_tags.each do |tag|
      Tag.create!(question_id: self.id, text: tag)
    end

    # if self.tags = []
    #   split_tags.each do |tag|
    #     Tag.create!(question_id: self.id, text: tag)
    #   end
    # else
    #   self.tags.each do |tag|
    #     tag.text = split_tags.shift
    #     if split_tags == []
    #       tag.destroy
    #     end
    #   end
    #   self.save
    # end

  end

end
