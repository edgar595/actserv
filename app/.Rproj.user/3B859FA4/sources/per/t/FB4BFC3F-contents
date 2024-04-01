library(httr)
library(jsonlite)

# Function to authenticate user and get credentials
sign_in <- function(email, password, api_key) {
  url <- "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword"
  payload <- list(email = email, password = password, returnSecureToken = TRUE)
  params <- list(key = api_key)
  response <- POST(url, query = params, body = payload, encode = "json")
  content <- content(response, as = "parsed")
  return(content)
}

# Function to retrieve user data from Firestore
get_user_data <- function(id_token, user_id, api_key) {
  url <- paste0("https://firestore.googleapis.com/v1/projects/your-project-id/databases/(default)/documents/users/", user_id)
  params <- list(key = api_key, access_token = id_token)
  response <- GET(url, query = params)
  content <- content(response, as = "parsed")
  return(content)
}

# Sign in user and retrieve data
email <- "edgarmugambi10@gmail.com"
password <- "12345678"
api_key <- "AIzaSyAHQyflhstJrNBObhr8pLYCE5ynVKFXFxI"

auth_info <- sign_in(email, password, api_key)
id_token <- auth_info$idToken
user_id <- auth_info$localId

auth_info
id_token
user_id

user_data <- get_user_data(id_token, user_id, api_key)
print(user_data)





