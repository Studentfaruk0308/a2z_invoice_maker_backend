class User < ApplicationRecord
    has_secure_password
    # authenticates
    # reader and writers for the password
    # validates the presence of password
    
end
