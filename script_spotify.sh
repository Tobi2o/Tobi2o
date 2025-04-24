$ClientId = Read-Host "95f21fd2b2ee4cafa66a39f98c07c5b0"
$ClientSecret = Read-Host "6d1bc1f7b1fe4327ae91199b4af53d61"

Start-Process "https://accounts.spotify.com/authorize?client_id=$ClientId&response_type=code&scope=user-read-currently-playing,user-read-recently-played&redirect_uri=http://127.0.0.1:8888/callback/"

$Code = Read-Host "Please insert everything after 'http://127.0.0.1:8888/callback/?code='"

$ClientBytes = [System.Text.Encoding]::UTF8.GetBytes("${ClientId}:${ClientSecret}")
$EncodedClientInfo =[Convert]::ToBase64String($ClientBytes)

curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -H "Authorization: Basic $EncodedClientInfo" -d "grant_type=authorization_code&redirect_uri=http://127.0.0.1:8888/callback/&code=$Code" https://accounts.spotify.com/api/token