#!/bin/sh
youremail='janis.graf@st.oth-regensburg.de'
yourpassword='QrD$tMd9>!}TyqF'

# Requesting the access token
json_reply=$(curl --location --request POST 'https://api.up42.com/oauth/token' \
--header 'Content-Type: application/x-www-form-urlencoded' \
--data-urlencode 'grant_type=password' \
--data-urlencode "username=$youremail" \
--data-urlencode "password=$yourpassword" 2>/dev/null)
echo $json_reply

# Extracting the access token from json_reply
accessToken=$(echo $json_reply | sed -E 's/.*\"accessToken\":\"([A-Z0-9a-z_\-]*)\".*/\1/')
accessTokenManuel="eyJ0eXAiOiJKV1QiLCJraWQiOiIxIiwidG9rZW5fdHlwZSI6IkFDQ0VTUyIsImFsZyI6IlJTNTEyIn0.eyJpc3MiOiJiYWNrZW5kLWNvcmUiLCJqdGkiOiJmMGIzMzkwMi02OGYwLTQ2MWQtYmU5ZC04NGMyNjE4OTIxNmMiLCJpYXQiOjE3MTY1NTkwNjQsInN1YiI6IjQzMjY0NmUxLTYzYTAtNDk0OC05MzM0LWIyMjMzNjUzMmQ5NCIsImF1ZCI6ImFwaS51cDQyLmNvbSIsImV4cCI6MTcxNjU1OTM2NCwiYXV0aG9yaXRpZXMiOlsiQUNDT1VOVF9BRE1JTiIsIlVTRVIiXSwiY2xpZW50X2lkIjoiZnJvbnRlbmQtYXBwIiwiY2xpZW50X3R5cGUiOiJVU0VSIiwiYWNjb3VudF9pZCI6IjQzMjY0NmUxLTYzYTAtNDk0OC05MzM0LWIyMjMzNjUzMmQ5NCIsInJlc2VsbGVyIjoiVVA0MiJ9.Df7SPYTY4BQ2Eh3aeXMLvvgiOAqCz5pnq-LGEArJYVDCYFxluQN7G-G9VRfgl--Y7cVnJSgeFzAxsYZoF5TtIKPrT-5F5Yr8eOKplC98DGai1XD4C5tNHUK_8Y92B1gW6cyp4xoohMuz7PnXnUFkjdO4gkk_29CaTS_oSsu021Hl1D4om5ApDEeHRjcB53W9fsAhem5jmOR-zDkIyP-AmopEL6d60Fyh5JebO02ZdhYK90DE9jgaFSYsU2XbjAJjP2TKalO7BW_OO0tu3FONcPap8yVGyfCg42PI8jF5bU62-v3Rb1Tom2cvHr-uCzlYJJw2rv-pTTzuSzciEUa7J7me6RhX-jLwNfEj4MpIn0qgAYWodB7MKMZTllCelDHlQwNSAQslmDiiC1h47durHRrEq3_09vBa7-ZdpNaML-bYYcuzahKDzIoBtGCIK82MrvTEWqFGCNy8SUEqseQS7y3CPafYJReRYZg_7yTyaOurB4joJqiIlnGq0yaMmm7jA0IGGUrzvNa4o2iQfq-ANvVbJjuyOGTQd_hQ6U3BV9HcaUWy0wzxMMw6YUKfqdQypWstvFvgbqojb2mORQuAAh4T-rurrPCCX1urq5Nzk7UzpnnvFjFammhnzpbZDjftDrBsJMX4wZOv0yebLx9BTLASwPPDrygwIgv4K6QMBWA"
#x=$(echo $json_reply | sed -n 's/.*"accessToken": "\([^"]*\)".*/\1/p')
echo $accessToken
$accessTokenManuel>token.txt

# Requesting the information about the processing jobs
information=$(curl --request GET \
--url https://api.up42.com/v2/processing/jobs \
--header 'accept: application/json' \
--header 'authorization: Bearer $accessToken' 2>/dev/null)

# Displaying the information
#echo $information