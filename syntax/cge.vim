if exists("b:current_syntax")
    finish
endif

syntax keyword cgeTodo TODO FIXME NOTE

syntax match cgeComment "\v\/\/.*$"
      \ contains=cgeTodos,@Spell oneline
syntax region cgeComment start="/\*" end="\*/"
      \ contains=cgeTodos,@Spell fold

syntax keyword cgeType
	\ string
	\ bool
	\ int
	\ int32
	\ int64
	\ bigint
	\ float32
	\ float
	\ float64
	\ map
	\ list

syntax match cgeCustomType "\v(\l|_)+(\l|\d)+" contained skipwhite skipnl
syntax match cgeProperty "\v(\l|_)+(\l|\d):" nextgroup=cgeCustomType skipwhite skipnl
syntax match cgeEventName "\v(\l|_)+(\l|\d)+" contained skipwhite skipnl
syntax match cgeEventDeclaration "\v<(event)>" nextgroup=cgeEventName skipwhite skipnl
syntax match cgeCustomTypeName "\v(\l|_)+(\l|\d)+" contained skipwhite skipnl
syntax match cgeTypeDeclaration "\v<(type)>" nextgroup=cgeCustomTypeName skipwhite skipnl

syntax region cgeBody start="{" end="}" fold transparent

highlight default link cgeTodo Todo
highlight default link cgeComment Comment
highlight default link cgeType Type
highlight default link cgeEventName  Function
highlight default link cgeType Type
highlight default link cgeCustomType Type
highlight default link cgeCustomTypeName Type
highlight default link cgeEventDeclaration Keyword
highlight default link cgeTypeDeclaration Keyword

let b:current_syntax = "cge"
