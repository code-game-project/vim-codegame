if exists("b:current_syntax")
    finish
endif

syntax keyword cgeTodo TODO FIXME NOTE

syntax match cgeComment "\v\/\/.*$"
      \ contains=cgeTodos,@Spell oneline
syntax region cgeComment start="/\*" end="\*/"
      \ contains=cgeTodos,@Spell fold

syntax keyword cgeKeyword
	\ event
	\ type

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

syntax region cgeBody start="{" end="}" fold transparent

highlight default link cgeTodo Todo
highlight default link cgeComment Comment
highlight default link cgeType Type
highlight default link cgeKeyword Keyword
highlight default link cgeFunction Function
highlight default link cgeFunctionCall Type
highlight default link cgeDeclaration Keyword

let b:current_syntax = "cge"
