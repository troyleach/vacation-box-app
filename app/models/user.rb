class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #not sure the below line is needed?
  attr_accessor :login
 
  validates :username, :presence => true, :uniqueness => { :case_sensitive => false }
  validates :first_name, :presence => true
  validates :city, :presence => true
  validates :state, :presence => true

  include Gravtastic
    gravtastic



end

