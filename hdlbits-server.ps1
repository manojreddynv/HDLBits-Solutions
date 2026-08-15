$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8765/")
$listener.Start()

$saveFolder = "D:\Git\HDLBits-Solutions\solutions"

if (!(Test-Path $saveFolder)) {
    New-Item -ItemType Directory -Path $saveFolder | Out-Null
}

Write-Host "HDLBits Local Server is running!"
Write-Host "Listening on http://localhost:8765/"
Write-Host "Saving solutions to: $saveFolder"
Write-Host "Press Ctrl+C to stop."

while ($listener.IsListening) {

    $context = $listener.GetContext()

    $request = $context.Request
    $response = $context.Response

    Write-Host ""
    Write-Host "Request received!"
    Write-Host "Method: $($request.HttpMethod)"
    Write-Host "URL: $($request.Url)"

    $reader = New-Object System.IO.StreamReader($request.InputStream)
    $body = $reader.ReadToEnd()
    $reader.Close()

    Write-Host "Data received:"
    Write-Host $body

    if ($request.HttpMethod -eq "POST" -and $request.Url.AbsolutePath -eq "/save") {

        Write-Host "Saving solution..."

        try {
            $data = $body | ConvertFrom-Json

            $problem = $data.problem
            $code = $data.code
            $url = $data.url

            $safeName = $problem -replace '[\\/:*?"<>|]', '_'

            if ([string]::IsNullOrWhiteSpace($safeName)) {
                $safeName = "unknown_problem"
            }

            $filePath = Join-Path $saveFolder "$safeName.v"

            Set-Content -Path $filePath -Value $code -Encoding UTF8

            Write-Host "SUCCESS!"
            Write-Host "Problem: $problem"
            Write-Host "Saved: $filePath"

            $responseText = "SUCCESS: Solution saved!"
        }
        catch {
            Write-Host "ERROR: $($_.Exception.Message)"
            $response.StatusCode = 500
            $responseText = "ERROR: $($_.Exception.Message)"
        }

    }
    else {
        $responseText = "HDLBits server is running!"
    }

    # Allow Tampermonkey/HDLBits to communicate with localhost
    $response.Headers.Add("Access-Control-Allow-Origin", "*")

    $buffer = [System.Text.Encoding]::UTF8.GetBytes($responseText)

    $response.ContentType = "text/plain"
    $response.ContentLength64 = $buffer.Length

    $response.OutputStream.Write($buffer, 0, $buffer.Length)
    $response.OutputStream.Close()
}