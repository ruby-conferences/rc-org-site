module TwitterHelpers
  def twitter_link(handle)
    link_to "@#{handle}", "https://twitter.com/#{handle}"
  end
end
