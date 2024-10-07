#' @export
#' @keywords internal
NULL

# Function: expand contractions (e.g., "it's" -> "it is")
expand_contractions <- function(text) {
  return(textclean::replace_contraction(tolower(text)))
}

# Function: extract words from text
extract_words <- function(text) {
  tokens <- unlist(tokenizers::tokenize_words(text))
  return(tokens[grepl("^[a-zA-Z]+$", tokens)])
}

# Function: remove stopwords
remove_stopwords <- function(words) {
  stop_words <- tm::stopwords("en")
  return(words[!words %in% stop_words])
}
