Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Repository -Value {"$(($this.repository_url -split '/')[-2])/$(($this.repository_url -split '/')[-1])" -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName "Title " -Value {$this.Title -replace '.*',"$([char]0x1b)[96m`$0$([char]0x1b)[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Issue -Value {$this.number -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Status -Value {$this.state -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName Link -Value {$this.html_url -replace '.*',"$([char]0x1b)[96m`$0$([char]0x1b)[39m"} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -MemberType ScriptProperty -MemberName "Assigned to" -Value {
    if ($this.Assignee.login) {
        $this.Assignee.login -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"
    } elseif ($this.Assignee) {
        $this.Assignee -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"
    } else {
        "Unassigned" -replace '.*',"$([char]0x1b)[92m`$0$([char]0x1b)[39m"
    }
} -Force
Update-TypeData -TypeName PSGFI.GithubIssue -DefaultDisplayPropertySet "Title ", Repository, Issue, Status, "Assigned to", Link

# credit to fcabralpacheco for redirect url
# https://github.com/PowerShell/PowerShell/issues/2896#issuecomment-365811411
function Get-RedirectedUrl() {
    param(
      [Parameter(Mandatory = $true, Position = 0)]
      [uri] $url,
      [Parameter(Position = 1)]
      [Microsoft.PowerShell.Commands.WebRequestSession] $session = $null
    )

    $request_url = $url
    $retry = $false

    do {
      try {
        $response = Invoke-WebRequest -Method Head -WebSession $session -Uri $request_url

        if($null -ne $response.BaseResponse.ResponseUri)
        {
          # PowerShell 5
          $result = $response.BaseResponse.ResponseUri.AbsoluteUri
        } elseif ($null -ne $response.BaseResponse.RequestMessage.RequestUri) {
          # PowerShell Core
          $result = $response.BaseResponse.RequestMessage.RequestUri.AbsoluteUri
        }

        $retry = $false
      } catch {
        if(($_.Exception.GetType() -match "HttpResponseException") -and
          ($_.Exception -match "302"))
        {
          $request_url = $_.Exception.Response.Headers.Location.AbsoluteUri
          $retry = $true
        } else {
          throw $_
        }
      }
    } while($retry)

    return $result
  }

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

        $url = Get-RedirectedUrl -Url "https://api.github.com/repos/$Repo/issues"
        $issue = Invoke-RestMethod $url -Body $irmbody -Headers $irmheader | ForEach-Object {$_} | Get-Random

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
        $State = 'open'

    )

    process {
        $irmbody = @{
            labels = $Label
            state = $state
        }
        if ($OauthToken) {
            $irmheader = @{
                Authorization = "token $OauthToken"
            }
        }

        $uri = "https://api.github.com/search/issues?q=language:{0}+label:{1}+state:{2}" -f $Language, $Label, $State

        $uri = Get-RedirectedUrl -Url $uri
        $result = Invoke-RestMethod $uri -Body $irmbody -Headers $irmheader
        $issue = $result.items | Get-Random
        $issue.pstypenames.insert(0,"PSGFI.GithubIssue")

        $issue
    }
}

Export-ModuleMember -Function *-*
