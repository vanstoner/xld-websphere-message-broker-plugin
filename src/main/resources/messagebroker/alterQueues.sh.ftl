<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->
<#if deployed.container.broker.mqsiprofile??>
source ${deployed.container.broker.mqsiprofile}
</#if>

<#list deployed.inputQueues as queue>
echo "alter qlocal(${queue}) GET(${action})"|runmqsc ${deployed.container.broker.queueManager}
</#list>
