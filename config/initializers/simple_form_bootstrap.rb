# Use this setup block to configure all options available in SimpleForm.
SimpleForm.setup do |config|
  config.wrappers :bootstrap, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: "input-group-md xs-mb-15" do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :small_hint, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :hint,  wrap_with: { tag: 'p', class: 'small help-block' }
    b.wrapper tag: 'div', class: "input-group-md xs-mb-15" do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_big, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: "input-group xs-mb-15" do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :bootstrap_unregistered, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :element_wrapper, tag: 'div', class: 'input-group' do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :consultant_auth, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper :element_wrapper, tag: 'div', class: 'input-group' do |ba|
      ba.use :input, class: "form-control"
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :simple_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.use :input, class: "form-control"
  end

  config.wrappers :prepend, tag: 'div', class: "control-group", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-prepend' do |prepend|
        prepend.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :append, tag: 'div', class: "control-group", error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label
    b.wrapper tag: 'div', class: 'controls' do |input|
      input.wrapper tag: 'div', class: 'input-append' do |append|
        append.use :input
      end
      input.use :hint,  wrap_with: { tag: 'span', class: 'help-block' }
      input.use :error, wrap_with: { tag: 'span', class: 'help-block' }
    end
  end

  config.wrappers :vertical_form, tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { class: "control-label" }

    b.wrapper tag: 'div' do |ba|
      ba.use :input
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_form, form_class: 'form-horizontal', tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { class: "col-sm-3 control-label text-right" }

    b.wrapper tag: 'div', class: 'col-sm-7 input-group-md xs-mb-15' do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'ul', class: 'parsley-errors-list filled help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :horizontal_form_label_left, form_class: 'form-horizontal', tag: 'div', class: 'form-group', error_class: 'has-error' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, wrap_with: { class: "text-left inline-block small-right-margin" }

    b.wrapper tag: 'div', class: 'input-group-md xs-mb-15 inline-block' do |ba|
      ba.use :input, class: "form-control"
      ba.use :error, wrap_with: { tag: 'ul', class: 'parsley-errors-list filled help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  config.wrappers :inline_checkbox, tag: 'div', class: 'control-group', error_class: 'has-error' do |b|
    b.use :html5
    b.wrapper tag: 'div', class: 'controls' do |ba|
      ba.use :label_input, wrap_with: { class: 'checkbox inline' }
      ba.use :error, wrap_with: { tag: 'span', class: 'help-block' }
      ba.use :hint,  wrap_with: { tag: 'p', class: 'help-block' }
    end
  end

  # Wrappers for forms and inputs using the Twitter Bootstrap toolkit.
  # Check the Bootstrap docs (http://twitter.github.com/bootstrap)
  # to learn about the different styles for forms and inputs,
  # buttons and other elements.
  config.default_wrapper = :bootstrap
end
