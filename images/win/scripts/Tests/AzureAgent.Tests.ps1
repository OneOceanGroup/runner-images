Describe "AgentSettings" {
    Context "Environment variable" {
        It "VSTS_AGENT_INPUT_WORK contains D:\a" {
            Get-SystemVariable -SystemVariable "VSTS_AGENT_INPUT_WORK" | Should -Be "D:\a"
        }
    }
}
