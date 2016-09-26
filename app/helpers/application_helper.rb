module ApplicationHelper
  def gravatar_for(player, opts = {})
    opts[:alt] = player.name
    image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(player.email)}?s=#{opts.delete(:size) { 40 }}",
              opts
  end
end
