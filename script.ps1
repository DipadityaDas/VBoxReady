# MIT License

# Copyright (c) March 2021 Dipaditya Das

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

function Test-Administrator  
{  
	[OutputType([bool])]
    param()
	process {
        [Security.Principal.WindowsPrincipal]$user = [Security.Principal.WindowsIdentity]::GetCurrent();
        return $user.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator);
    }
}

if(-not (Test-Administrator))
{
    Write-Error "This script must be executed as Administrator.";
    exit 1;
}

Write-Host "======================== VBoxReady (v1.0) ========================" -ForegroundColor Yellow
Write-Host " Author: Dipaditya Das.(https://www.linkedin.com/in/dipadityadas)" -ForegroundColor Blue
Write-Host "==================================================================" -ForegroundColor Yellow
Write-Host ""
Write-Host "[" -ForegroundColor Green -NoNewline
Write-Host "INFO" -ForegroundColor Cyan -NoNewline
Write-Host "] Running with Administrator Privileges" -ForegroundColor Green

# Changing the value of HypervisiorLauchType in Boot Configuration Data (BCD) file 
$bcdeditvalue = bcdedit /set hypervisorlaunchtype  Off
If ($bcdeditvalue -eq "The operation completed successfully.") {
	Write-Host "[" -ForegroundColor Green -NoNewline
	Write-Host "INFO" -ForegroundColor Cyan -NoNewline
	Write-Host "] Changed the value of hypervisorlaunchtype to off" -ForegroundColor Green
}

# Disabling Microsoft Hyper-V feature in Windows 10
$dismvalue = DISM /Online /Disable-feature:Microsoft-Hyper-V
If ($dismvalue -eq "The operation completed successfully.") {
	Write-Host "[" -ForegroundColor Green -NoNewline
	Write-Host "INFO" -ForegroundColor Cyan -NoNewline
	Write-Host "] Microsoft-Hyper-V has been successfully disabled." -ForegroundColor Green
}

# Restart Process
Write-Host "[" -ForegroundColor Green -NoNewline
Write-Host "INFO" -ForegroundColor Cyan -NoNewline
Write-Host "] System will restart in 10 Seconds." -ForegroundColor Green
Write-Host ""
Write-Host "Keep Learning and Keep Growing :)" -ForegroundColor Yellow
Write-Host ""
# shutdown /r /t 10
