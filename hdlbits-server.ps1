$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8765/")
$listener.Start()

$repoFolder = "D:\Git\HDLBits-solutions"
$saveFolder = Join-Path $repoFolder "solutions"

if (!(Test-Path $saveFolder)) {
    New-Item -ItemType Directory -Path $saveFolder | Out-Null
}

Write-Host "=============================================="
Write-Host "HDLBits GitHub Automation Server"
Write-Host "=============================================="
Write-Host "Listening on http://localhost:8765/"
Write-Host "Repository: $repoFolder"
Write-Host "solutions:  $saveFolder"
Write-Host "Auto GitHub push: ENABLED"
Write-Host "Press Ctrl+C to stop."
Write-Host "=============================================="


# =========================================================
# HELPER: MAKE A SAFE WINDOWS/GITHUB FOLDER NAME
# =========================================================

function Get-SafeName($name) {

    if ([string]::IsNullOrWhiteSpace($name)) {
        return "Unknown"
    }

    $safe = $name -replace '[\\/:*?"<>|]', '_'

    $safe = $safe.Trim()

    if ([string]::IsNullOrWhiteSpace($safe)) {
        $safe = "Unknown"
    }

    return $safe
}


# =========================================================
# HELPER: BUILD PROBLEM FOLDER
# =========================================================

function Get-ProblemFolder($categoryPath, $problem) {

    $currentFolder = $saveFolder

    if ($categoryPath) {

        foreach ($category in $categoryPath) {

            if (![string]::IsNullOrWhiteSpace($category)) {

                $safeCategory = Get-SafeName $category

                $currentFolder =
                    Join-Path $currentFolder $safeCategory

            }
        }
    }

    $safeProblem = Get-SafeName $problem

    $problemFolder =
        Join-Path $currentFolder $safeProblem

    if (!(Test-Path $problemFolder)) {

        New-Item `
            -ItemType Directory `
            -Path $problemFolder `
            -Force | Out-Null
    }

    return $problemFolder
}


# =========================================================
# HELPER: DOWNLOAD PROBLEM IMAGES
# =========================================================

function Save-ProblemImages(
    $images,
    $problemFolder,
    $problemHtml
) {

    $imageNumber = 1

    if ($images) {

        foreach ($image in $images) {

            try {

                $imageUrl = $image.src

                if (
                    [string]::IsNullOrWhiteSpace($imageUrl)
                ) {
                    continue
                }


                # Determine extension

                try {

                    $uri = New-Object System.Uri($imageUrl)

                    $extension =
                        [System.IO.Path]::GetExtension(
                            $uri.AbsolutePath
                        )

                }
                catch {

                    $extension = ""
                }


                if (
                    [string]::IsNullOrWhiteSpace($extension) -or
                    $extension.Length -gt 6
                ) {
                    $extension = ".png"
                }


                $fileName =
                    "problem-image-$imageNumber$extension"

                $filePath =
                    Join-Path $problemFolder $fileName


                Write-Host ""
                Write-Host "Downloading problem image:"
                Write-Host $imageUrl


                Invoke-WebRequest `
                    -Uri $imageUrl `
                    -OutFile $filePath `
                    -UseBasicParsing


                Write-Host "Image saved:"
                Write-Host $filePath


                # Replace remote image URL in README HTML
                # with local image filename

                $problemHtml =
                    $problemHtml.Replace(
                        $imageUrl,
                        $fileName
                    )


                $imageNumber++

            }
            catch {

                Write-Host ""
                Write-Host "WARNING: Could not download image."
                Write-Host $_.Exception.Message
            }
        }
    }


    return $problemHtml
}


# =========================================================
# HELPER: CREATE README
# =========================================================

