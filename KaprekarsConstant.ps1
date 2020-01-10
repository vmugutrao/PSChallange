Function KaprekarsConstant($num)
    {
    $i = 0
    [String]$num1 = $num
    ($num1[0..($num1.length)]) | ForEach-Object { if((($num1.Split("$_")).count-1) -gt 2){Write-Host "More that 2 duplicate digit";break}}
    If($num1.length -le 2 -or $num1.Length -gt 4 )
        {
        Write-Host "number should be minimum 3 and maximum 4 digit, [$Num]" -ForegroundColor Red
        Break
    }
    If($num1.length -lt 4 )
        {
        Write-Host "adding '0' at end"
        $num1 = "$($num1)0"
    }

    Do {
        $i = $i+1
        [String]$num1 = $num1
        [int]$DesNum = ($num1[0..($num1.length)] | Sort -Descending) -join ''
        [int]$AseNum = ($num1[0..($num1.length)] | Sort) -join ''
        [int]$num1 = $DesNum - $AseNum
        Write-Host "($i) $($DesNum) - $($AseNum) = $($num1)"
    }Until($num1 -eq "6174")
    if($i -gt 2)
        {
        Write-Host "Input : $num" -ForegroundColor Green
        Write-Host "Output: $i" -ForegroundColor Green
    }
    Else
        {
        Write-Host 'Invalid input' -ForegroundColor Red
    }
    
}
