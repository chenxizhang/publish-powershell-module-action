FROM mcr.microsoft.com/powershell
ADD ["entrypoint.ps1", "/data/"]
ENTRYPOINT ["/data/entrypoint.ps1"]
