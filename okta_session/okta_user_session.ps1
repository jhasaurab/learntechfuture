#Force request to be sent via TLS1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

#Input file, contains user email address and okta UID
#email,uid
#sj@learntechfuture.com,00u28hsnhcBmsf93d357
#reportonly@labtest1.tk,00u1ykdwieJHKynO5357

$ImportFile = import-csv "$home\Desktop\user.csv"
$UserID = $ImportFile.uid

$Output = @()
foreach ($userids in $ImportFile) {
$headers = New-Object "System.Collections.Generic.Dictionary[[String],[String]]"
$headers.Add("Accept", "application/json")
$headers.Add("Content-Type", "application/json")
#$headers.Add("Authorization", "SSWS Paste_Okta_Token")
$headers.Add("Authorization", "SSWS 00Y8rfTVL0iBuWOqxntuiD3FjqQwJMJh6nqT1NsfDC")

# Construct URL for request
$start = "https://dev-985547.okta.com/api/v1/users/"
$user = $userids.uid
$end = "/sessions"
$url = $start + $user + $end
write-host ($url + " request sent for " + $userids.email) -ForegroundColor Green

# Actual Changes
$response = Invoke-RestMethod $url -Method 'DELETE' -Headers $headers -Body $body

#$response | ConvertTo-Json
$Output +=$response
}
$Output
