module ApplicationHelper
  # Setting default avatar in case of missing one's
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  # Self made pluralize
  def declension(number, one, two, multy)
    tail10 = number % 10
    tail100 = number % 100

    return one if (tail10 == 1 && tail100 != 11)

    if ((tail10.between?(2,4)) && !tail100.between?(12, 14))
      return two
    end

    return multy
  end

  # A method to show font-awesome icons
  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
