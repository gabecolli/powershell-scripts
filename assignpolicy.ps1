$policy = Get-AzPolicyDefinition | where-object {$_.properties.displayname -eq 'Allowed resource types'}
New-AzPolicyAssignment -Name "test-policy-assignment" -PolicyDefinition $policy -Scope "/subscriptions/your sub id/resourceGroups/demo" -listOfResourceTypesAllowed 'filepath.json'
