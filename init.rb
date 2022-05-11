require File.expand_path 'lib/time_logger_hooks', __dir__
require File.expand_path 'lib/time_logger_application_helper_patch', __dir__

Redmine::Plugin.register :time_logger do
  name 'Time Logger'
  author 'Jim McAleer'
  description 'The orignal author was Jérémie Delaitre.'
  url 'https://github.com/speedy32129/time_logger'
  version '20.10.23'

  requires_redmine version_or_higher: '5.0.0'

  settings default: { refresh_rate: '60', status_transitions: {}, redirect_to_new_time_entry: 'off' }, partial: 'settings/time_logger'

  permission :view_others_time_loggers, time_loggers: :index
  permission :delete_others_time_loggers, time_loggers: :delete

  menu :account_menu, :time_logger_menu, 'javascript:void(0)',
       caption: '',
       html: { id: 'time-logger-menu' },
       first: true,
       param: :project_id,
       if: proc { User.current.logged? }
end
