cls
"Checking status of printers..."
"Honors Printer..."
If(Test-Connection -Cn "130.101.41.38" -Count 1 -ea 0 -quiet){ "Online!" } Else { "Offline" }
"Library Color Copier..."
If(Test-Connection -Cn "130.101.224.107" -Count 1 -ea 0 -quiet){ "Online!" } Else { "Offline" }
"Library Color Printer..."
If(Test-Connection -Cn "130.101.224.98" -Count 1 -ea 0 -quiet){ "Online!" } Else { "Offline" }
"Library Copier..."
If(Test-Connection -Cn "130.101.224.195" -Count 1 -ea 0 -quiet){ "Online!" } Else { "Offline" }
"ASEC Library Printer 1..."
If(Test-Connection -Cn "130.101.90.66" -Count 1 -ea 0 -quiet){ "Online!" } Else { "Offline" }
"End Script"