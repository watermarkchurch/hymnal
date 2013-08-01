# http://www.sebgrosjean.com/en/news/2012/2/27/twitter-bootstrap-and-simple_form
# Add a wrapped_button for Twitter bootstrap styles
module WrappedButton
  def wrapped_button(*args, &block)
    template.content_tag :div, :class => "form-actions" do
      options = args.extract_options!
      loading = self.object.new_record? ? I18n.t('simple_form.creating') : I18n.t('simple_form.updating')
      options[:"data-loading-text"] = [loading, options[:"data-loading-text"]].compact
      options[:class] = ['btn-primary', options[:class]].compact
      args << options
      if cancel = options.delete(:cancel)
        [
          submit(*args, &block),
          template.link_to(I18n.t('simple_form.buttons.cancel'), cancel, class: "btn")
        ].join(' ').html_safe
      else
        submit(*args, &block)
      end
    end
  end
end

SimpleForm::FormBuilder.send :include, WrappedButton
