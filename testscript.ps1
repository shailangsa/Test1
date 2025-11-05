Import-Module CredentialManager

# Retrieve all stored credentials
		$allCredentials = Get-StoredCredential
		Start-Sleep -Seconds 2  
		# Filter by username
		$filteredCredentials = $allCredentials | Where-Object { $_.Username -eq 'usernameabc' }
		Start-Sleep -Seconds 2  
		# Display the filtered results (including password)
		$filteredCredentials | Select-Object Target, Username, Password | Format-Table -AutoSize
		Start-Sleep -Seconds 2  
		
		$filteredCredentials | ForEach-Object {
			$username = $_.Username
			$target = $_.Target
			$password = $_.Password | ConvertFrom-SecureString -AsPlainText
			[PSCustomObject]@{
				Target   = $target
				Username = $username
				Password = $password
			}
		} | Format-Table -AutoSize
		
		
		write-host "test"