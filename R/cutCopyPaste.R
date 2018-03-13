
rs_cut <- function() {
	cont <- getActiveDocumentContext()
	selection <- primary_selection(cont$selection)
	write_clip(selection$text)
	modifyRange(selection$range, "")
}

rs_copy <- function() {
	cont <- getActiveDocumentContext()
	selection <- primary_selection(cont$selection)
	write_clip(selection$text)
}

rs_paste <- function() {
	if(!clipr::clipr_available()) stop("no clipr data")
	buf <- read_clip()
	insertText(paste(buf, collapse = "\n"))
}
