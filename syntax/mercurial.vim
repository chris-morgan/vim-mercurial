" Vim syntax file
" Language: mercurial syntax file
" Maintainer: Daniel Neuhäuser <dasdasich@gmail.com>
" Filenames: /hg-editor*

if exists("b:current_syntax")
  finish
endif

syn match  hgCommitFirstLine  "\%^.*"                     contains=hgCommitSummary       nextgroup=hgCommitBlank skipnl
syn match  hgCommitBlank      "^.*"             contained
syn match  hgCommitSummary    "^.\{0,50}"       contained                                nextgroup=hgCommitOverflow
syn match  hgCommitOverflow   ".*"              contained
syn match  hgCommitComment    "^HG:.*"                    contains=hgCommitCommentLeader
syn match  hgCommitCommentLeader "^HG:\s*"      contained                                nextgroup=hgCommitUser,hgCommitBranch,hgCommitAdded,hgCommitChanged,hgCommitRemoved,hgCommitSubrepo
syn match  hgCommitUser       "user: "          contained nextgroup=hgCommitUsername
syn match  hgCommitUsername   ".*"              contained
syn match  hgCommitBranch     "branch "         contained nextgroup=hgCommitBranchname
syn region hgCommitBranchname start="'" end="'" contained
syn match  hgCommitAdded      "added "          contained nextgroup=hgCommitPath
syn match  hgCommitChanged    "changed "        contained nextgroup=hgCommitPath
syn match  hgCommitRemoved    "removed "        contained nextgroup=hgCommitPath
syn match  hgCommitSubrepo    "subrepo "        contained nextgroup=hgCommitPath
syn match  hgCommitPath       ".*"              contained

hi def link hgCommitSummary       Title
hi def link hgCommitOverflow      Error
hi def link hgCommitBlank         Error
hi def link hgCommitComment       Comment
hi def link hgCommitCommentLeader Comment
hi def link hgCommitUser          Type
hi def link hgCommitBranch        Type
hi def link hgCommitAdded         Type
hi def link hgCommitChanged       Type
hi def link hgCommitRemoved       Type
hi def link hgCommitSubrepo       Type
hi def link hgCommitUsername      Special
hi def link hgCommitBranchname    Special
hi def link hgCommitPath          Special

let b:current_syntax = "mercurial"
