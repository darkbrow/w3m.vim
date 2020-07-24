" File: autoload/w3m/search_engines/python.vim
" Last Modified: 2020.07.25
" Version: 1.0.1
" Author: yuratomo (twitter @yusetomo)

let s:engine = w3m#search_engine#Init('python', 'https://www.google.com/search?sitesearch=https://docs.python.org/3&q=%s')

function! s:engine.preproc()
  let s:user_agent_backup = g:user_agent
  call w3m#SetUserAgent('KDDI', 0)
endfunction

function! s:engine.postproc()
  let g:user_agent = s:user_agent_backup
  unlet s:user_agent_backup
endfunction

function! s:engine.filter(outputs)
  return w3m#search_engine#GoogleSiteFilter(a:outputs)
endfunction

call w3m#search_engine#Add(s:engine)
