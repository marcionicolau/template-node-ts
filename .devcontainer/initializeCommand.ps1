"REACT_NATIVE_PACKAGER_HOSTNAME="+$(Get-NetIPAddress -AddressFamily IPV4 -PrefixOrigin Dhcp).IPAddress | Out-File -FilePath ".devcontainer\\.env" -Encoding utf8
