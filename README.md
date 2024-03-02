# file-encoder

This script helps people encode/decode any file to/from a byte-array encoded plain text file.

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
