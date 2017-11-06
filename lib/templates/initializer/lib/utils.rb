# frozen_string_literal: true

# Utils.
module Utils

  # This function transforms a date object to the age.
  def birthday_to_age(birthday)
    now = Time.now.utc.to_date
    remove_condition = now.month > birthday.month ||
                       (now.month == birthday.month &&
                        now.day >= birthday.day)
    remove = (remove_condition ? 0 : 1)
    now.year - birthday.year - remove
  end

  # This function paginates an array of objects.
  def paginate_array(array, page, per_page)
    start = (page - 1) * per_page
    length = per_page

    start < array.length ? array[start, length] : []
  end

end
