---
external help file: Get-PSGoodFirstIssue-help.xml
Module Name: Get-PSGoodFirstIssue
online version:
schema: 2.0.0
---

# Get-PSHacktoberFestIssue

## SYNOPSIS
Gets a random issue from with language `powershell` labeled `Hacktoberfest`.

## SYNTAX

```
Get-PSHacktoberFestIssue [[-OauthToken] <Object>] [[-Language] <Object>] [[-Label] <Object>]
 [[-State] <Object>] [<CommonParameters>]
```

## DESCRIPTION
Gets a random issue from with language `powershell` labeled `Hacktoberfest`.

## EXAMPLES

### Example 1
```powershell
PS C:\> Get-PSHacktoberFestIssue
```

Gets a random issue with the label `hacktoberfest` and language powershell.

### Example 2

```powershell
PS C:\> Get-PSHacktoberFestIssue -OauthToken $token
```
Uses a given token to authenticate user.

## PARAMETERS

### -Label
Label to get a random issue from. Per the github api spec it should be possible with a comma separated list, but it does not currently work.

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
Limit searches to a given language

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
Can be used to return issues that are closed. Defaults to open.

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
