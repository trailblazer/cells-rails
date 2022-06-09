require "test_helper"

class ContextTest < MiniTest::Spec
  class ParentCell < Cell::ViewModel
    def user
      context[:user]
    end
  end

  let (:model) { Object.new }
  let (:user) { Object.new }
  let (:controller) { Object.new }

  it do
    cell = ParentCell.(model, admin: true, context: { user: user, controller: controller })
    # cell.extend(ParentController)

    _(cell.model).must_equal model
    _(cell.controller).must_equal controller
    _(cell.user).must_equal user

    # nested cell
    child = cell.cell("context_test/parent", "")

    _(child.model).must_equal ""
    _(child.controller).must_equal controller
    _(child.user).must_equal user
  end
end
