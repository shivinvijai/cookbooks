actions :add, :delete, :set_permissions, :clear_permissions

attribute :user, :kind_of => String, :name_attribute => true
attribute :password, :kind_of => String
attribute :vhost, :kind_of => String
attribute :permissions, :kind_of => String