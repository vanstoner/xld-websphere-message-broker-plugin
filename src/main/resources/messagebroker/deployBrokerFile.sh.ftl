<#--

    THIS CODE AND INFORMATION ARE PROVIDED "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND/OR FITNESS
    FOR A PARTICULAR PURPOSE. THIS CODE AND INFORMATION ARE NOT SUPPORTED BY XEBIALABS.

-->

# Set up the name for this broker - if supplied it is the BrokerSpec property or the infrastructure name of the broker component
<#if deployed.container.broker.brokerSpec??>
  brokerName=${deployed.container.broker.brokerSpec}
<#else>
  brokerName=${deployed.container.broker.name}
</#if>

<#if deployed.container.broker.mqsiprofile??>
  source ${deployed.container.broker.mqsiprofile}
</#if>


# Set up the barfile overrides if required
<#assign overrides=deployed.barOverrides>
<#list overrides?keys as key>
  echo ${key}=${overrides[key]} >> $(pwd)/${deployed.file.name}.overrides
</#list>

if [[ -f $(pwd)/${deployed.file.name}.overrides ]];
then
  echo "Applying the following overrides"
  cat $(pwd)/${deployed.file.name}.overrides
  echo mqsiapplybaroverride -b ${deployed.file.path} -p $(pwd)/${deployed.file.name}.overrides -r
else
  echo "No overrides to apply"
fi

# Perform deployment
echo mqsideploy $brokerName -e ${deployed.container.name} -a ${deployed.file.path}  -w ${deployed.timeoutSecs}

