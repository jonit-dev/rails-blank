class User < ApplicationRecord

  has_secure_password

  # EMAIL_REGEX = '/^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i'

  validates :email,
            :presence => true,
            :length => {:maximum => 50},
            :uniqueness => true
            # :format => {:with => EMAIL_REGEX}


  validates :password,
            :presence => true
            # :confirmation => true


end
