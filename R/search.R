msearch =
  #
  #  a = msearch("bob", , 20)
  #  d = msearch("bob", 4, 20)
  #
function(query, page = NA, numItems = 1000L, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/search", query))
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
