module IamHelper
  def iam
    Gon.global.iam = { grouped_users: parametrized_user_groups }
  end

  private
  def parametrized_user_groups
    user_samples.map do |group|
      group.map do |user|
        parametrize_user user
      end
    end
  end

  def user_samples
    Role.all.inject([]) { |memo, role| memo << role.users.limit(2) }
  end

  def parametrize_user(user)
    {
      name: user.name,
      link: iam_you_path(user)
    }
  end
end
