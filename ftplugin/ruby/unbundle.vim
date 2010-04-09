" preload Ruby bundles if we're inside a Ruby/Rails directory
if !empty(globpath('.', '{[Gg]emfile*,[Rr]akefile,*.gemspec,*.rb}'))
  UnpackFiletype ruby
end
