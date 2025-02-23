param(
    [string]$dotnet="dotnet",
    [ValidateSet("Debug","Release")]
    [string]$configuration="Release"
)

Import-Module $PSScriptRoot\..\Common\helpers.psm1

Write-Comment -prefix "." -text "Building the Coyote samples" -color "yellow"

# Build the task-based samples.
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\AccountManager\AccountManager.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\BoundedBuffer\BoundedBuffer.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\CoffeeMachineTasks\CoffeeMachineTasks.sln" -config $configuration

# Build the actor samples.
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\HelloWorldActors\HelloWorldActors.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\CoffeeMachineActors\CoffeeMachineActors.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\DrinksServingRobotActors\DrinksServingRobotActors.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\CloudMessaging\CloudMessaging.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\Timers\Timers.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\Monitors\Monitors.sln" -config $configuration

# Build the web app samples.
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\WebApps\ImageGalleryAspNet\ImageGallery.sln" -config $configuration
Invoke-DotnetBuild -dotnet $dotnet -solution "$PSScriptRoot\..\WebApps\PetImagesAspNet\PetImages.sln" -config $configuration

Write-Comment -prefix "." -text "Successfully built the Coyote samples" -color "green"
