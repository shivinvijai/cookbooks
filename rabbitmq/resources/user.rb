actions :add, :delete, :set_permissions, :clear_permissions, :set_tags, :clear_tags, :change_password
default_action :add

attribute :user, :kind_of => String, :name_attribute => true
attribute :password, :kind_of => String
attribute :vhost, :kind_of => [String, Array]
attribute :permissions, :kind_of => String
attribute :tag, :kind_of => String