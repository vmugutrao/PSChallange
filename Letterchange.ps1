Function Letterchange
    {
    [CmdletBinding()]
    Param
    (
    [Parameter(Mandatory=$true)]$Str
    )

    Begin
        {
        $NewString = @()
        $SpecialChar = (@("~","!","@","#","$","%","^","&","(",")","-",".+","=","}","{","\","/","|",";",",",":","<",">","?","'","*"))
        $IntRegex = "[+-]?[0-9][0-9]*"
    }
    Process
        {
        [String]$str = $Str
        $Splited = $str[0..($str.length)]
        Foreach($A in $Splited)
            {
            [string]$A = [string]$A
            $A = $A.ToLower()
            $NewChar = $null
            if($A -eq 'z')
                {
                $NewChar = 'a'
            }
            elseIf($A -eq ' ')
                {
                $NewChar = ' '
            }
            elseif($SpecialChar -contains $A -or $A -match $IntRegex)
                {
                 $NewChar = $A
            }
            Else
                {
                $char=[int][char]$A
                $char++
                $NewChar = [char]$char
            }
            [String]$NewString = "$NewString"+"$NewChar"
            }
        
    }
    End
        {
        [String]$Output = $NewString.Replace('a','A').Replace('e','E').Replace('i','I').Replace('o','O').Replace('u','U')
        Return $Output
    }
}