function Create-Readme(
    $problem,
    $problemHtml,
    $problemFolder,
    $problemFileName
) {

    $readmePath =
        Join-Path $problemFolder "README.md"


    $readme = @"
# $problem

## Problem

$problemHtml

---

**Source:** [HDLBits](https://hdlbits.01xz.net/wiki/$problem)
"@


    Set-Content `
        -Path $readmePath `
        -Value $readme `
        -Encoding UTF8


    Write-Host ""
    Write-Host "README created:"
    Write-Host $readmePath

    return $readmePath
}


# =========================================================
# HELPER: GIT PUSH
# =========================================================

function Push-ProblemToGitHub(
    $problemFolder
) {

    Write-Host ""
    Write-Host "=============================================="
    Write-Host "Starting GitHub automation..."
    Write-Host "=============================================="


    # Convert absolute path to relative Git path

    $relativeFolder =
        $problemFolder.Substring(
            $repoFolder.Length
        ).TrimStart(
            '\',
            '/'
        )


    # Convert Windows separators to Git separators

    $relativeFolder =
        $relativeFolder -replace '\\', '/'


    Write-Host "Git folder:"
    Write-Host $relativeFolder


    # Add entire problem folder

    git -C $repoFolder add -- $relativeFolder


    if ($LASTEXITCODE -ne 0) {
        throw "git add failed."
    }


    Write-Host "Git add: SUCCESS"


    # Commit

    $commitMessage =
        "Add HDLBits solution: $relativeFolder"


    git -C $repoFolder commit -m $commitMessage


    if ($LASTEXITCODE -eq 0) {

        Write-Host "Git commit: SUCCESS"

    }
    else {

        Write-Host "Git commit: Nothing new to commit."

    }


    # Push

    git -C $repoFolder push origin main


    if ($LASTEXITCODE -ne 0) {
        throw "git push failed."
    }


    Write-Host ""
    Write-Host "GitHub push: SUCCESS!"
    Write-Host "Solution, waveform and README are now on GitHub!"
}


# =========================================================
# MAIN SERVER LOOP
# =========================================================

while ($listener.IsListening) {

    $context = $listener.GetContext()

    $request = $context.Request
    $response = $context.Response


    Write-Host ""
    Write-Host "=============================================="
    Write-Host "Request received!"
    Write-Host "Method: $($request.HttpMethod)"
    Write-Host "URL: $($request.Url)"
    Write-Host "=============================================="


    # =====================================================
    # CORS / PREFLIGHT
    # =====================================================

    $response.Headers.Add(
        "Access-Control-Allow-Origin",
        "*"
    )

    $response.Headers.Add(
        "Access-Control-Allow-Headers",
        "Content-Type"
    )

    $response.Headers.Add(
        "Access-Control-Allow-Methods",
        "POST, GET, OPTIONS"
    )


    # Handle browser OPTIONS request

    if ($request.HttpMethod -eq "OPTIONS") {

        $response.StatusCode = 200

        $responseText = "CORS OK"

        $buffer =
            [System.Text.Encoding]::UTF8.GetBytes(
                $responseText
            )

        $response.ContentType = "text/plain"
        $response.ContentLength64 = $buffer.Length

        $response.OutputStream.Write(
            $buffer,
            0,
            $buffer.Length
        )

        $response.OutputStream.Close()

        continue
    }


    # =====================================================
    # READ REQUEST BODY
    # =====================================================

    $reader =
        New-Object System.IO.StreamReader(
            $request.InputStream
        )

    $body = $reader.ReadToEnd()

    $reader.Close()


    Write-Host "Data received:"
    Write-Host "Body size: $($body.Length) characters"


    # =====================================================
    # SAVE SOLUTION
    # =====================================================

    if (
        $request.HttpMethod -eq "POST" -and
        $request.Url.AbsolutePath -eq "/save"
    ) {

        Write-Host ""
        Write-Host "Saving HDLBits solution..."


        try {

            $data =
                $body | ConvertFrom-Json


            $problem =
                $data.problem

            $code =
                $data.code

            $url =
                $data.url

           $categoryPath = @($data.categoryPath)

Write-Host ""
Write-Host "CATEGORY DATA RECEIVED:"
Write-Host "Count: $($categoryPath.Count)"

foreach ($category in $categoryPath) {
    Write-Host "  -> [$category]"
}

            $problemHtml =
                $data.problemHtml

            $problemImages =
                $data.problemImages


            Write-Host "Problem: $problem"

            Write-Host "Category path:"

            if ($categoryPath) {

                foreach ($category in $categoryPath) {
                    Write-Host "  -> $category"
                }

            }


            # Build hierarchy

            $problemFolder =
                Get-ProblemFolder `
                    $categoryPath `
                    $problem


            Write-Host ""
            Write-Host "Problem folder:"
            Write-Host $problemFolder


            # Save Verilog

            $safeProblem =
                Get-SafeName $problem

            $verilogFileName =
                "$safeProblem.v"

            $verilogPath =
                Join-Path `
                    $problemFolder `
                    $verilogFileName


            Set-Content `
                -Path $verilogPath `
                -Value $code `
                -Encoding UTF8


            Write-Host ""
            Write-Host "VERILOG SUCCESS!"
            Write-Host "Saved:"
            Write-Host $verilogPath


            # Download problem images

            $problemHtml =
                Save-ProblemImages `
                    $problemImages `
                    $problemFolder `
                    $problemHtml


            # Create README

            Create-Readme `
                $problem `
                $problemHtml `
                $problemFolder `
                $safeProblem | Out-Null


            Write-Host ""
Write-Host "Solution files prepared."

# =================================================
# PUSH SOLUTION + README + IMAGES TO GITHUB
# =================================================

Write-Host ""
Write-Host "No waveform required for GitHub push."
Write-Host "Pushing solution files to GitHub..."

Push-ProblemToGitHub `
    $problemFolder

Write-Host ""
Write-Host "GitHub push: SUCCESS!"

$responseText =
    "SUCCESS: Solution, README and images pushed to GitHub!"

        }
        catch {

            Write-Host ""
            Write-Host "ERROR:"
            Write-Host $_.Exception.Message


            $response.StatusCode = 500

            $responseText =
                "ERROR: $($_.Exception.Message)"
        }
    }


    # =====================================================
    # SAVE WAVEFORM
    # =====================================================

    elseif (
        $request.HttpMethod -eq "POST" -and
        $request.Url.AbsolutePath -eq "/save-waveform"
    ) {

        Write-Host ""
        Write-Host "Saving HDLBits waveform..."


        try {

            $data =
                $body | ConvertFrom-Json


            $problem =
                $data.problem

            $svg =
                $data.svg

            $categoryPath =
                $data.categoryPath


            Write-Host "Problem: $problem"


            # Build same hierarchy

            $problemFolder =
                Get-ProblemFolder `
                    $categoryPath `
                    $problem


            $safeProblem =
                Get-SafeName $problem


            $waveformFileName =
                "$safeProblem.svg"


            $waveformPath =
                Join-Path `
                    $problemFolder `
                    $waveformFileName


            # Save SVG

            Set-Content `
                -Path $waveformPath `
                -Value $svg `
                -Encoding UTF8


            Write-Host ""
            Write-Host "WAVEFORM SUCCESS!"
            Write-Host "Saved:"
            Write-Host $waveformPath


            # =================================================
            # NOW PUSH EVERYTHING TO GITHUB
            # =================================================

            Push-ProblemToGitHub `
                $problemFolder


            $responseText =
                "SUCCESS: Solution, waveform, README and images pushed to GitHub!"

        }
        catch {

            Write-Host ""
            Write-Host "WAVEFORM/GIT ERROR:"
            Write-Host $_.Exception.Message


            $response.StatusCode = 500

            $responseText =
                "ERROR: $($_.Exception.Message)"
        }
    }


    # =====================================================
    # OTHER REQUESTS
    # =====================================================

    else {

        $responseText =
            "HDLBits GitHub server is running!"
    }


    # =====================================================
    # SEND RESPONSE
    # =====================================================

    $buffer =
        [System.Text.Encoding]::UTF8.GetBytes(
            $responseText
        )


    $response.ContentType =
        "text/plain"


    $response.ContentLength64 =
        $buffer.Length


    $response.OutputStream.Write(
        $buffer,
        0,
        $buffer.Length
    )


    $response.OutputStream.Close()
}