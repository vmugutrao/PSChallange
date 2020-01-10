Function Letterchange1
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


Function Letterchange2($String){
    $Alphabets     = '[^a-zA-Z-]'
    $Vowels        = @("A","E","I","O","U")
    $UpdatedString = ""
    
    $String.tochararray() | %{
        $SplitAlphabet = $_.tostring().ToLower()
        if($SplitAlphabet.tostring().toupper() -ne "Z")
        {
            if(!($SplitAlphabet -match $Alphabets)){$next = [char](([byte][char] $SplitAlphabet ) + 1)}
            else{$next = $SplitAlphabet}
        }
        else
        {
            $next = "a"
        }
        if($Vowels.Contains($next.tostring().ToUpper())){$next = $next.tostring().ToUpper()}
        $UpdatedString = $UpdatedString + $next
    }
    
    return $UpdatedString
}

