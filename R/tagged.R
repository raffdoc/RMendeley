tagged =
  # Examples: 
  # a <- tagged("phylogenetics") 
  # b <- tagged("phylogenetics", cat="Phylogenetic Methods") 
  # 
function(query, page = NA, numItems = 1000L, cat=NA, subcat=NA, key = getOption("MendeleyKey", stop("need an API key for Mendeley")),
          url = sprintf("%s/%s", "http://api.mendeley.com/oapi/documents/tagged", query))
{
   args = list(consumer_key = key)
   if(!is.na(page))
      args$page = as.integer(page)
   if(!is.na(numItems))
      args$items = as.integer(numItems)
   if(!is.na(cat))
      args$cat = as.character(cat)
   if(!is.na(subcat))
      args$subcat = as.character(subcat)
   tt = getForm(url, .params = args)
   fromJSON(I(tt))
}
