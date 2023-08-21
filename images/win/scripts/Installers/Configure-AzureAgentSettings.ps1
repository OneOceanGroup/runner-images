################################################################################
##  File:  Configure-AzureAgentSettings.ps1
##  Desc:  Configure environment variables used to control the Azure DevOps Agent.
################################################################################

# Sets the work directory to be on the temporary disk, which should be at D:\
Set-SystemVariable -SystemVariable "VSTS_AGENT_INPUT_WORK" -Value "D:\a";

Invoke-PesterTests -TestFile "AzureAgent" -TestName "AgentSettings"