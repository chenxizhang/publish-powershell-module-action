FROM mcr.microsoft.com/powershell
ADD ["entrypoint.ps1", "/data/"]

RUN chmod +x /data/entrypoint.ps1 \
    && apt-get update \
    && apt-get install apt-transport-https wget --yes \
    && wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh
    && ./dotnet-install.sh --channel LTS
    
ENTRYPOINT ["/data/entrypoint.ps1"]
