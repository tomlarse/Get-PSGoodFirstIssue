Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Repository -Value {"$(($this.repository_url -split '/')[-2])/$(($this.repository_url -split '/')[-1])" -replace '.*',"`e[92m`$0`e[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName "Title " -Value {$this.Title -replace '.*',"`e[96m`$0`e[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Issue -Value {$this.number -replace '.*',"`e[92m`$0`e[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Status -Value {$this.state -replace '.*',"`e[92m`$0`e[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Link -Value {$this.html_url -replace '.*',"`e[96m`$0`e[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName "Assigned to" -Value {
    if ($this.Assignee.login) {
        $this.Assignee.login -replace '.*',"`e[92m`$0`e[39m"
    } elseif ($this.Assignee) {
        $this.Assignee -replace '.*',"`e[92m`$0`e[39m"
    } else {
        "Unassigned" -replace '.*',"`e[92m`$0`e[39m"
    }
} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -DefaultDisplayPropertySet "Title ", Repository, Issue, Status, "Assigned to", Link

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

        $issue = Invoke-RestMethod "https://api.github.com/repos/$Repo/issues" -Body $irmbody -Headers $irmheader -FollowRelLink | ForEach-Object {$_} | Get-Random

        $issue.pstypenames.insert(0,"PSGFI.GithubIssue")

        $issue
    }
}

function Get-PSHacktoberFestIssue {
    [CmdletBinding()]
    param (
        $OauthToken,
        $Language = 'powershell',
        $Label = 'hacktoberfest',
        [Parameter()]
        [ValidateSet('open', 'closed')]
        $State = 'open'

    )

    process {
        if ($OauthToken) {
            $irmheader = @{
                Authorization = "token $OauthToken"
            }
        }

        $uri = "https://api.github.com/search/issues?q=language:{0}+label:{1}+state:{2}&per_page=100" -f $Language, $Label, $State

        $result = Invoke-RestMethod $uri -Headers $irmheader -FollowRelLink
        $issue = $result.items | Get-Random
        $issue.pstypenames.insert(0,"PSGFI.GithubIssue")

        $issue
    }
}

Export-ModuleMember -Function *-*
