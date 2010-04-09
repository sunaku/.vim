" load Ruby bundles if we're inside a Ruby project
if !empty(globpath('.', '{Gemfile,Rakefile,*.gemspec,*.rb}'))
  call Unftbundle('ruby')
end
