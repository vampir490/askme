module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def declension(number, one, two, multy)
    tail10 = number % 10
    tail100 = number % 100

    return one if (tail10 == 1 && tail100 != 11)

    if ((tail10 >= 2 && tail10 <= 4) && !tail100.between?(12, 14))
      return two
    end

    return multy
  end
end
