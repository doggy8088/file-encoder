# file-encoder

This script helps people encode/decode any file to/from a byte-array encoded plain text file.

## Install

Simply install [file-encoder](https://www.powershellgallery.com/packages/file-encoder/) script from the PowerShell Gallery.

```ps1
Install-Module -Name file-encoder
```

## Usage

1. When encoding, no need to enter the `-SavePath` parameter, it will default to changing the file name from `a.zip` to `a.enc`

    ```ps1
    Encode-File .\a.zip
    Decode-File .\a.enc .\b.zip
    ```

2. When encoding, pass in the file to be read and the new file to be written

    ```ps1
    Encode-File .\a.zip .\a.txt
    Decode-File .\a.txt .\b.zip
    ```

    > The encoded file will always be a ASCII encoding plain text file.

3. When encoding, pass in the file to be read and the new file to be written, but explicitly specify parameter names

    ```ps1
    Encode-File -FilePath .\a.zip -SavePath .\a.txt
    Decode-File -FilePath .\a.txt -SavePath .\b.zip
    ```

## Publishing

1. Validate the script using `Invoke-ScriptAnalyzer` cmdlet

    ```ps1
    Install-Module -Name PSScriptAnalyzer
    ```

    ```ps1
    Invoke-ScriptAnalyzer -Path ./file-encoder.psm1
    ```

2. Test publishing for PowerShell Gallery

    With the following command, you can test whether the module can be successfully published. The `-WhatIf` parameter here will not actually publish your module, but rather test if there are any issues during the publishing process.

    ```ps1
    Publish-Module `
        -Path "G:\Projects\linqpad-folders-powershell-module\" `
        -NuGetApiKey $env:PowerShellGalleryApiKey `
        -WhatIf `
        -Verbose
    ```

3. Publish to PowerShell Gallery

    Simply remove the `-WhatIf` parameter to perform the actual publishing operation.

    ```ps1
    Publish-Module `
        -Path "G:\Projects\linqpad-folders-powershell-module\" `
        -NuGetApiKey $env:PowerShellGalleryApiKey `
        -Verbose
    ```

    Finally, if you see the following message, it means the publishing was successful!

    ```txt
    VERBOSE: Successfully published module 'linqpad-folders-powershell-module' to the module publish location 'https://www.powershellgallery.com/api/v2/package/'. Please allow few minutes for 'linqpad-folders-powershell-module' to show up in the search results.
    ```
