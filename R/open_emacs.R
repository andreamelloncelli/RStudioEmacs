
## help(package = "rstudioapi")

addin_open_emacs <- function() {
	## checks
	rstudioapi::verifyAvailable()
	## get the context
	# context <- rstudioapi::getActiveDocumentContext()
	context <- rstudioapi::getSourceEditorContext()
	## check the context
	if (is.null(context)) {
		stop("NULL active context")
	} else if ( context$path == "" ) {
		stop("BUG: file is an empty string")
	}
	## open emacs
	open_emacs( context$path )
}


open_emacs <- function( file_name ) {
	##executable <- system("which emacs")
	emacs_exe <- "emacs"
	command <- paste(emacs_exe, file_name)
	system(command, wait = FALSE)
}
