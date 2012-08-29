module IamHelper
  def iam
    roles = Role.all
    user_groups = roles.inject([]) { |memo, role| role.users.limit(2) }
    Gon.global.grouped_users = user_groups.map do |group|
      group.map do |user|
        {
          name: user.name,
          link: 'lint'
        }
      end
    end
  end
end

ActionView::Base.send :include, IamHelper
