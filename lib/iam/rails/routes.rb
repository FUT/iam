module ActionDispatch::Routing
  class Mapper
    def iam
      match '/iam_you/:id', controller: :iam, action: :logged_in_as, as: :iam_you
    end
  end
end
