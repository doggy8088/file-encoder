function Encode-File {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$FilePath,
        [Parameter(Position = 1)]
        [string]$SavePath = ($FilePath -replace '\.[^.]+$','.enc')
    )
    $bytes = Get-Content -Path $FilePath -Encoding Byte -Raw
    $hex = $bytes | ForEach-Object { $_.ToString("X2") }
    $hex = $hex -join " "
    Set-Content -Path $SavePath -Value $hex -Encoding Ascii -NoNewline
}

function Decode-File {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$FilePath,
        [Parameter(Mandatory = $true, Position = 1)]
        [string]$SavePath
    )
    $hex = Get-Content -Path $FilePath -Encoding Ascii -Raw
    $bytes = $hex.Split(' ') | ForEach-Object { [Convert]::ToByte($_, 16) }
    Set-Content -Path $SavePath -Value $bytes -Encoding Byte -NoNewline
}