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
	\ float32
	\ float
	\ float64
	\ map
	\ list


syntax match cgeCustomType "\v(\l|_)(\l|\d|_)*" contained skipwhite skipnl
syntax match cgeEnumValue "\v(\l|_)(\l|\d|_)*" skipwhite skipnl
syntax match cgeProperty "\v(\l|_)(\l|\d|_)*:" nextgroup=cgeCustomType,cgeTypeDeclaration skipwhite skipnl
syntax match cgeGeneric "\v\<" nextgroup=cgeCustomType,cgeTypeDeclaration skipwhite skipnl
syntax match cgeEventName "\v(\l|_)(\l|\d|_)*" contained skipwhite skipnl
syntax match cgeEventDeclaration "\v<(event|command)>" nextgroup=cgeEventName skipwhite skipnl
syntax match cgeCustomTypeName "\v(\l|_)(\l|\d|_)*" contained skipwhite skipnl
syntax match cgeTypeDeclaration "\v<(type|enum)>" nextgroup=cgeCustomTypeName skipwhite skipnl
syntax match cgeConfigDeclaration "\vconfig" skipwhite skipnl


syntax match cgeName "\v(\l|_)(\l|\d|_)*" contained skipwhite skipnl
syntax match cgeNameDecl "\v<(name)>" nextgroup=cgeName skipwhite skipnl

syntax match cgeVersion "\v\d+\.\d+" contained skipwhite skipnl
syntax match cgeVersionDecl "\v<(version|cge)>" nextgroup=cgeVersion skipwhite skipnl

syntax region cgeBody start="{" end="}" fold transparent

highlight default link cgeTodo Todo
highlight default link cgeComment Comment
highlight default link cgeType Type
highlight default link cgeEventName  Function
highlight default link cgeType Type
highlight default link cgeCustomType Type
highlight default link cgeCustomTypeName Type
highlight default link cgeConfigDeclaration Keyword
highlight default link cgeEventDeclaration Keyword
highlight default link cgeTypeDeclaration Keyword
highlight default link cgeNameDecl Keyword
highlight default link cgeName Constant
highlight default link cgeVersionDecl Keyword
highlight default link cgeVersion Constant

let b:current_syntax = "cge"
