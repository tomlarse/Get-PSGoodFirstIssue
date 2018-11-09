
[![Build status](https://ci.appveyor.com/api/projects/status/3n4785ixqkyvubae/branch/master?svg=true)](https://ci.appveyor.com/project/tomlarse/get-psgoodfirstissue/branch/master)

# Get-PSGoodFirstIssue
Gets a random issue from github.com/Powershell/Powershell labeled `Up-for-grabs`

## Example

```powershell
#Install from Powershell Gallery
Install-Module Get-PSGoodFirstIssue -Scope CurrentUser
Import-Module Get-PSGoodFirstIssue

# Run with
Get-PSGoodFirstIssue

# If you hit the rate limit, get an oauth token from https://github.com/settings/tokens

Get-PSGoodFirstIssue -OauthToken oauthtoken

```