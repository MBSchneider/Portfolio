class ProjectDecorator < Draper::Decorator

  decorates :project

  delegate_all
  decorates_finders

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end
  # def avatar
  #   "AVATAR"
  # end

  def decorate_image
    if model.image_processed?
      return h.image_tag model.image_url(:thumb) if model.image?
    else
      return '<em>processing...</em>'
    end
  end

end
