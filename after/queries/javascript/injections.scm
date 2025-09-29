; extends
(
	(comment) @comment
	(_ (_ [ ( string ) (template_string) ] @injection.content))
	(#match? @comment ".*HTML.*")
	(#offset! @injection.content 0 1 0 -1)
  (#set! injection.include-children)
	(#set! injection.language "html")
)
