# == Schema Information
#
# Table name: shortened_urls
#
#  id        :bigint           not null, primary key
#  long_url  :string           not null
#  short_url :string           not null
#  user_id   :integer          not null
#
class Shortened_Url < ApplicationRecord
    validates :short_url,:long_url, presence: true, uniqueness: true

    def self.random_code
        while true
            x = SecureRandom::urlsafe_base64[0...16]
            return x if !exists?(x)
        end
    end

    def self.Factory_method(user,long_url)
        Shortened_Url.create!("user_id" => user.id, "long_url"=>long_url, "short_url"=>Shortened_Url.random_code)
    end

    def num_clicks
        # Model.all.select { |m| m.field == value }
        # x = Visit.all.select{|m| m.url_id == self.id}
        # return x.length
        # return Visit.all
        Visit.all.count{|ele| ele.url_id == self.id}
    end
    def num_uniques
        # Visit.all.select{|ele| ele.url_id == self.id}.uniq
        arr = []
        Visit.all.each do |ele|
            if !arr.include?(ele.url_id) && (ele.url_id == self.id)
                arr << ele.url_id
            end
        end
        arr.length
    end

    def num_recent_uniques

    end

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User

    has_many :visitors_id,
        primary_key: :id,
        foreign_key: :url_id,
        class_name: :Visit

    has_many :visitors,
        through: :visitors_id,
        source: :user
end
