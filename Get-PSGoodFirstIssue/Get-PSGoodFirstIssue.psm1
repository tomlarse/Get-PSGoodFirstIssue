function Get-PSGoodFirstIssue {
    [CmdletBinding()]
    param (
        $OauthToken,
        $Repo = "powershell/powershell",
        $Labels = "up-for-grabs"
    )

    process {
        $irmbody = @{
            labels = $Labels
            state = "open"
        }
        if ($OauthToken) {
            $irmheader = @{
                Authorization = "token $OauthToken"
            }
        }

        Invoke-RestMethod "https://api.github.com/repos/$Repo/issues" -Body $irmbody -Headers $irmheader -FollowRelLink | ForEach-Object {$_} | Get-Random
    }
}

Export-ModuleMember -Function *-*
