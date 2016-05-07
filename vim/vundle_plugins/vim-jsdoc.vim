if exists('g:vundle_installing_plugins')
  Plugin 'heavenshell/vim-jsdoc'
  finish
endif

" Allow prompt for interactive input.
let g:jsdoc_allow_input_prompt = 1

"Prompt for a function description
let g:jsdoc_input_description = 1

"Prompt for a value for @name, add it to the JSDoc block comment along with the @function tag.
let g:jsdoc_additional_descriptions = 1

"Add the @return tag.
let g:jsdoc_return = 1

"Prompt for and add a type for the aforementioned @return tag.
let g:jsdoc_return_type = 1

"Prompt for and add a description for the @return tag.
let g:jsdoc_return_description = 1

"Set value to 1 to turn on access tags like @access <private|public>. Set value to 2 to turn on access tags like @<private|public>
let g:jsdoc_access_descriptions = 0

"Set value to 1 to turn on detecting underscore starting functions as private convention
let g:jsdoc_underscore_private = 0

"Characters used to separate @param name and description.
let g:jsdoc_param_description_separator = ' - '

"Override default type and description. See help more detail.
let g:jsdoc_custom_args_hook = {}

"When using custom_args_hook, only match against regexes
let g:jsdoc_custom_args_regex_only = 0

"Allow to insert default description depending on the type.
let g:jsdoc_type_hook = {}

"Enable to use ECMAScript6's Shorthand function, Arrow function.
let g:jsdoc_enable_es6 = 1

