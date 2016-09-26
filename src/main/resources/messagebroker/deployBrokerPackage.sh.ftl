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

<#if deployed.propertiesDirectory??>
  <#assign propsDir>${deployed.propertiesDirectory}</#assign>
<#else>
  <#assign propsDir>${environmentName}</#assign>
</#if>

<#if deployed.barfileName??>
  <#assign barfileName>${deployed.barfileName}</#assign>
<#else>
  <#assign barfileName>${deployed.name}</#assign>
</#if>

<#if deployed.container.broker.mqsiprofile??>
  source ${deployed.container.broker.mqsiprofile} 
</#if>

cat ${deployed.file.path}/${propsDir}/${barfileName}.properties

echo "Applying override mqsiapplybaroverride -b ${deployed.file.path}/${barfileName}.bar -p ${deployed.file.path}/${propsDir}/${barfileName}.properties -r"
mqsiapplybaroverride -b ${deployed.file.path}/${barfileName}.bar -p ${deployed.file.path}/${propsDir}/${barfileName}.properties -r

echo "Deploying BAR mqsideploy $brokerName -e ${deployed.container.name} -a ${deployed.file.path}/${barfileName}.bar  -w ${deployed.timeoutSecs}"
mqsideploy $brokerName -e ${deployed.container.name} -a ${deployed.file.path}/${barfileName}.bar  -w ${deployed.timeoutSecs}

