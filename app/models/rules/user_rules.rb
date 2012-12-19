module Rules
  module UserRules

    include Rules::BaseRules

    def valid_phone?

      if self.phone.blank? || !(self.phone =~ /^([0-9]{8,14})+$/)
        self.errors[:base] << t_error(:phone)
        return false
      end

      if User.exists_phone?(self.phone)
        self.errors[:base] << t_error(:phone, :unique)
        return false
      end

      true
    end

    def valid_password(password)

      if self.password.blank? || self.password != password
        self.errors[:base] << t_error(:password)
        return false
      end

      true
    end

    #TODO REMOVE
    def can_change_gender(gender)
      genders = User::GENDERS.clone

      if self.gender
        self.errors[:base] << t_error(:gender, :already_defined)
        return
      end

      unless genders.compact.include?(gender)
        self.errors[:base] << t_error(:gender)
        return
      end

      true
    end

    def valid_gender?(gender)
      genders = User::GENDERS.clone
      unless genders.compact.include?(gender)
        self.errors[:base] << t_error(:gender)
        return
      end

      true
    end

    def can_change_password?(password, new_password, confirm_password, restore_password)

      unless self.try(:authenticate, password) || restore_password
        self.errors[:base] << t_error(:password, :incorrect)
        return
      end

      if password == new_password
        self.errors[:base] << t_error(:new_password, :cant_match)
        return
      end

      if new_password != confirm_password
        self.errors[:base] << t_error(:confirm_password, :not_match)
        return
      end

      true
    end

    def can_add_friend?(friend_id)
      friend = User.find_by_id(friend_id)

      if friend.nil?
        self.errors[:base] << t_error(:relations, :friend_not_exist)
        return false
      end

      if self.has_friend?(friend)
        self.errors[:base] << t_error(:relations, :friend_already_exist)
        return false
      end

      if friend.has_friend_request?(self)
        self.errors[:base] << t_error(:relations, :you_already_added)
        return false
      end

      if self.has_friend_request?(friend)
        self.errors[:base] << t_error(:relations, :friend_already_invited, user_name => friend.name)
        return false
      end

      true
    end

    def can_accept_friendship?(relation_id)
      relation = UserRelationship.find_by_id(relation_id)

      if relation.nil?
        self.errors[:base] << t_error(:relations, :invitation_not_exist)
        return false
      end

      if relation.accepted?
        self.errors[:base] << t_error(:relations, :already_accepted)
        return false
      end

      if relation.friend != self
        self.errors[:base] << t_error(:relations, :wrong_acceptor)
        return false
      end

      true
    end

  end

end