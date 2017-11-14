#instalo y cargo twitteR and ROAuth
library(RCurl)
require(twitteR)
library(ROAuth)

#download "cacert.pem" file
download.file(url ="http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")

#creo un objeto "cred" que guardara el objeto autentificado para usarlo en sesiones posteriores

reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
api_Key <-  "JgZvtUFREHzwLLaw6Fy0tMmBr"
api_Secret <- "mBpYffEvElhB7gEOFps1HTRJjcdYUW9ll6fDuMGGVCpjsito78"

cred <- OAuthFactory$new(consumerKey=api_key,
                             consumerSecret=api_secret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL
)
#una vez ejecutado el comando de mas abajo nos redirigira a la web donde despues de autorizar la aplicacion "authorize app"
#nos hara introducir el codigo que nos proporciona. Introducimos ese codigo en RStudio y gurardamos el objet "cred" en nuestra computadora
#como "twitter authentication.Rdata
cred$handshake(cainfo="cacert.pem") 

7289478

#Ahora tenemos que extraer tweets, cargar "twitter authentication.Rdata" correrlo y registrar. esto deberia devolver TRUE indicando que todo
#esta ok.
save(cred, file="twitter authentication.Rdata")
load("twitter authentication.Rdata")

#Seguidamente tenemos que crear 2 variables una para la busqueda de la cadena de palabras que queremos buscar (puede ser un hashtag o una 
#expresion que un usuario haya mencionado) y otra para el numero de tweets que queremos extraer


api_Key <-  "JgZvtUFREHzwLLaw6Fy0tMmBr"                                    # my api_Key
api_Secret <- "mBpYffEvElhB7gEOFps1HTRJjcdYUW9ll6fDuMGGVCpjsito78"         # my api_secret
access_token <- "923352876566671360-h7sYCdMuTpFU1M1J0dM0KKEp0wxzzqE"       # my access_token 
access_token_secret <- "TkHXpDo5a56bS7g6zgSlAeEiDIgvaoHRCV63Gc0UW0K7Z"     # my access_token_sceret 


setup_twitter_oauth(api_key,api_secret,access_token,
                    access_token_secret)

#buscamos la palabra Narcan
search.string <- "Narcan"
no.of.tweets <- 1000

tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")
tweets.df <- twListToDF(tweets) 

#escribimos el archivo csv para guardar el data frame tweets.df
write.csv(tweets.df, file="my_tweets4.csv")
