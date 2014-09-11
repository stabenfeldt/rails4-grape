module ApplicationHelper
  def body_id
    "#{controller.controller_name}_#{controller.action_name}"
  end

  def return_users_nr_in_array(array, user: user)
    array.find_index(user)
  end

  def add_remaining_tds(array, user: user)
    array.size - return_users_nr_in_array(@workers, user: user) -1
  end
end
