function New-Password {
    [CmdletBinding()]
    [OutputType([String])]
    Param()
    [int]$PasswordLength = 7
    [String[]]$InputStrings = @('ABCEFGHJKLMNPQRSTUVWXYZ', '23456789')
    Function Get-Seed{
            $RandomBytes = New-Object -TypeName 'System.Byte[]' 4
            $Random = New-Object -TypeName 'System.Security.Cryptography.RNGCryptoServiceProvider'
            $Random.GetBytes($RandomBytes)
            [BitConverter]::ToUInt32($RandomBytes, 0)
            }
    $Password = @{}
    $CharGroups = $InputStrings
    $AllChars = $CharGroups | ForEach-Object {[Char[]]$_}
    Foreach($Group in $CharGroups) 
            {
                    if($Password.Count -lt $PasswordLength) {
                        $Index = Get-Seed
                        While ($Password.ContainsKey($Index)){
                        $Index = Get-Seed                        
                    }
                    $Password.Add($Index,$Group[((Get-Seed) % $Group.Count)])
                }
            }
    for($i=$Password.Count;$i -lt $PasswordLength;$i++) {
    $Index = Get-Seed
    While ($Password.ContainsKey($Index)){
    $Index = Get-Seed                        
    }
    $Password.Add($Index,$AllChars[((Get-Seed) % $AllChars.Count)])
    }
    [String]$Pass = $(-join ($Password.GetEnumerator() | Sort-Object -Property Name | Select-Object -ExpandProperty Value))
    return $Pass
}

$i = 0
$Passwords = @()
Do
    {
    $i = $i+1
    $Pass = @()
    $NewPass = New-Password
    $Pass = New-Object -TypeName psobject -Property @{Password="$NewPass"}
    $Passwords += $Pass.password
    
}Until($i -eq 1500 -and $Passwords -notcontains $Pass)
$Passwords
