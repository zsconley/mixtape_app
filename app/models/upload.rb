class Upload < ActiveRecord::Base
	belongs_to :user

	has_attached_file :cover,
              :styles => { :medium => "300x300>", :thumb => "100x100>" },
              :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/

    has_attached_file :audio
	validates_attachment_presence :audio
	validates_attachment_content_type :audio, :content_type => [ 'audio/mp3','audio/mpeg']
end
