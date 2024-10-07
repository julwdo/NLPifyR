#' Preprocess Text for Natural Language Processing
#'
#' This function applies a series of text preprocessing steps to enhance the quality
#' of input text for natural language processing tasks. The steps include expanding
#' contractions, extracting meaningful words, removing common English stopwords,
#' and lemmatizing words.
#'
#' @param text Input text to be preprocessed.
#' @param expand_contractions Logical, indicating whether to expand contractions.
#' @param extract_words Logical, indicating whether to tokenize and extract words.
#' @param remove_stopwords Logical, indicating whether to remove stopwords.
#' @param lemmatize_words Logical, indicating whether to lemmatize words.
#' @return Preprocessed text based on the specified steps.
#' @export
#' @examples
#' # Example usage:
#' preprocessed_text <- preprocess("It's a sample text with contractions.",
#'                                 expand_contractions = TRUE,
#'                                 extract_words = TRUE,
#'                                 remove_stopwords = TRUE,
#'                                 lemmatize_words = TRUE)
#' print(preprocessed_text)
#'

preprocess <- function(text,
                       expand_contractions = TRUE,
                       extract_words = TRUE,
                       remove_stopwords = TRUE,
                       lemmatize_words = TRUE) {

  # Step 1: Expand contractions
  if (expand_contractions) {
    text <- NLPifyR:::expand_contractions(text)
  }

  # Step 2: Tokenize and extract words
  if (extract_words) {
    text <- NLPifyR:::extract_words(text)
  }

  # Step 3: Remove stopwords
  if (remove_stopwords) {
    text <- NLPifyR:::remove_stopwords(text)
  }

  # Step 4: Lemmatize words
  if (lemmatize_words) {
    text <- textstem::lemmatize_words(text)
  }

  # Step 5: Join lemmatized words into a preprocessed text
  return(paste(text, collapse = " "))
}
