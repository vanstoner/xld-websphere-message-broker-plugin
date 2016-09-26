<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->

<#if deployed.container.broker.brokerSpec??>
  <#assign brokerName>${deployed.container.broker.brokerSpec}</#assign>
<#else>
  <#assign brokerName>${deployed.container.broker.name}</#assign>
</#if>

<#if deployed.container.broker.mqsiprofile??>
  source ${deployed.container.broker.mqsiprofile}
</#if>

<#list deployed.applications as app>
  <#if !app.managedApplication> 
    <#if app.monitorAllFlows>

mqsichangeflowmonitoring ${brokerName} -e ${deployed.container.name}  -k ${app.name} -j -c active

    <#else>
      <#list app.flowNames?keys as flowName>
        <#if app.flowNames[flowName] == "true">

mqsichangeflowmonitoring ${brokerName} -e ${deployed.container.name}  -k ${app.name} -f ${flowName} -c active

        </#if>
      </#list>
    </#if>
  <#else>
    <#if app.monitorAllFlows>

mqsichangeflowmonitoring ${brokerName} -e ${deployed.container.name}  -j -c active

    <#else>
      <#list app.flowNames?keys as flowName>
        <#if app.flowNames[flowName] == "true">

mqsichangeflowmonitoring ${brokerName} -e ${deployed.container.name}  -f ${flowName} -c active

        </#if>
      </#list>
    </#if>
  </#if>
  
</#list>


