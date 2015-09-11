json.widget do
  json.partial! 'account/widgets/widget', widget: @widget
end

json.profile do
  json.partial! 'account/users/user', user: @profile
end

