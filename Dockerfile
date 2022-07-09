FROM mcr.microsoft.com/powershell
ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1 \
    && apt-get update && \
      apt-get install -y apt-transport-https && \
      apt-get update && \
      apt-get install -y dotnet-sdk-3.1

    
ENTRYPOINT ["/data/entrypoint.ps1"]
