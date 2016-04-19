﻿<#
Copyright 2016 Dominique Broeglin

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
#>

function Get-NSRewritePolicy {
    <#
    .SYNOPSIS
        Gets the specified rewrite policy object.

    .DESCRIPTION
        Gets the specified rewrite policy object.

    .EXAMPLE
        Get-NSRewritePolicy

        Get all rewrite policy objects.

    .EXAMPLE
        Get-NSRewritePolicy -Name 'foobar'
    
        Get the rewrite policy named 'foobar'.

    .PARAMETER Session
        The NetScaler session object.

    .PARAMETER Name
        The name or names of the rewrite policys to get.
    #>
    [cmdletbinding()]
    param(
        $Session = $Script:Session,

        [Parameter(Position=0)]
        [string[]]$Name = @()
    )

    begin {
        _AssertSessionActive
    }

    process {
        _InvokeNSRestApiGet -Session $Session -Type rewritepolicy -Name $Name
    }
}
