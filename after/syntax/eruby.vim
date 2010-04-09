" also handle one-liner eRuby directives with leading whitespace
execute substitute(filter(readfile(split(globpath(&runtimepath, 'syntax/eruby.vim'), "\n")[0]), 'v:val =~ "region\\s\\+erubyOneLiner"')[0], '%', '\\s\\+&', '')
