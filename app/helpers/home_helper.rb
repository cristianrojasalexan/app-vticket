module HomeHelper
    def get_username(id)
        user = User.find(id)
        user = user.first_name + " " + user.last_name
        return user
    end
end
