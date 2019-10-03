---
external help file: Get-PSGoodFirstIssue-help.xml
Module Name: Get-PSGoodFirstIssue
online version:
schema: 2.0.0
---

# Get-PSHacktoberFestIssue

## SYNOPSIS
Gets a random issue from any repo with the language PowerShell and the label `Hacktoberfest`


## SYNTAX

```
Get-PSHacktoberFestIssue [[-OauthToken] <Object>] [[-Language] <Object>] [[-Label] <Object>]
 [[-State] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Gets a random issue from any repo with the language PowerShell and the label `Hacktoberfest`


## EXAMPLES

### Example 1
```powershell
PS C:\> Get-PSHacktoberFestIssue
```

Gets a random issue from any repo with the language PowerShell and the label `Hacktoberfest`

### Example 2
```powershell
PS C:\> Get-PSHacktoberFestIssue -OauthToken $token
```

Gets a random issue from any repo with the language PowerShell and the label `Hacktoberfest` using oAuth authentication.

## PARAMETERS

### -Label
Label to get a random issue from. Default value set to `hacktoberfest` but can be overridden. Rate Limiting may take effect on more popular languages.


```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: hactoberfest
Accept pipeline input: False
Accept wildcard characters: False
```

### -Language
Programming language to search for. Default value is `PowerShell` but can be overridden. Rate Limiting may take effect on more popular languages.


```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: powershell
Accept pipeline input: False
Accept wildcard characters: False
```

### -OauthToken
The Search API has a custom rate limit. For requests using Basic Authentication, OAuth, or client ID and secret, you can make up to 30 requests per minute. For unauthenticated requests, the rate limit allows you to make up to 10 requests per minute.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -State
The state of the issues. Valid values are Open or Closed

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: Open
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
