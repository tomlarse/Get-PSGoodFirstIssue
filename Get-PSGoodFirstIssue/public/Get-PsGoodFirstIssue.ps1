function Get-PSGoodFirstIssue {
    [CmdletBinding()]
    param (
        $OauthToken
    )

    process {
        $irmbody = @{
            labels = "up-for-grabs"
            state = "open"
        }
        if {
            $irmheader = @{
                Authorization = "token $OauthToken"
            }
        }

        Invoke-RestMethod https://api.github.com/repos/powershell/powershell/issues -Body $param -Headers $irmheader -FollowRelLink | ForEach-Object {$_} | Get-Random
    }
}