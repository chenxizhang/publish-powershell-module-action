FROM demisto/powershell:7.2.1.26295
ADD ["entrypoint.ps1", "/data/"]
RUN chmod +x /data/entrypoint.ps1
ENTRYPOINT ["/data/entrypoint.ps1"]
