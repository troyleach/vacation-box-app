class User < ActiveRecord::Base
  has_many :profiles
  has_many :vacations
  has_many :place_beens
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #not sure the below line is needed?
  attr_accessor :login

  include Gravtastic
    gravtastic

end

